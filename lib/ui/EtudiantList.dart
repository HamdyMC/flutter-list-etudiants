import 'package:flutter/material.dart';
import 'package:rattrapage_list/model/Etudiants.dart';
import 'package:rattrapage_list/service/apiService.dart';

class EtudiantListScreen extends StatefulWidget {
  @override
  _EtudiantListScreenState createState() => _EtudiantListScreenState();
}

class _EtudiantListScreenState extends State<EtudiantListScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Etudiants>> _etudiants; 
  String? _selectedClass;

  @override
  void initState() {
    super.initState();
    _loadEtudiants(); 
  }

  void _loadEtudiants({String? classe}) {
      setState(() {
      _etudiants =
          _apiService.fetchEtudiants(classe: classe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedClass,
            hint: Text('Filtrer par classe'),
            onChanged: (value) {
              setState(() {
                _selectedClass = value;
                _loadEtudiants(
                    classe: value);
              });
            },
            items: [
              DropdownMenuItem(value: null, child: Text('Toutes les classes')),
              DropdownMenuItem(value: 'MA1', child: Text('MA1')),
              DropdownMenuItem(value: 'MA2', child: Text('MA2'))
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Etudiants>>(
              future: _etudiants,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final etudiant = snapshot
                          .data![index]; 
                      return ListTile(
                        title: Text('${etudiant.prenom} ${etudiant.nom}'),
                        subtitle: Text(
                            '${etudiant.classe} - ${etudiant.matricule} - ${etudiant.email}'),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
