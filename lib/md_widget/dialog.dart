import 'package:flutter/material.dart';

void main(){
  runApp(
      const MaterialApp(
         home:MyDialog()
  ));
}

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('dialog demo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget> [
              // 简单的对话框
              SimpleDialog(
                title: const Text('对话框标题'),
                children: <Widget>[
                  SimpleDialogOption(
                      child: const Text('选项1'),
                      onPressed: () => print('选项1')
                  ),
                  SimpleDialogOption(
                      child: const Text('选项2'),
                      onPressed: () => print('选项2')
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed:(){
                    //重新弹出一个新的
                    showDialog(context: context, builder: (BuildContext context){
                      return   AlertDialog(
                          title: const Text("提示"),
                          content: const Text('请确认是否删除?,删除后不可恢复!'),
                          actions: [
                             TextButton(onPressed:(){Navigator.of(context).pop();}, child: const Text('取消')),
                             TextButton(onPressed:(){Navigator.of(context).pop();}, child: const Text('确定')),
                           ],
                      );
                    });
                  },
                  child: const Text('删除')
              )
            ],
          ),
        )
    );
  }
}
