import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_keep_clone/controller/home_controller.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/widgets/view_card.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({this.isSearch = false, required this.data, Key? key})
      : super(key: key);
  final List<Note>? data;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {

            return isSearch == false
                ?  ViewCard(
                    title: data?[index].title,
                    description: data?[index].description,
                    id: data?[index].id,
                    time: data?[index].createdTime,
                  ) : data![index]
                            .title
                            .toString().toLowerCase()
                            .contains(searchtext.toString().toLowerCase()) ?
                            ViewCard(
                 title: data?[index].title,
                    description: data?[index].description,
                    id: data?[index].id,
                    time: data?[index].createdTime,
                            ): const SizedBox();
          },
          itemCount: data?.length ?? 0),
    );
  }
}
