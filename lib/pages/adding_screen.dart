import 'package:app/blocs/auth/auth_bloc.dart';
import 'package:app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddingScreen extends StatefulWidget {
  AddingScreen({Key? key}) : super(key: key);

  bool isEditing = false;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController website = TextEditingController();

  String? path;
  Image? image;

  @override
  State<AddingScreen> createState() => _AddingScreenState();
}

class _AddingScreenState extends State<AddingScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<Image> convertXFile2ImageWidget(XFile xFile) async {
    var path = xFile.path;
    var bytes = await File(path).readAsBytes();
    Image image = Image.memory(bytes);
    return image;
  }

  addImage() async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      widget.path = xFile.path;
      widget.image = await convertXFile2ImageWidget(xFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.isEditing = !widget.isEditing;
                    });
                  },
                  child: const Text('Изменить профиль')),
              widget.isEditing
                  ? FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          User user = snapshot.data as User;
                          widget.firstname.text = user.firstname;
                          widget.lastname.text = user.lastname;
                          widget.website.text = user.link;
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                    controller: widget.firstname,
                                    decoration: const InputDecoration.collapsed(
                                        border: OutlineInputBorder(),
                                        hintText: 'Имя')),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                    controller: widget.lastname,
                                    decoration: const InputDecoration.collapsed(
                                        border: OutlineInputBorder(),
                                        hintText: 'Фамилия')),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                    controller: widget.website,
                                    decoration: const InputDecoration.collapsed(
                                        border: OutlineInputBorder(),
                                        hintText: 'Ссылка на вебсайт')),
                              ),
                              IconButton(
                                icon: widget.image ?? const Icon(Icons.add_a_photo),
                                iconSize: 110,
                                onPressed: () async {
                                  await addImage();
                                  setState(() {});
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<AuthBloc>(context).
                                    add(EditProfile(
                                      firstname: widget.firstname.text,
                                      lastname: widget.lastname.text,
                                      website: widget.website.text,
                                      imagePath: widget.path
                                    ));
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Применить изменения'))
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                      future: BlocProvider.of<AuthBloc>(context).user)
                  : const SizedBox(),
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
