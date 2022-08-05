import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main()=>runApp(const MyApp());

// Text  Rich
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text测试',
      home: Scaffold(
           appBar: AppBar(
             title: const Text('我是文字类型我'),
           ),
           body:Container(
             margin: const EdgeInsets.all(10.0),
             decoration: BoxDecoration(
               border: Border.all(
                  width: 2.0,
                  color: Colors.red
               )
             ),
             child: Center(
                 child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('是文字类型我是文字类型我是文字类型我是文字类型我是文字类型我 是文字类型我是文字类型我是文字类型我是文字类型dfsghghdsghghghghghghghghghghghghghghghghghgh',
                          style: TextStyle(
                            color: Colors.cyan,
                            decoration: TextDecoration.lineThrough, // decoration文字横穿
                            decorationStyle: TextDecorationStyle.wavy,
                            letterSpacing: 10.0,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // 超过ellipsis ....  clip直接截断  fade 隐藏文字有颜色的时候有个阴影
                          softWrap: true,//自动换行

                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        RichText(
                           text:  TextSpan(
                               text: 'hello,大家好',
                               style: const TextStyle(
                                   color: Colors.redAccent,
                                   fontSize: 15.0
                               ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text:'我是一个超级超级无敌的',
                                  style: TextStyle(
                                    color: Colors.cyan,
                                    fontSize: 20.0
                                  )
                                ),
                                TextSpan(
                                  text:'大帅哥',
                                  style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 30.0
                                  ),
                                  recognizer: TapGestureRecognizer()..onTap=() async  {
                                    // 这里的跳转也需要第三方的包,这里是URL的类型协议 不是简单的urlstring 这里需要吧 string url parse URl类型
                                    Uri url = Uri.parse('https://www.baidu.com') ;
                                    print(url);
                                    launchUrl(url);

                                  }
                                )
                              ]
                           )
                        )
                      ],
                 ),
             ),
           ) ,
      )
    );
  }
}
