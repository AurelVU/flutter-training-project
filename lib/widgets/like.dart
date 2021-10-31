// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Like extends StatefulWidget{
//   const Like({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => LikeState();
// }
//
// class LikeState extends State<Like> {
//   Color iconColor = Colors.white;
//   final _controller = AnimationController(
//   vsync: this,
//   duration: Duration(milliseconds: 200),
//   );
//
//   final _myAnimation = CurvedAnimation(
//   curve: Curves.linear,
//   parent: _controller
//   );
//
//   @override
//   Widget build(BuildContext) {
//     return IconButton(icon: const AnimatedIcon(icon: AnimatedIcons., color: Colors.white, progress: ),
//       onPressed: () {
//           setState(() {
//             if (iconColor == Colors.pink) {
//               iconColor = Colors.white;
//             } else {
//               iconColor = Colors.pink;
//             }
//           }
//         );
//       },
//     );
//   }
// }