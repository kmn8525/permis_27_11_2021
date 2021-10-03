import 'package:flutter/material.dart';


class ProfilExamen extends StatelessWidget {
  const ProfilExamen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bilan Theme'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Bilan Theme'),
          onPressed: () {

          },
        ),
      ),
    );
  }
}