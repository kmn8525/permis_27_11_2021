import 'package:flutter/material.dart';


class ProfiHistorique extends StatelessWidget {
  const ProfiHistorique({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Historique '),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Profil Historique'),
          onPressed: () {

          },
        ),
      ),
    );
  }
}