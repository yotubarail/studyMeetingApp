import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/list/submissionMeetingList.dart';
import 'package:my_app/detail/studyMeetingDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudyMeetingListPage extends StatefulWidget {
  final User user;
  StudyMeetingListPage({required this.user});
  @override
  _StudyMeetingList createState() => _StudyMeetingList();
}

class _StudyMeetingList extends State<StudyMeetingListPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
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
              child: StreamBuilder<QuerySnapshot>(
                // 投稿メッセージ一覧を取得（非同期処理）
                // 投稿日時でソート
                stream: FirebaseFirestore.instance
                    .collectionGroup('events')
                    .where('title')
                    .snapshots(),
                builder: (context, snapshot) {
                  // データが取得できた場合
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> documents = snapshot.data!.docs;
                    // 取得した投稿メッセージ一覧を元にリスト表示
                    return ListView(
                      children: documents.map((document) {
                        return Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => StudyMeetingDetailPage(studyMeetingTitle: document['title'], descriptionText: document['body'], document: document, user: widget.user,))
                              );
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(document['title']),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }
                  // データが読込中の場合
                  return Center(
                    child: Text('読込中...'),
                  );
                },
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
                    MaterialPageRoute(builder: (context) => SubmissionMettingListPage(user: widget.user,),)
                );
              }
            ),
          ],
        ),
      )
    );
  }
}