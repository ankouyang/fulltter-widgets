
import 'package:flutter/material.dart';
void main()=>runApp(
    MaterialApp(
      home: AnimatedPage(),
    )
);



class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> with SingleTickerProviderStateMixin {
  Animation<double> ?_doubleAnimation;
  AnimationController? _animationController; // 定义一个AnimationController
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // animationController初始化
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1))..forward();
    //  _doubleAnimation初始化  Tween 定义开始值和结束值 并_animationController动画内 持续时间为2s
    _doubleAnimation = Tween(begin:-1.0,end:0.0).animate(_animationController!)
      ..addListener(() {
        //注意：这句不能少，否则 widget 不会重绘，也就看不到动画效果
        setState(() {});
      })
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          _animationController?.reverse();
        }else if(status == AnimationStatus.dismissed){
          _animationController?.forward();
        }
        // _animationController?.forward();
        print(status);
      });
  }


  //避免资源泄露 AnimationController
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //获取屏幕的宽度
    var screenWidth = MediaQuery.of(context).size.width;
    var valueData =  _doubleAnimation?.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('你好'),
      ),
      body:Center(
          child:  AnimatedBuilder(animation: _animationController!,builder:(BuildContext context, Widget? child){
                   return Transform(
                     transform: Matrix4.translationValues(valueData! * screenWidth, 0.0, 0.0),
                     child: Container(
                       width: 200.0,
                       height: 200.0,
                       color: Colors.orange,
                       child: const FlutterLogo(),
                     ),
                   );
          })
      ),
    );
  }
}



