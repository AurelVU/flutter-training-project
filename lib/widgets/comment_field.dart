import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentTextWidget extends StatefulWidget {
  TextEditingController controller;
  int maxLenght = 150;

  CommentTextWidget(this.controller, {Key? key}) : super(key: key);

  @override
  State<CommentTextWidget> createState() => _CommentTextWidgetState();
}

class _CommentTextWidgetState extends State<CommentTextWidget> {
  Color color = Colors.black;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      if (widget.controller.text.length >= widget.maxLenght * 0.6) {
        setState(() {
          errorText =
              'Осталось ${widget.maxLenght - widget.controller.text.length} символов';
        });
        if (widget.controller.text.length > widget.maxLenght) {
          widget.controller.text = widget.controller.text
              .substring(0, widget.controller.text.length - 1);
        }
      } else {
        errorText = null;
      }
    });
    return TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            errorText: errorText,
            border: OutlineInputBorder(),
            hintText: "Комментарий"));
  }
}
