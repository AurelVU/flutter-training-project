import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationContent extends StatelessWidget {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var password2Controller = TextEditingController();
  var websiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5.0),
            child: const Text('Добро пожаловать',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: const Text('Регистрация',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          const Text('Логин'),
          TextFormField(
              controller: loginController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Логин")),
          const Text('website'),
          TextFormField(
              controller: websiteController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "website")),
          const Text('Имя'),
          TextFormField(
              controller: firstnameController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Имя")),
          const Text('Фамилия'),
          TextFormField(
              controller: lastnameController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Фамилия")),
          const Text('Пароль'),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Пароль")),
          const Text('Повторить пароль'),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: password2Controller,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Повторить пароль")),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (passwordController.text.trim() ==
                        password2Controller.text.trim()) {
                      BlocProvider.of<AuthBloc>(context).add(RegistrationEvent(
                          login: loginController.text.trim(),
                          password: passwordController.text.trim(),
                          email: '',
                          website: websiteController.text.trim(),
                          firstname: firstnameController.text.trim(),
                          lastname: lastnameController.text.trim()));
                    }
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
                      BlocProvider.of<TabBloc>(context)
                          .add(ToAuthorizationEvent());
                    },
                    child: const Text('Авторизация')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
