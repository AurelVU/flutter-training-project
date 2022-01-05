import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationContent extends StatefulWidget {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  State<AuthorizationContent> createState() => _AuthorizationContentState();
}

class _AuthorizationContentState extends State<AuthorizationContent> {
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
          const Text('Логин'),
          TextFormField(
              controller: widget.loginController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Логин")),
          const Text('Пароль'),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: widget.passwordController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Пароль")),
          FlatButton(onPressed: () {}, child: const Text('Забыли пароль?')),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                        login: widget.loginController.text.trim(),
                        password: widget.passwordController.text.trim()));
                  },
                  child: const Text('Войти'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TabBloc>(context).add(ToRegistrationEvent());
                    },
                    child: const Text('Регистрация')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
