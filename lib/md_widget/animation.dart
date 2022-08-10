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
  Animation<double> ?_doubleAnimation; //定义动画的值
  AnimationController? _animationController; // 定义一个AnimationController
  String ?doubleAnimationData;
  // 动画的四种状态
  // 1 dismissed
  // 2.forward 从头到位播放状态
  // 3.reverse 从尾到头播放状态
  // 4.completed 完成状态
  // 初始化生命周期
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // animationController初始化
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    //  _doubleAnimation初始化  Tween 定义开始值和结束值 并_animationController动画内 持续时间为2s
    _doubleAnimation = Tween(begin: 0.0,end: 1.0).animate(_animationController!)
    ..addListener(() {
      setState(() {
        doubleAnimationData = _doubleAnimation?.value.toString();
      });
      print(_doubleAnimation?.value.toString());
    })
    ..addStatusListener((status) {
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
        body: Center(
             child: Text(doubleAnimationData ??='0.0'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
            //开始动画
          _animationController?.forward(from: 0.0);
        },child: const Icon(Icons.arrow_forward),),
    );
  }
}


