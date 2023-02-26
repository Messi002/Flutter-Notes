import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notesapp/style/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          title: const Text('FireNotes'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppStyle.mainColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your recent Notes',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 22.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Notes').snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }

                  if (snapshot.hasData) {
                    return GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2));
                  }
                  return Text(
                    'No Notes Available',
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              )
            ],
          ),
        ));
  }
}
