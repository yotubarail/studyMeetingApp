import 'package:flutter/material.dart';
import '../edit/studyMeetingEdit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubmissionMettingListPage extends StatefulWidget {
  final User user;
  SubmissionMettingListPage({required this.user});
  @override
  _SubmissionMettingList createState() => _SubmissionMettingList();
}

class _SubmissionMettingList extends State<SubmissionMettingListPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
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
              child: StreamBuilder<QuerySnapshot>(
                // 投稿メッセージ一覧を取得（非同期処理）
                // 投稿日時でソート
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(auth.currentUser!.uid)
                    .collection('events')
                    .where('title')
                    .orderBy('updateTime')
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
                                    MaterialPageRoute(builder: (context) => SubmissionPage(studyMeetingTitle: document['title'], descriptionText: document['body'], user: widget.user,))
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
                      MaterialPageRoute(builder: (context) => SubmissionPage(studyMeetingTitle: '', descriptionText: '', user: widget.user,))
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