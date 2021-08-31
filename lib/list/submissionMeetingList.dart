import 'package:flutter/material.dart';
import '../edit/studyMeetingEdit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubmissionMettingListPage extends StatefulWidget {
  final User user;
  SubmissionMettingListPage({required this.user});
  @override
  _SubmissionMettingList createState() => _SubmissionMettingList();
}

class _SubmissionMettingList extends State<SubmissionMettingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿イベント一覧'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: ListView(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubmissionPage(studyMeetingTitle: 'Flutterハンズオン', user: widget.user,))
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('Flutterハンズオン'),
                      ),
                    ),
                  )
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
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SubmissionPage(studyMeetingTitle: '', user: widget.user,))
                    );
                  }
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}