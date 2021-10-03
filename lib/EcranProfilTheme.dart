import 'package:flutter/material.dart';


class ProfiTheme extends StatelessWidget {
  const ProfiTheme({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Theme '),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Profil Theme'),
          onPressed: () {

          },
        ),
      ),
    );
  }
}