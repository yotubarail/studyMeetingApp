import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('勉強会一覧'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 190,
            child: ListView(
              children: <Widget>[
                Card(
                  child: ListTile(
                    title: Text('Flutterハンズオン'),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
              child: Text('イベント管理'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.all(20.0)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoAddPage(),)
                );
              }
          ),
        ],
      ),
    );
  }
}

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}