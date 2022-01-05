import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingScreen extends StatelessWidget {
  const AddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                    Navigator.of(context).pop();
                  },
                  child: const Text('Выйти'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Удалить аккаунт'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red))),
            ]),
          ),
        ));
  }
}
