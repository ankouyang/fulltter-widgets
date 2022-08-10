import 'package:flutter/material.dart';

void main()=>runApp(
    MaterialApp(
      home: AnimationPage(),
    )
);

//AnimationPage 动画
class AnimationPage extends StatefulWidget {
  const  AnimationPage({Key? key}) : super(key: key);
  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  // 是一个抽象类 抽象类只能实现 不能实例化 如果需要实例化需要工厂模式
  // Animation    里面有addListener 动画值的监听      removeListener 动画值移除监听  addStatusListener动画状态监听
  // Animation<double> ?_doubleAnimation; //定义动画Double的值 也可以是颜色的值
  late Animation<Color> _doubleAnimation; //定义动画的值
  late AnimationController _animationController;// 定义一个AnimationController
  // Double doubleAnimationData = 0;
  // String  Text
  // 初始化生命周期
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // animationController初始化 
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _animationController.forward();
    //  _doubleAnimation初始化  Tween 定义开始值和结束值 并_animationController动画内 持续时间为2s
    var a = Tween(begin: Colors.white,end:Colors.red)
        .animate(_animationController)
      ..addListener(() {
        //注意：这句不能少，否则 widget 不会重绘，也就看不到动画效果
        setState(() {});
      })
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed){
          _animationController.reverse();
        }else if(status == AnimationStatus.dismissed){
          _animationController.forward();
        }
        // print(status);
      });
    _doubleAnimation =  a as Animation<Color>;
  }


  //避免资源泄露 AnimationController
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
          width: 200.0,
          height: 200.0,
          color: _doubleAnimation.value,
        )
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        //开始动画
        print('是否有效');
        _animationController.forward();
      },child: Icon(Icons.arrow_forward),),
    );
  }
}


