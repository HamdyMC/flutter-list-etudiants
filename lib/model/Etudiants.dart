  class Etudiants {
    String nom;
    String prenom;
    String email;
    String classe;
    String matricule;

    Etudiants({
      required this.nom,
      required this.prenom,
      required this.email,
      required this.classe,
      required this.matricule,
    });
    factory Etudiants.fromJson(Map<String, dynamic> json) {
      return Etudiants(
        nom: json['nom'],
        prenom: json['prenom'],
        email: json['email'],
        classe: json['classe'],
        matricule: json['matricule'],
      );
    }
  }
