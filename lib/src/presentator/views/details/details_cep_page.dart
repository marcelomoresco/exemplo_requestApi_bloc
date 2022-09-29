import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/viacep_bloc/viacep_bloc.dart';

class DetailsCepPage extends StatelessWidget {
  const DetailsCepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: BlocBuilder<ViacepBloc, ViacepState>(
        builder: (context, state) {
          if (state is ViacepLoadedState) {
            return Column(children: [
              Center(
                child: Column(children: [
                  Text(state.cep.logradouro,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ]),
              )
            ]);
          } else if (state is ViacepLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              child: Text("Algo deu muito errado!"),
            );
          }
        },
      ),
    );
  }
}
