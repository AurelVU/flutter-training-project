import 'package:app/blocs/post/post_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class NewPostPage extends StatefulWidget {
  var titleController = TextEditingController();
  var textController = TextEditingController();

  List<String> paths = [];
  List<Image> images = [];

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
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
      widget.paths.add(xFile.path);
      widget.images.add(await convertXFile2ImageWidget(xFile));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая запись'),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                child: const Text('Новая запись',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
            Container(
                margin: const EdgeInsets.all(5),
                child: const Text('Заголовок', style: TextStyle(fontSize: 16))),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                  controller: widget.titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Заголовок")),
            ),
            Container(
                margin: const EdgeInsets.all(5),
                child: const Text('Текст',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                  controller: widget.textController,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Текст")),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  IconButton(
                    icon: widget.images.isNotEmpty
                        ? widget.images[0]
                        : const Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () async {
                      await addImage();
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: widget.images.length > 1
                        ? widget.images[1]
                        : const Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () async {
                      await addImage();
                      setState(() {});
                    },
                  ),
                  IconButton(
                    icon: widget.images.length > 2
                        ? widget.images[2]
                        : const Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () async {
                      await addImage();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<PostBloc>(context).add(
                              PostsAddedEvent(
                                  text: widget.textController.text,
                                  title: widget.titleController.text,
                                  imagePaths: widget.paths));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Отправить')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
