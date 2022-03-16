import 'package:flutter/material.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class AddNotes extends StatelessWidget {
  const AddNotes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        shadowColor:white,
        backgroundColor:white,
        iconTheme:  const IconThemeData(
    color: black, 
  ),
  actions: [
    IconButton(onPressed: (){},
     icon: const Icon(Icons.push_pin_outlined)),
     rowminspace,
     IconButton(onPressed: (){},
     icon: const Icon(Icons.add_alert_outlined)),
     rowminspace,
     IconButton(onPressed: (){},
     icon: const Icon(Icons.archive_outlined))
  ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                 style: TextStyle(
                  fontSize: 30
                ),
               decoration:  InputDecoration(
                 border: InputBorder.none,
              hintText: 'Title',hintStyle:TextStyle(
                fontSize: 24,
                color: Colors.grey,
                fontWeight: FontWeight.w400
              ))),
             TextField(
               keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                  fontSize: 22
                ),
               decoration:  InputDecoration(
                 border: InputBorder.none,
              hintText: 'Note',hintStyle:TextStyle(
                fontSize: 
                18,
                color: Colors.grey,
                fontWeight: FontWeight.w400
              ) ,
  ),

            )
          ],
        ),
      )
    );
  }
}