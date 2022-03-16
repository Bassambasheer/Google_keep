import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: 10,
      itemBuilder: (context, index) {
        return  Card(
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.grey,
                  width: 0.9
                )
              ),
          borderOnForeground: false,
          shadowColor: black,
          
            child: const ListTile(
          title: Text("title"),
          subtitle: Text("body"),
        ));
      },
    ));
  }
}
