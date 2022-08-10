 import 'package:flutter/material.dart';

void main()=>runApp(
  const MaterialApp(
    home:TablePage()
  )
);


class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('table'),
      ),
      body: Center(
        child: Table(
          //这个是列的宽度，声明有多少列
          columnWidths: const <int,TableColumnWidth> {
             0:FixedColumnWidth(50.0),
             1:FixedColumnWidth(50.0),
             2:FixedColumnWidth(50.0),
             3:FixedColumnWidth(50.0),
             4:FixedColumnWidth(50.0)
           },
          //添加table的边框
          border:TableBorder.all(
            color: Colors.black,
            width: 1.0,
          ),
          // 处理table row里面填充对应列
          children: const <TableRow>[
            TableRow(
                children: [
                  Text('账号'),
                  Text('昵称'),
                  Text('手机号'),
                  Text('微信号'),
                  Text('备注')
                ]
              ),
            TableRow(
                children: [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5')
                ]
            ),
            TableRow(
                children: [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5')
                ]
            ),
            TableRow(
                children: [
                  Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                  Text('5')
                ]
            )
          ],
        )
      ),

    );
  }
}
