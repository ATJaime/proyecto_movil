import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _gradeController,
              decoration: InputDecoration(labelText: 'Grado'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar la lógica de registro del usuario
                String name = _nameController.text;
                String grade = _gradeController.text;
                String username = _usernameController.text;

                // Por ejemplo, puedes imprimir los valores ingresados
                print('Nombre: $name');
                print('Grado: $grade');
                print('Usuario: $username');

                // Puedes realizar la lógica de registro aquí

                // Y luego, si el registro es exitoso, puedes navegar a otra página
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) => MyHomePage(),
                // ));
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
