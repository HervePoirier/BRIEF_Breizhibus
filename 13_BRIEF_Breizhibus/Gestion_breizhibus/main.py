from classes import Users
from connexion_bdd import Connexion
from log import login

def main():
    Connexion.ouvrir_connexion()
    les_bus = Connexion.lister_bus()
    users = Connexion.lister_utilisateurs()
    arrets = Connexion.lister_arret()
    lignes = Connexion.lister_ligne()
    # login()
    # Connexion.Add_bus('BB05', 'FRR 45 YT', 30, 3)
    # Connexion.Maj_bus(18,1)
    # Connexion.Sup_bus(18)
    Connexion.fermer_connexion()
    for i in les_bus :
        print(i.numero, i.id, i.immatriculation, i.id_ligne)

main()