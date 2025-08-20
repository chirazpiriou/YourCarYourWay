CREATE TABLE utilisateur (
    id VARCHAR(36) PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255) UNIQUE,
    mot_de_passe_hash VARCHAR(255),
    date_naissance DATE,
    adresse TEXT,
    date_creation DATETIME,
    date_derniere_connexion DATETIME,
    est_supprime TINYINT(1),
    role VARCHAR(50)
);

CREATE TABLE agence (
    id VARCHAR(36) PRIMARY KEY,
    nom VARCHAR(100),
    adresse TEXT,
    ville VARCHAR(100),
    pays VARCHAR(100),
    telephone VARCHAR(50)
);

CREATE TABLE categorie_vehicule (
    code_acriss VARCHAR(10) PRIMARY KEY,
    description TEXT
);

CREATE TABLE vehicule (
    id VARCHAR(36) PRIMARY KEY,
    immatriculation VARCHAR(50) UNIQUE,
    marque VARCHAR(100),
    modele VARCHAR(100),
    categorie_acriss VARCHAR(10),
    agence_actuelle_id VARCHAR(36),
    disponible TINYINT(1),
    annee INT,
    FOREIGN KEY (categorie_acriss) REFERENCES categorie_vehicule(code_acriss),
    FOREIGN KEY (agence_actuelle_id) REFERENCES agence(id)
);

CREATE TABLE offre_location (
    id VARCHAR(36) PRIMARY KEY,
    ville_depart VARCHAR(100),
    ville_retour VARCHAR(100),
    date_heure_debut DATETIME,
    date_heure_retour DATETIME,
    categorie_vehicule_code_acriss VARCHAR(10),
    tarif_jour DECIMAL(10,2),
    tarif_total DECIMAL(10,2),
    FOREIGN KEY (categorie_vehicule_code_acriss) REFERENCES categorie_vehicule(code_acriss)
);

CREATE TABLE reservation (
    id VARCHAR(36) PRIMARY KEY,
    utilisateur_id VARCHAR(36),
    offre_location_id VARCHAR(36),
    vehicule_id VARCHAR(36),
    date_reservation DATETIME,
    date_debut_reelle DATETIME,
    date_fin_reelle DATETIME,
    agence_depart_id VARCHAR(36),
    agence_retour_id VARCHAR(36),
    statut VARCHAR(50),
    montant_total DECIMAL(10,2),
    montant_rembourse DECIMAL(10,2),
    conditions_annulation_appliquees TEXT,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id),
    FOREIGN KEY (offre_location_id) REFERENCES offre_location(id),
    FOREIGN KEY (vehicule_id) REFERENCES vehicule(id),
    FOREIGN KEY (agence_depart_id) REFERENCES agence(id),
    FOREIGN KEY (agence_retour_id) REFERENCES agence(id)
);

CREATE TABLE paiement (
    id VARCHAR(36) PRIMARY KEY,
    reservation_id VARCHAR(36),
    montant DECIMAL(10,2),
    devise VARCHAR(10),
    reference_transaction_externe VARCHAR(100) UNIQUE,
    date_paiement DATETIME,
    statut VARCHAR(50),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE message_support (
    id VARCHAR(36) PRIMARY KEY,
    utilisateur_id VARCHAR(36),
    objet VARCHAR(255),
    message_initial TEXT,
    date_envoi DATETIME,
    statut VARCHAR(50),
    historique_reponses JSON, -- MySQL accepte JSON
    type_contact VARCHAR(50),
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id)
);
