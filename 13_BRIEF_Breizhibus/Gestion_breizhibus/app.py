from flask import Flask, render_template, request
from connexion_bdd import Connexion

app = Flask(__name__)

@app.route('/')
def index() :
    Connexion.ouvrir_connexion()
    lst_ligne = Connexion.lister_ligne()
    Connexion.fermer_connexion()
    return render_template('index.html', lin=lst_ligne)

@app.route('/rouge', methods=["POST"])
def rouge():
    ligne=""
    Connexion.ouvrir_connexion()
    ligne=request.values.get("Ligne")
    print("\n==================\n", ligne)
    arrets= Connexion.lister_arret_tri(ligne)
    Connexion.fermer_connexion()
    return render_template('index_choisi.html', arr=arrets)

@app.route('/connexion')
def connexion():
    return render_template('connexion.html')

@app.route('/gestion', methods=['POST'])
def gestion():    
    login = request.values.get('user')
    mdp = request.values.get('mdp')

    Connexion.ouvrir_connexion()

    if login == None:
        if request.values.get('choix_modifs') == "ajout":

            droits = request.values.get('droits')

            num = request.values.get('n_bus') # numero bus
            immat = request.values.get('immat') # immatriculation bus
            nb_place = request.values.get('nb_place')
            id_ligne = request.values.get('ligne')

            Connexion.Add_bus(num, immat, nb_place, id_ligne)

        elif request.values.get('choix_modifs') == "modif":
            
            droits = request.values.get('droits')

            id_bus = request.values.get('id_bus') # id bus
            id_ligne = request.values.get('ligne') # id ligne

            Connexion.Maj_bus(id_bus, id_ligne)
        
        elif request.values.get('choix_modifs') == "supp":
            
            droits = request.values.get('droits')

            id_bus = request.values.get('id_bus') # id bus

            Connexion.Sup_bus(id_bus)

    else:
        droits = Connexion.check_user(login, mdp)
    
    

    bus = Connexion.lister_bus()
    arrets = Connexion.lister_arret()
    lignes = Connexion.lister_ligne()
    Connexion.fermer_connexion()
    
    return render_template('gestion.html', droits = droits, bus = bus, arrets = arrets, lignes = lignes )


if __name__== "__main__" :
    app.run(debug=True, port=5001)