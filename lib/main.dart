import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viacep_project/src/external/service/cep_service_imp.dart';
import 'package:viacep_project/src/presentator/blocs/viacep_bloc/viacep_bloc.dart';
import 'package:viacep_project/src/presentator/views/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViacepBloc>(
      create: (context) => ViacepBloc(cepServiceImp: HttpCepServiceImp())
        ..add(const LoadViaCepEvent(searchCep: "89255430")),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
