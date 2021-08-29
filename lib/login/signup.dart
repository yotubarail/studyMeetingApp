import 'package:flutter/material.dart';
import 'package:my_app/list/studyMeetingList.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  // 使用するStateを指定
  @override
  _SignUp createState() => _SignUp();
}


class _SignUp extends State<SignUp> {
  String emailAddress = '';
  String password = '';
  String infoText = '';

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
          title: Text('サインアップ'),
        ),
        body: Center(
          child: Form(
            child: AutofillGroup(
              child: Container(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'メールアドレスを入力してください',
                        labelText: 'メールアドレス *',
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                      !(new RegExp(
                          r'^[a-zA-Z0-9_.+-]+@([a-zA-Z0-9][a-zA-Z0-9-]*[a-zA-Z0-9]*\.)+[a-zA-Z]{2,}$')
                          .hasMatch(value!)) ? 'メールアドレスを入力してください' : null,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        setState(() {
                          emailAddress = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'パスワードを入力してください',
                          labelText: 'パスワード'
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                      (value!.isEmpty)
                          ? 'パスワードを入力してください'
                          : null,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (String value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    Text(infoText),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ElevatedButton(
                      child: const Text('ログイン'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          padding: EdgeInsets.all(20.0)
                      ),
                      onPressed: () async {
                        try {
                          // メール/パスワードでユーザー登録
                          final FirebaseAuth auth = FirebaseAuth.instance;
                          final UserCredential result =
                          await auth.createUserWithEmailAndPassword(
                            email: emailAddress,
                            password: password,
                          );

                          // 登録したユーザー情報
                          final User user = result.user!;
                          setState(() {
                            infoText = '';
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>StudyMeetingListPage(),)
                            );
                          });
                        } catch (e) {
                          // 登録に失敗した場合
                          setState(() {
                            infoText = "登録NG：${e.toString()}";
                          });
                        }
                      },
                    )
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
