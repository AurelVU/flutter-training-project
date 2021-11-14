import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Добро пожаловать'),
          Text('Авторизация'),
          Text('Email'),
          TextField(),
          Text('Password'),
          TextField(),
          FlatButton(onPressed: () {}, child: Text('Забыли пароль?')),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  RepositoryProvider.of<AuthenticationRepository>(context)
                      .logIn(password: 'test', username: 'test');
                },
                child: Text('Войти'),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    RepositoryProvider.of<AuthenticationRepository>(context)
                        .logIn(password: 'test', username: 'test');
                  },
                  child: Text('Регистрация')),
            ],
          )
        ],
      ),
    );
  }
}
