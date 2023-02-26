import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notesapp/style/app_style.dart';

// class NoteEditorScreen extends StatefulWidget {
//   const NoteEditorScreen({super.key});

//   @override
//   State<NoteEditorScreen> createState() => _NoteEditorScreenState();
// }

// class _NoteEditorScreenState extends State<NoteEditorScreen> {
class NoteEditorScreen extends HookWidget {
  NoteEditorScreen({super.key});
  final focus2 = useFocusNode();

  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toIso8601String();

  @override
  Widget build(BuildContext context) {
      final _titleTextController = useTextEditingController();
  final _mainTextController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: const Text(
          'Add a new Note',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleTextController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: AppStyle.dateTile,
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextFormField(
              controller: _mainTextController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Content'),
              style: AppStyle.mainTitle,
            ),
          ],
        ),
      ),
    );
  }
}


//29: 35