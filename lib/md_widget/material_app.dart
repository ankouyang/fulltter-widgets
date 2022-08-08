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
      home: const HomePage(),//当前运行的路由
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
   // 切换不同tab展示不同的widget
   final  _widgetOptions = [
       const Text('信息'),
       const Text('通讯')
   ];
  @override
  Widget build(BuildContext context) {
    print(_widgetOptions.elementAt(_current));
    return  Scaffold(
      appBar: AppBar(
        title: const Text('我是首页'),
        centerTitle: true,//是否title居中显示
        leading: const Icon(Icons.star), //左侧icon图标
        elevation: 4.0,//调整appBar阴影
        actions: const <Widget>[
          Icon(Icons.search),
          Icon(Icons.more_vert),
        ],//右边图标icon

      ),
      body: _widgetOptions.elementAt(_current),//根据elementAt进行切换根据_current展示具体的页面
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
      // 谷歌给我们封装好的bottomNavigationBar组件,我们可以直接使用
      bottomNavigationBar: buildBottomNavigationBar(),
      drawer: buildDrawer(),//左侧抽屉，左侧手势滑动
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children:  const <Widget>[
          //谷歌提供的现成的UserAccountsDrawerHeader
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF'),
              ),
              accountName: Text('ankouyang'),//用户名
              accountEmail: Text('ankouyang@126.com'),//用户邮箱
              otherAccountsPictures: <Widget>[//图片
                Icon(Icons.camera_alt)
              ],
              decoration:BoxDecoration(// 装饰器
                //默认修改其背景图片
                image: DecorationImage(
                    // 背景图片路径
                    image: NetworkImage('https://iknow-pic.cdn.bcebos.com/1ad5ad6eddc451da734edbe6b2fd5266d0163207?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_600%2Ch_800%2Climit_1%2Fquality%2Cq_85%2Fformat%2Cf_auto'),
                    //修改填充模式
                    fit:BoxFit.fill
                ),

              ) ,
          ),
          ListTile(
             leading:Icon(Icons.payment),
              title:Text('会员特权1')
          ),
          ListTile(
              leading:Icon(Icons.payment),
              title:Text('会员特权2')
          ),
          ListTile(
              leading:Icon(Icons.payment),
              title:Text('会员特权3')
          ),
          // listTitle简介
          AboutListTile(
              icon: Icon(Icons.icecream),
              child: Text('关于'),
              applicationName:'ankouyang',
              applicationVersion: '1.0'
          )
        ],
      ),
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
        ),
        body: const Text('我是其他的页面'),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: '其他页面1',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.safety_check),
                label: '其他页面2'
            )
          ],

        ),
    );;
  }
}

