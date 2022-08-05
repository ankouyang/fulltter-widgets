import 'package:flutter/material.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView示例'),
        ),
        body:
        // 1.普通的GridView.count方法
            // GridView.count(
            //   crossAxisCount: 2,// 默认滑动方向是竖向，交叉轴出放置的数量为2个，也就是横轴方向放两个
            //   childAspectRatio: 4/5,//子元素的宽高比
            //   // scrollDirection:Axis.horizontal ,//滑动的方向默认是竖向
            //   children:List.generate(15, (index){
            //     return Container(
            //       margin: const EdgeInsets.all(10.0),
            //       child: Column(
            //           mainAxisAlignment:MainAxisAlignment.center,
            //           children: [
            //             Text('$index',style: const TextStyle(fontSize: 20.0)),
            //             Image.network('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF')
            //           ],
            //       ),
            //     );
            //   }),
            // )
        //2.GridView.Builder 用法同ListView差不多 
        GridView.builder(
            itemCount:15,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,//交叉轴显示多少个
                mainAxisSpacing: 0
            ),
            itemBuilder: (context,index){
              print(index);
              return Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              Text('$index',style: const TextStyle(fontSize: 20.0)),
                              Image.network('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF')
                            ],
                        )
              );
            }
        )






        ),
      );
  }
}
