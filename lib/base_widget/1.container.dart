import 'dart:math';

import 'package:flutter/material.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  注意:这里所有的都是widgets 可以理解成前端的div
    return MaterialApp(
      title: 'Widget组件之container',
      home: Scaffold(
        appBar: AppBar(
          title: Text('container示例Demo'),
        ),
         body: Center(
              // Container可以理解为一个盒子 盒子里面是可以child
             child: Container(
                 width: 400,
                 height: 400,
                 decoration: BoxDecoration(
                     border: Border.all(
                       color: Colors.green,
                       width: 10.0,
                     ),
                     borderRadius: BorderRadius.all(Radius.circular(20.0))
                 ),
                 child: Container(
                   padding: EdgeInsets.all(30.0),
                   margin: EdgeInsets.all(30),
                   width: 180,
                   height: 180,
                   decoration: BoxDecoration(
                       border: Border.all(
                         color: Colors.red,
                         width: 10.0,
                       ),
                       borderRadius: BorderRadius.all(Radius.circular(20.0))
                   ),
                   // transform: Matrix4.rotationZ(pi/9),
                   // color: Colors.red,//背景色
                   child: Text('container',style: TextStyle(fontSize: 28.0),

                   ),
                 )
             ),
         ),
      ),
    );
  }
}

