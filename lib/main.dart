import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'メールアドレスを入力してください',
                    labelText: 'メールアドレス *',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => (!value!.contains('@')) ? 'メールアドレスを入力してください' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'パスワードを入力してください',
                    labelText: 'パスワード'
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
