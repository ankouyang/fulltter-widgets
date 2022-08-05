import 'package:flutter/material.dart';

void main ()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list-view',
      home: Scaffold(
        appBar: AppBar(
          title: Text('这是一个list-view'),
        ),
        body:Center(
          child:

          // 1.buildListView() 封装成方法或者widgets,


          // 2.使用generate mock一些数据 ListView(
          //   scrollDirection: Axis.vertical,//ListView 默认是buildListView 竖着滑动  但是可以也可以横着
          //   children: List.generate(100, (index)  { generate会一次性加载所有资源
          //       return  Column(
          //               children:<Widget> [
          //                  Image.network('https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF'),
          //                  Text('这是图片${index+1}')
          //               ],
          //           );
          //   }),
          // )

            //3. 使用 ListView.builder 如果builder不设置itemCount的数量，是mock无线数据的。和generate不同的是，它不是一次性加载出来的  后面页面数据渲染都是用的这个方式
          ListView.builder(itemCount:15,itemBuilder: (context,index){
            // print(context);
            print(index);
            //添加下划线
            //  if(index.isOdd) return Divider();
              return Column(
                children: [
                  ListTile(
                     leading: const Icon(Icons.favorite_border),
                     title: Text('favorite_border${index+1}'),
                     subtitle: const Text('sub_border'),
                     trailing: const Icon(Icons.arrow_forward_ios) ,
                     ),
                   Divider()
                ],
              ) ;
          })


        )
      ),
    );
  }

  ListView buildListView() {
    return ListView(
          children: const [
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border1'),
              subtitle: Text('sub_border'),
              trailing: Icon(Icons.arrow_forward_ios) ,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border2'),
                subtitle: Text('sub_border'),
                trailing: Icon(Icons.arrow_forward_ios)
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border3'),
                subtitle: Text('sub_border'),
                trailing: Icon(Icons.arrow_forward_ios)
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border4'),
                subtitle: Text('sub_border'),
                trailing: Icon(Icons.arrow_forward_ios)
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border5'),
                subtitle: Text('sub_border'),
                trailing: Icon(Icons.arrow_forward_ios)
            ),
            Divider(),
            ]
        );
  }
}
