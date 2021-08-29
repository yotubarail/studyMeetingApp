import 'package:flutter/material.dart';
import 'package:my_app/list/submissionMeetingList.dart';
import 'package:my_app/detail/studyMeetingDetail.dart';

class StudyMeetingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('勉強会一覧'),
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
                      MaterialPageRoute(builder: (context) => StudyMeetingDetailPage(studyMeetingTitle: 'Flutterハンズオン'))
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
            ElevatedButton(
              child: Text('イベント管理'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.all(20.0)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SubmissionMettingListPage(),)
                );
              }
            ),
          ],
        ),
      )
    );
  }
}