import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/viacep_bloc/viacep_bloc.dart';
import '../details/details_cep_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _cepController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Consulta de CEP",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text("Digite seu CEP e verifique as informações!"),
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Digite seu CEP",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_cepController.text.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "CEP deve ter mais que 8 caracteres",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ));
                } else if (_cepController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Campo deve ser preenchido",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
                context.read<ViacepBloc>().add(
                      LoadViaCepEvent(
                        searchCep: _cepController.text.trim(),
                      ),
                    );
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DetailsCepPage()));
              },
              child: const Text("Consultar"),
            ),
          ],
        ),
      ),
    );
  }
}
