import 'package:flutter/material.dart';

void main()=>runApp(const 
  MaterialApp(
     home: MyThreeWidget(),
)
);

class MyThreeWidget extends StatefulWidget {
  const MyThreeWidget({Key? key}) : super(key: key);

  @override
  State<MyThreeWidget> createState() => _MyThreeWidgetState();
}

class _MyThreeWidgetState extends State<MyThreeWidget> {
  Offset _offset = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D动画'),
      ),
      body: Center(
        // 使用Transform进行二三级效果开启
        child: Transform(
            transform: Matrix4.identity()
                       ..setEntry(3, 2, 0.001)
                       ..rotateX(_offset.dy * 0.01) //根据Y轴距离绕X轴旋转
                       ..rotateY(_offset.dx * 0.01),//根据X轴距离绕Y轴旋转
            child:GestureDetector(
              //监听一下手势各种方式,各个方向都可以
              onPanUpdate: (details){
                setState((){
                  _offset += details.delta;//更新Offset(point )
                });

              },
              onDoubleTap:(){
                  setState((){
                  _offset = Offset.zero;//归位
                  });
              },
              child: Container(
                width: 200.0,
                height: 200.0,
                color: Colors.red,
              ),
            )
        ),

      ),
    );
  }
}
