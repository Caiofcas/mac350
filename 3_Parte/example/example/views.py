from django.shortcuts import render
from django.http import HttpResponse
#from .models import Usuario
#from .models import Perfil
from django.db import connection
from collections import namedtuple
from django.template import loader


def index(request):
    return HttpResponse("MAC0350/2020: Data Management Example")


def query1(request):
    """
    Lists CPF, name, login, birth date and area of
    research
    """
    with connection.cursor() as cursor:
        cursor.execute('SELECT * FROM (\
            example_usuario as u \
            JOIN\
            example_pessoa as p \
            ON u.cpf_pessoa_id = p.cpf)')
        result = named_tuple_fetchall(cursor)

    template = loader.get_template('example/query1.html')
    context = {'query1_result_list': result, }

    return HttpResponse(template.render(context, request))


def query2(request):
    """
    Lists name, profile and available services
    """
    with connection.cursor() as cursor:

        query = 'SELECT p.nome as nome_pessoa, perf.tipo, \
            serv.nome FROM (example_usuario as u JOIN \
            example_usuario_possui_perfil as possui ON \
            u.id_usuario = possui.usuario_id JOIN \
            example_perfil as perf ON possui.perfil_id = \
            perf.id_perfil JOIN example_pessoa as p ON \
            u.cpf_pessoa_id = p.cpf JOIN example_pertence \
            as pertence ON pertence.perfil_id = \
            perf.id_perfil JOIN example_servico as serv ON \
            pertence.servicos_id = serv.id_servico)'
        cursor.execute(query)
        result = named_tuple_fetchall(cursor)

    results_dict = {}  # key: Dict_key - val: str
    Dict_key = namedtuple('Key', 'nome perfil')
    for r in result:
        key = Dict_key(r[0], r[1])
        val = results_dict.get(key)
        if val is None:
            results_dict[key] = r[-1]
        else:
            results_dict[key] = ','.join([val, r[-1]])

    template = loader.get_template('example/query2.html')
    context = {'query2_result_dict': results_dict, }

    return HttpResponse(template.render(context, request))


def query3(request):
    """
        Returns the user ands its tutor
    """
    query = "SELECT pessoa_tutorada.nome as tutorado, pessoa_tutora.nome as tutor \
            FROM example_usuario as usuario_tutelado \
            JOIN         \
                example_tutelamento as tutelamento \
                ON usuario_tutelado.id_usuario = tutelamento.id_usuario_tutelado_id \
            JOIN \
                example_usuario as usuario_tutor \
                ON usuario_tutor.id_usuario = tutelamento.id_tutor_id \
            JOIN example_pessoa as pessoa_tutorada\
                ON pessoa_tutorada.cpf = usuario_tutelado.cpf_pessoa_id \
            JOIN \
                example_pessoa as pessoa_tutora \
                ON pessoa_tutora.cpf = usuario_tutor.cpf_pessoa_id"

    with connection.cursor() as cursor:
        cursor.execute(query)
        result = named_tuple_fetchall(cursor)

    # remove duplicates
    result = list(set(result))

    template = loader.get_template('example/query3.html')
    context = {'query3_result_list': result, }

    return HttpResponse(template.render(context, request))

# metodos auxiliares


def named_tuple_fetchall(cursor):
    desc = cursor.description
    nt_result = namedtuple('Result', [col[0] for col in desc])
    result = [nt_result(*row) for row in cursor.fetchall()]

    return result
