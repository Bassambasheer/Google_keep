import 'package:flutter/material.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/widgets/view_card.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({required this.data, Key? key}) : super(key: key);
  final List<Note>? data;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return  ViewCard(
                title: data?[index].title,
          description: data?[index].description,
            );
          },
          itemCount:  data?.length??0),
    );
  }
}
