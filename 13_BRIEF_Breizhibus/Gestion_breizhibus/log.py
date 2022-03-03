from classes import Users
from connexion_bdd import Connexion

def login() :
    
    users = Connexion.lister_utilisateurs()

    for user in users :
            print(user.identifiant)
    for user in users :
            print(user.mdp)

    loop_nom = True
    while (loop_nom == True):

        username = input("Entrez votre identifiant : ")
        password = input("Entrez votre mot de passe: ")
        for user in users :
            if (username == user.identifiant) and (password == user.mdp):
                print ("Connecté avec succès en tant que ", username)
                loop_nom = False
                break
            else:
                print ("Identifiant ou mot de passe incorrect")

    log_id = username
    log_mdp = user.mdp