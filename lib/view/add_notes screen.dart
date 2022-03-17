import 'package:flutter/material.dart';
import 'package:google_keep_clone/api/firebase_api.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class AddNotes extends StatefulWidget {
  AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();
  @override
  void dispose() {
    addnote();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          shadowColor: white,
          backgroundColor: white,
          iconTheme: const IconThemeData(
            color: black,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.push_pin_outlined)),
            rowminspace,
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.add_alert_outlined)),
            rowminspace,
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.archive_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextField(
                  controller: titlecontroller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: const TextStyle(fontSize: 30),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400))),
              TextField(
                controller: descriptioncontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note',
                  hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ));
  }

  addnote() async {
    Note note = Note(
        title: titlecontroller.text.trim(),
        description: descriptioncontroller.text.trim(),
        createdTime: DateTime.now());
    if (titlecontroller.text.trim().isEmpty &&
        descriptioncontroller.text.trim().isEmpty) {
      return;
    } else {
     await FirebaseApi.createNote(note);
    }
  }
}
