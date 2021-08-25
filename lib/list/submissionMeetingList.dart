import 'package:flutter/material.dart';

class SubmissionMettingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿イベント一覧'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  child: Text('戻る'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.all(20.0)
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              ),
              ElevatedButton(
                  child: Text('新規イベント'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: EdgeInsets.all(20.0)
                  ),
                  onPressed: () {

                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}