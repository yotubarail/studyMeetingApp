import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
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
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ElevatedButton(
                      child: const Text('ログイン'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.amber,
                          padding: EdgeInsets.all(20.0)
                      ),
                      onPressed: () {},
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
