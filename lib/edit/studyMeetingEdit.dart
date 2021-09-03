import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SubmissionPage extends StatefulWidget {
  final String studyMeetingTitle;
  final String descriptionText;
  final DocumentSnapshot document;
  final String createDate;
  final int guestCount;
  final User user;
  SubmissionPage({required this.studyMeetingTitle, required this.descriptionText, required this.document, required this.createDate, required this.guestCount, required this.user});
  @override
  _StudyMeetingEditPage createState() => _StudyMeetingEditPage();
}

class _StudyMeetingEditPage extends State<SubmissionPage> {

  String studyMeetingTitle = '';
  String descriptionText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studyMeetingTitle),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '勉強会タイトル'),
              keyboardType: TextInputType.text,
              maxLines: 1,
              initialValue: widget.studyMeetingTitle,
              onChanged: (String value) {
                setState(() {
                  studyMeetingTitle = value;
                });
              },
            ),
            Container(
                height: 300,
                child: TextFormField(
                  decoration: InputDecoration(labelText: '投稿メッセージ'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  initialValue: widget.descriptionText,
                  onChanged: (String value) {
                    setState(() {
                      descriptionText = value;
                    });
                    },
                )
              ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 60),
              child: Text('参加：' + widget.guestCount.toString()),
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
                    onPressed: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      final date = DateTime.now().toLocal().toIso8601String();
                      final email = widget.user.email;
                      await FirebaseFirestore.instance
                      .collection('users')
                      .doc(auth.currentUser!.uid)
                      .collection('events')
                      .doc((widget.document.id == '') ? null: widget.document.id)
                      .set({
                        'title': (studyMeetingTitle == '') ? widget.studyMeetingTitle : studyMeetingTitle,
                        'body': (descriptionText == '') ? widget.descriptionText : descriptionText,
                        'email': email,
                        'createTime': (widget.createDate == '') ? date : widget.createDate,
                        'updateTime': date,
                      });
                      Navigator.of(context).pop();
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