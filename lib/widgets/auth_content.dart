import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationContent extends StatelessWidget {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: const Text('Добро пожаловать',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: const Text('Авторизация',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          Text('Email'),
          TextFormField(
              controller: loginController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Email")),
          Text('Password'),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Пароль")),
          FlatButton(onPressed: () {}, child: Text('Забыли пароль?')),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                        login: loginController.text.trim(),
                        password: passwordController.text.trim()));
                  },
                  child: Text('Войти'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Регистрация')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
