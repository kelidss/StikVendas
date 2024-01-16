from flask import Flask, jsonify
from imap_tools import AND, MailBox

app = Flask(__name__)

@app.route('/fetch_emails', methods=['GET'])
def fetch_emails():
    usuario = 'kelianedss12@gmail.com'
    senha = ''
    meu_email = MailBox("imap.gmail.com").login(usuario, senha)

    listas_email = meu_email.fetch(AND(from_="analista_stik@gmail.com"))

    email_texts = []

    for email in listas_email:
        email_texts.append(email.text)

    meu_email.logout()

    return jsonify({'emails': email_texts})

if __name__ == '__main__':
    app.run(debug = True)
