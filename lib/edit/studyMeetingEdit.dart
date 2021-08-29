import 'package:flutter/material.dart';

class StudyMeetingEditPage extends StatelessWidget {
  final String studyMeetingTitle;

  const StudyMeetingEditPage({Key? key, required this.studyMeetingTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((studyMeetingTitle == '') ? '新規投稿': (studyMeetingTitle + 'の編集')),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '勉強会タイトル'),
              keyboardType: TextInputType.text,
              maxLines: 1,
              initialValue: studyMeetingTitle,
              onChanged: (String value) {

              },
            ),Container(
                height: 300,
                child: TextField(
                  decoration: InputDecoration(labelText: '投稿メッセージ'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: (String value) {
                    },
                )
              ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 60),
              child: Text('参加：'),
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
                    child: Text('保存'),
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
      ),
    );
  }
}