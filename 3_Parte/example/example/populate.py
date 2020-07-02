from models import Pessoa, Realiza
from random import randint, randrange
import random
from django.utils import timezone
import datetime

nomes = ['Caio', 'Cristopher', 'Daniel', 'Ernesto', 'Flavio', 'Felipe', 'Fernando', 'Gustavo', 'Georgia', 'Heitor', 'Igor', 'Ian', 'João', 'Julia', 'Jonas', 'Kevin',
         'Lucas', 'Luisa', 'Cristina', 'Bruna', 'Brenda', 'Marina', 'Marco', 'Margarida',
         'Mirtes', 'Natalia', 'Orivaldo', 'Orlando', 'Olga', 'Paulo', 'Priscila', 'Roberto',
         'Roberta', 'Susana', 'Telma', 'Vitor', 'Mike']

sobrenomes = ['Silva', 'Souza', 'Castro', 'Rocha', 'Leal', 'Prudente', 'Fontes',
              'Rodrigues', 'Santana', 'Lima', 'Pina', 'Ferraz']

p = []

for n in nomes:
    for s in sobrenomes:
        p.append(Pessoa(
            cpf=''.join([str(randint(0, 9)) for i in range(11)]),
            nome=n + ' ' + s,
            data_de_nascimento=datetime.date(
                randint(1930, 2020), randint(1, 12), randint(1, 28)),
            endereco='Rua Vergueiro ' + str(randint(0, 4400)))
        )

for pessoa in p:
    pessoa.save()


def random_date(start, end):
    """
    This function will return a random datetime between two datetime
    objects.
    """
    delta = end - start
    int_delta = delta.total_seconds()
    random_second = randrange(int_delta)
    return start + timedelta(seconds=random_second)


r = []
for pac in pacientes:
    r.append(Realiza(
        id_paciente=pac,
        id_exame=random.choice(exames),
        data_de_solicitacao=random_date(
            datetime(1990, 1, 1, 0, 0),
            datetime(2020, 7, 1, 0, 0)
        ))
    )

for real in r:
    real.save()
