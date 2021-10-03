import 'package:flutter/material.dart';


class ProfilUtilisateur extends StatelessWidget {
  const ProfilUtilisateur({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilan Utilisateur'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Bilan Utilisateur'),
          onPressed: () {

          },
        ),
      ),
    );
  }
}