import 'package:flutter/material.dart';
import 'package:my_app/login/signup.dart';
import 'package:my_app/list/studyMeetingList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '勉強会APP',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'ログイン'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),)
                );},
              child: const Text('サインアップ'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
              ),
            ),
          ],
        ),
        body: Center(
          child: Form(
            child: AutofillGroup(
              child: Container(
                margin: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'メールアドレスを入力してください',
                        labelText: 'メールアドレス *',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => !(new RegExp(r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$').hasMatch(value!)) ? 'メールアドレスを入力してください' : null,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'パスワードを入力してください', labelText: 'パスワード'
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => (value!.isEmpty) ? 'パスワードを入力してください' : null,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ElevatedButton(
                      child: Text('ログイン'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          padding: EdgeInsets.all(20.0)
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoListPage(),)
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
