import 'package:flutter/material.dart';
void  main()=>runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  void  _printData(){
    print('print Data');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'icons_buttons示例',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('icons_buttons'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                const Text('icons_buttons',
                  style:TextStyle(
                    fontSize: 50.0,
                    color: Colors.cyanAccent
                  ) ,),
                const Icon(Icons.add_alarm),
                const IconButton(icon: Icon(Icons.access_time),onPressed:null),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(onPressed: _printData,
                child: Text('ElevatedButton'))

              ],
            ),
          ),
        ),
      ),
    );
  }


}
