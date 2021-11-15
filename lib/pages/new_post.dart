import 'package:app/widgets/new_post_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новая запись'),
      ),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(margin: const EdgeInsets.all(5), child: const Text('Новая запись', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
            Container(margin: const EdgeInsets.all(5), child: const Text('Заголовок', style: TextStyle(fontSize: 16))),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Заголовок")),
            ),
            Container(margin: const EdgeInsets.all(5), child: const Text('Текст', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
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
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    iconSize: 110,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: () {}, child: const Text('Отправить')),
                  ),
                ],
              ),
            ),
          ],
        ),]
      )
      ,
    );
  }
}
