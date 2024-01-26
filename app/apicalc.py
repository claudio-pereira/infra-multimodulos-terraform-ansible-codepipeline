from flask import Flask, request, render_template, redirect
from flask_restx import Api, Resource

app = Flask(__name__)
api = Api(app, version='1.0', title='API de Operações Matemáticas', description='API para realizar operações matemáticas.')

def calcular_subtracao(term_one, term_two):
    return term_one - term_two

def calcular_multiplicacao(term_one, term_two):
    return term_one * term_two

def calcular_divisao(term_one, term_two):
    if term_two == 0:
        return "Erro: divisão por zero"
    return term_one / term_two

def calcular_adicao(term_one, term_two):
    return term_one + term_two

@api.route('/subtracao')
class Subtracao(Resource):
    @api.doc(params={'term_one': 'Primeiro termo', 'term_two': 'Segundo termo'})
    def get(self):
        """
        Subtração de dois números.
        """
        term_one = int(request.args.get('term_one'))
        term_two = int(request.args.get('term_two'))
        resultado = calcular_subtracao(term_one, term_two)
        return {'result': resultado}

@api.route('/multiplicacao')
class Multiplicacao(Resource):
    @api.doc(params={'term_one': 'Primeiro termo', 'term_two': 'Segundo termo'})
    def get(self):
        """
        Multiplicação de dois números.
        """
        term_one = int(request.args.get('term_one'))
        term_two = int(request.args.get('term_two'))
        resultado = calcular_multiplicacao(term_one, term_two)
        return {'result': resultado}

@api.route('/divisao')
class Divisao(Resource):
    @api.doc(params={'term_one': 'Numerador', 'term_two': 'Denominador'})
    def get(self):
        """
        Divisão de dois números.
        """
        term_one = int(request.args.get('term_one'))
        term_two = int(request.args.get('term_two'))
        resultado = calcular_divisao(term_one, term_two)
        return {'result': resultado}

@api.route('/soma')
class Adicao(Resource):
    @api.doc(params={'term_one': 'Primeiro termo', 'term_two': 'Segundo termo'})
    def get(self):
        """
        Adição de dois números.
        """
        term_one = int(request.args.get('term_one'))
        term_two = int(request.args.get('term_two'))
        resultado = calcular_adicao(term_one, term_two)
        return {'result': resultado}

@app.route('/calc')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(port=8000, debug=True)
