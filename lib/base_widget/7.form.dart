import 'package:flutter/material.dart';

void main()=>runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'form表单这是有状态的组件',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginkey = GlobalKey<FormState>();
   String ? _userName;
   String ?_password;
   bool _isObscure = true;

   void login(){
     var loginForm =_loginkey.currentState!;
     if(loginForm.validate()){
       print(loginForm);
       loginForm.save();
     }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('form示例'),
      ),
      body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Form(
              key: _loginkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                        labelText: '请输入用户名',
                        border: OutlineInputBorder()
                    ),
                    onSaved:(val){
                         _userName  = val;
                    } ,
                    validator: (value){
                      var val = value!;
                         if (val.isEmpty) return '用户名不能为空';
                    },
                    //点击软键盘的提交
                    onFieldSubmitted: (val)=>print(val),
                  ),
                  const SizedBox(
                    height: 15.0
                  ),
                  TextFormField(
                    obscureText:_isObscure,
                    decoration:  InputDecoration(
                        labelText: '请输入用户密码 ',
                        border:const OutlineInputBorder(),
                        suffixIcon: IconButton(onPressed:(){
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }, icon: Icon(_isObscure?Icons.visibility:Icons.visibility_off))
                    ),
                    onSaved:(val){
                      _password  = val;
                    } ,
                    validator: (value){
                      var val = value!;
                      if (val.length < 3) return '用密码不能少于3位';
                      if (val.length > 6) return '用密码不能大于6位';
                    },
                    //点击软键盘的提交
                    onFieldSubmitted: (val)=>print(val),
                  ),
                  const SizedBox(
                      height: 15.0
                  ),
                  SizedBox(
                    width: 400.0,
                    height: 45.0,
                    child: ElevatedButton(
                        onPressed: login ,
                        child: const Text('登录')
                    ),
                  )

                ],
              ),
            ),
          )
      ),
    );
  }
}

