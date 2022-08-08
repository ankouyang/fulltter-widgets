import 'package:flutter/material.dart';

void main()=>runApp(const MaterialApp(
  title: 'card',
  home: CardPage()
));

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text('cardWidget'),
       ),
      body: ListView(
         children: [
          buildCard(),
          buildCard(),
          buildCard(),
          buildCard()
         ]
        ,
      ),
    );
  }

  Card buildCard() {
    return Card(
            child:Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  child:Image.network(
                    'https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF',
                    height: 150.0,
                    width: double.infinity,
                    fit:BoxFit.cover
                   )
                ),
                Row(
                  children:  [
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.home)
                    ),
                    Expanded(child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: const TextSpan(
                           text:'原价格:',
                           style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0
                            ),
                          children: [
                             TextSpan(
                               text:'1500',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontSize: 15.0,
                                   decoration: TextDecoration.lineThrough,
                                   decorationColor: Colors.red
                               ),
                             )
                          ]
                        )),
                        Text('500',style: TextStyle(fontSize: 30.0,color: Colors.red))
                      ],
                    )), //Expanded 把剩余的空间部分都分配给他
                    Container(child: Column(
                      children: const [
                        Icon(Icons.favorite,color: Colors.red),
                        Text('88')
                      ],
                    ),)
                  ],
                ),
              ],
            )
        );
  }
}
