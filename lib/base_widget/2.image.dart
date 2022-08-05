import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() =>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  注意:这里所有的都是widgets 可以理解成前端的div
    debugPaintSizeEnabled = false;
    return MaterialApp(
      title: 'Widget组件之Image',
      home: Scaffold(
        appBar: AppBar(
          title: Text('image示例Demo'),
        ),
        body: Center(
          // Container可以理解为一个盒子 盒子里面是可以child
          child:Column(
             children:<Widget> [
               //网络 Image.network
               // Image.network(
               //     'https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF',
               //   width: 500.0,
               //   height: 500.0,
               // ),


               // 加载assets Image.asset
               // Image.asset('assets/images/404.png',
               //     width: 200.0,
               //     height:200.0,
               // ),

               //从merory中加载 DecorationImage
               MemoryImageWidget(),


               //从文件中加载图片 Image.file
               FileImageWidget()
             ],
          )
        ),
      ),
    );
  }
}

// stful 快捷键直接StatefulWidget代码块
// 从内存当中加载图片
class MemoryImageWidget extends StatefulWidget {
  const MemoryImageWidget({Key? key}) : super(key: key);

  @override
  State<MemoryImageWidget> createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List  ?bytes;

  @override
  void initState() {
    // TODO: implement initState
    rootBundle.load('assets/images/test.jpg').then((data){
     //mounted 是 bool 类型，表示当前 State 是否加载到树⾥。
      if(mounted){
         setState(() {
           bytes = data.buffer.asUint8List();
         });
      }
    });


  }
  @override
  Widget build(BuildContext context) {
    // 这个是设置背景图片的
    final  decoration =BoxDecoration(
      image: bytes != null?DecorationImage(image: MemoryImage(bytes!)):null
    );
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: decoration,
    );
  }
}



//从文件中选择然后加载图片
class FileImageWidget extends StatefulWidget {
  const FileImageWidget({Key? key}) : super(key: key);

  @override
  State<FileImageWidget> createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
   File ?image;
  // 我们需要异步读文件
  Future getImage() async{
    // 这里需要一个第三方包来支撑图片选择
     var picker = ImagePicker();
     final imageData =  await picker.pickImage(source: ImageSource.gallery);
     String?path = imageData?.path;
     setState(() {
       // 因为ImagePicker的新版本返回的是XFile类型,这里需要dart:io包中的File进行转化把XFile类型转化成File类型
       image = File(path!);
     });
  }

  @override
  Widget build(BuildContext context) {
    // 这边改造一下 这里用一个列布局
    return Column(
           children: <Widget>[
             Center(
               child: image == null?Text('未选择图片'):Image.file(image!,width: 200.0,height: 200.0),
             ),
             TextButton(
                 onPressed:getImage,
                 child: Text('选择图片',style: TextStyle(
                   color: Colors.blue,
                 ),)
             )
           ],
        );
  }
}




