import 'package:flutter/material.dart';

void main()=>runApp(
    const MaterialApp(
      home:Gesture()
    )
);

class Gesture extends StatelessWidget {
  const Gesture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
           appBar: AppBar(
               title: const Text('appbar')
           ),
           body: const Center(
             child: MyButton(),
           ),
    );
  }
}


class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //使用GestureDetector 把控件包装起来就可以使用各种手势了 如点击啊  双击 等等
    return GestureDetector(
        // 定义一个单击事件
        onTap: (){
            print('单击事件');
        },
        onDoubleTap: (){
           print('双击事件');
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.cyan
            ),
            padding: const EdgeInsets.all(10.0),
            child: const Text('MyButton')
        ),
    );
  }
}


