import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      title: '主页面',//页面的title
      home: const HomePage(),
      routes:{
        '/otherPage':( BuildContext context)=>const OtherPage()
      }//定义好路由
    );
  }
}



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   int  _current = 0;
   // 切换不同tab展示同步widget
   final  _widgetOptions = [
       Text('信息'),
       Text('通讯')
   ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('我是首页')
      ),
      body: _widgetOptions.elementAt(_current),//根据elementAt进行切换。指定具体的页面
      floatingActionButton: FloatingActionButton( // 这个右边浮动的actionButton 可以自定义里面的属性我们可以
                      tooltip: '跳转',
                      foregroundColor: Colors.cyanAccent,
                      backgroundColor: Colors.cyan,
                      elevation: 0.0,
                      // shape: const RoundedRectangleBorder(),
                      onPressed:(){
                        Navigator.pushNamed(context, '/otherPage');
                       },
                      child: const Icon(Icons.arrow_forward)
                      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // 谷歌给我们封装好的bottom组件
      bottomNavigationBar:
              buildBottomNavigationBar()
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: '信息',
                  // label: Text('信息')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.safety_check),
                  label: '通讯'
              )
            ],
            currentIndex: _current, //默认当前选中的index
            type: BottomNavigationBarType.fixed, //  设置权重
            onTap: (index){
              //点击切换 切换到当前index 并切换内容
               setState(() {
                 _current = index;
               });
            }
    ,);
  }
}


class OtherPage extends StatefulWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  State<OtherPage> createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('我是其他页面')
        )
    );;
  }
}

