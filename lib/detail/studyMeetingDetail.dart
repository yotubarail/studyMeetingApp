import 'package:flutter/material.dart';

class StudyMeetingDetailPage extends StatelessWidget {
  final String studyMeetingTitle;

  const StudyMeetingDetailPage({Key? key, required this.studyMeetingTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(studyMeetingTitle),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Scrollbar(
                isAlwaysShown: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        color: Colors.green[50],
                      ),
                    ],
                  ),
                ),
              ),
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
                    child: Text('申し込む'),
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
