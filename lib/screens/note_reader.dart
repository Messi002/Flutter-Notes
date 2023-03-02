import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/style/app_style.dart';

class NoteReaderScreen extends StatefulWidget {
  QueryDocumentSnapshot doc;
  NoteReaderScreen(this.doc, {super.key});

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          c
            ),
            Text(
              widget.doc['note_content'],
              style: AppStyle.mainTitle,
            ),
          ],
        ),
      ),
    );
  }
}
