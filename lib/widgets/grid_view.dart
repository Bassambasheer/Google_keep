import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/widgets/view_card.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({required this.data, Key? key}) : super(key: key);
  final List<Note>? data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: data?.length??0,
      itemBuilder: (context, index) {
        return  ViewCard(
          title: data?[index].title,
          description: data?[index].description,
        );
      },
    ));
  }
}
