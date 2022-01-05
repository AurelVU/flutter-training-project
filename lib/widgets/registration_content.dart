import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:app/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationContent extends StatefulWidget {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var password2Controller = TextEditingController();
  var websiteController = TextEditingController();

  @override
  State<RegistrationContent> createState() => _RegistrationContentState();
}

class _RegistrationContentState extends State<RegistrationContent> {


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
              controller: widget.loginController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Логин")),
          const Text('website'),
          TextFormField(
              controller: widget.websiteController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "website")),
          const Text('Имя'),
          TextFormField(
              controller: widget.firstnameController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Имя")),
          const Text('Фамилия'),
          TextFormField(
              controller: widget.lastnameController,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Фамилия")),
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
          const Text('Повторить пароль'),
          TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: widget.password2Controller,
              // указываем для поля границу,
              // иконку и подсказку (hint)
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Повторить пароль")),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.passwordController.text.trim() ==
                        widget.password2Controller.text.trim()) {
                      BlocProvider.of<AuthBloc>(context).add(RegistrationEvent(
                          login: widget.loginController.text.trim(),
                          password: widget.passwordController.text.trim(),
                          email: '',
                          website: widget.websiteController.text.trim(),
                          firstname: widget.firstnameController.text.trim(),
                          lastname: widget.lastnameController.text.trim()));
                    }
                  },
                  child: const Text('Регистрация'),
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
