from flask import Flask, request, jsonify
from flask_cors import CORS
import pandas as pd

app = Flask(__name__)
CORS(app)

# Carrega o CSV uma vez ao iniciar
df = pd.read_csv('Relatorio_cadop.csv', delimiter=';', encoding='latin1')

@app.route('/buscar-operadoras', methods=['GET'])
def buscar_operadoras():
    termo = request.args.get('q', '').strip().lower()

    if not termo:
        return jsonify([])

    resultados = df[df['Razao_Social'].str.lower().str.contains(termo, na=False)].head(10)

    return jsonify(resultados.to_dict(orient='records'))

if __name__ == '__main__':
    app.run(debug=True)
