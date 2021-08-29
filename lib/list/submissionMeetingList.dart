import 'package:flutter/material.dart';
import '../edit/studyMeetingEdit.dart';

class SubmissionMettingListPage extends StatelessWidget {
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
                        MaterialPageRoute(builder: (context) => StudyMeetingEditPage(studyMeetingTitle: 'Flutterハンズオン'))
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
                      MaterialPageRoute(builder: (context) => StudyMeetingEditPage(studyMeetingTitle: ''))
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