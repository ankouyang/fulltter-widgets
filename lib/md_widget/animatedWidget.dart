
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
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 30))..forward();
    //  _doubleAnimation初始化  Tween 定义开始值和结束值 并_animationController动画内 持续时间为2s
    _doubleAnimation = Tween(begin:20.0,end:200.0).animate(_animationController!)
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
    return Scaffold(
        body:Center(
          child:  MyLogo(animation: _doubleAnimation)
        ),
    );
  }
}



class  MyLogo extends AnimatedWidget {
  final Tween<double> _rotateAnim = Tween<double>(begin: 0.0,end: 360.0);
   MyLogo({Key? key,  required animation}) : super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    //取出animaiton,进行旋转 然后是旋转角度  listenable需要断言成 Animation<double> 不然
    //会出现转换错误
    final Animation<double> animation =  listenable as Animation<double>;
    return Transform.rotate(
      angle:_rotateAnim.evaluate(animation) ,//旋转角度 通过rotateAnim.evaluate(animation) 设置旋转的角度访问  旋转的时间
      child:  Container(
        width: animation.value,
        height: animation.value,
        child: Image.network('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF'),
      )
    );
  }
}
