import 'package:flutter/material.dart';

void main()=>runApp(
     MaterialApp(
        home:DismissiblePage()
    )
);

//Dismissible 左右滑动 删除
class DismissiblePage extends StatelessWidget {
  DismissiblePage({Key? key}) : super(key: key);
  final List<String> items = List.generate(30, (index) => '标题$index');
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title: const Text('dissmissable')
      ),
      body: ListView.builder(
           itemCount: items.length,
           itemBuilder:(context,index){
             final item = items[index];
             return  Dismissible(
                 //左右移除的回调
                 onDismissed:(_){
                   print(index);
                   items.removeAt(index);
                 },
                 movementDuration: Duration(milliseconds: 100),//过渡效果
                 key: Key(item),
                 child:ListTile(
                   title: Text(item),
                 ),
                 background: Container(color: Colors.red)
             );
           } ,
      ),
    );
  }
}


