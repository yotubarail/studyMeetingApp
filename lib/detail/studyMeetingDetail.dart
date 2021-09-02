import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudyMeetingDetailPage extends StatefulWidget {
  final String studyMeetingTitle;
  final String descriptionText;
  final DocumentSnapshot document;
  final User user;
  StudyMeetingDetailPage({required this.studyMeetingTitle, required this.descriptionText, required this.document, required this.user});
  @override
  _StudyMeetingDetail createState() => _StudyMeetingDetail();
}

  class _StudyMeetingDetail extends State<StudyMeetingDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studyMeetingTitle),
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
                        child: Text(widget.descriptionText),
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
                    onPressed: () async {
                      final date = DateTime.now().toLocal().toIso8601String();
                      final email = widget.user.email;
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget.document.reference.parent.parent!.id)
                          .collection('events')
                          .doc(widget.document.id)
                          .collection('guests')
                          .doc()
                          .set({
                            'name': email,
                            'createTime': date
                          }
                        );
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
