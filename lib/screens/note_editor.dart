import 'dart:developer';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/style/app_style.dart';

// class NoteEditorScreen extends StatefulWidget {
//   const NoteEditorScreen({super.key});

//   @override
//   State<NoteEditorScreen> createState() => _NoteEditorScreenState();
// }

// class _NoteEditorScreenState extends State<NoteEditorScreen> {
class NoteEditorScreen extends HookWidget {
  NoteEditorScreen({super.key});

  int color_id = math.Random().nextInt(AppStyle.cardsColor.length);
  String formattedDate =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final _titleTextController = useTextEditingController();
    final _mainTextController = useTextEditingController();
    final focus1 = useFocusNode();
    final focus2 = useFocusNode();
    final focus3 = useFocusNode();

    // log(date);
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
              autofocus: true,
              enableSuggestions: false,
              controller: _titleTextController,
              focusNode: focus1,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Title'),
              style: AppStyle.mainTitle,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (term) {
                focus1.unfocus();
                FocusScope.of(context).requestFocus(focus2);
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              formattedDate,
              style: AppStyle.dateTile,
            ),
            const SizedBox(
              height: 28.0,
            ),
            TextFormField(
              focusNode: focus2,
              controller: _mainTextController,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.next,
              maxLines: null,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Note Content'),
              style: AppStyle.mainTitle,
              onFieldSubmitted: (term) {
                focus2.unfocus();
                FocusScope.of(context).requestFocus(focus3);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusNode: focus3,
        onPressed: () async {
          FirebaseFirestore.instance.collection('Notes').add({
            'note_title': _titleTextController.text.trim(),
            'creation_date': formattedDate,
            'note_content': _mainTextController.text.trim(),
            'color_id': color_id,
          }).then((value) {
            log(value.id);
            Navigator.of(context).pop();
          }).catchError((e) => log('Failed to add new note due to $e'));
        },
        backgroundColor: AppStyle.accentColor,
        child: const Icon(Icons.save),
      ),
    );
  }
}


//29: 35




// void main() {
//   String input = '2023-02-26T19:26:24.473751';
  
//   DateTime dateTime = DateTime.parse(input);
//   String formattedDate = '${dateTime.year}-${_pad(dateTime.month)}-${_pad(dateTime.day)} ${_pad(dateTime.hour)}:${_pad(dateTime.minute)}:${_pad(dateTime.second)}';
  
//   print(formattedDate); // Output: 2023-02-26 19:26:24
// }

// String _pad(int value) {
//   return value.toString().padLeft(2, '0');
// }



// import 'package:intl/intl.dart';

// void main() {
//   String input = '2023-02-26T19:26:24.473751';
  
//   DateTime dateTime = DateTime.parse(input);
//   String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  
//   print(formattedDate); // Output: 2023-02-26 19:26:24
// }
