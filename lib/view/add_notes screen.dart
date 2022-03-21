import 'package:flutter/material.dart';
import 'package:google_keep_clone/api/firebase_api.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/view/home_screen.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class AddNotes extends StatefulWidget {
  const AddNotes(
      {this.id,
      this.title,
      this.description,
      this.time,
      this.isedit = false,
      Key? key})
      : super(key: key);
  final String? title;
  final String? description;
  final String? id;
  final DateTime? time;
  final bool isedit;

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController titlecontroller = TextEditingController();

  TextEditingController descriptioncontroller = TextEditingController();
  @override
  void dispose() {
    widget.isedit == true ? editNote() : addnote();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title != null) {
      titlecontroller.text = widget.title.toString();
    }
    if (widget.description != null) {
      descriptioncontroller.text = widget.description.toString();
    }
    return Scaffold(
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 40,
            color: Colors.grey[100],
            child: BottomAppBar(
              color: const Color(0xFFFFFFFF),
              shape: const AutomaticNotchedShape(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(0),
                  ),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(22),
                  ),
                ),
              ),
              notchMargin: 4.5,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.add_box_outlined),
                    onPressed: () {},
                  ),
                  rowminspace,
                  IconButton(
                    icon: const Icon(Icons.color_lens_outlined),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Text(widget.time == null
                      ? "Edited ${DateTime.now().hour}:${DateTime.now().minute}"
                      : "Last edited ${widget.time!.hour}:${widget.time!.minute}"),
                  widget.time != null
                      ? const SizedBox(
                          width: 85,
                        )
                      : const SizedBox(width: 115),
                  IconButton(
                    icon: const Icon(Icons.more_vert_sharp),
                    onPressed: () {
                      widget.id != null
                          ? showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        FirebaseApi.deleteNote(widget.id!);
                                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => const HomeScreen())), (route) => false);
                                      },
                                      leading: Icon(Icons.delete),
                                      title: Text('delete'),
                                    ),
                                  ],
                                );
                              })
                          : null;
                    },
                  ),
                ],
              ),
            )),
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

  editNote() async {
    Note note = Note(
        title: titlecontroller.text.trim(),
        description: descriptioncontroller.text.trim(),
        id: widget.id,
        createdTime: DateTime.now());
    if (titlecontroller.text.trim().isEmpty &&
        descriptioncontroller.text.trim().isEmpty) {
      return;
    } else {
      await FirebaseApi.updateNote(note);
    }
  }
}
