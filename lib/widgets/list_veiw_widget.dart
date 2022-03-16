import 'package:flutter/material.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(1),
              child: Card(
              shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                   side: const BorderSide(
                  color: Colors.grey,
                  width: 0.9
                )
              ),
                child: const ListTile(
                  title: Text("title"),
                  subtitle: Text("body"),
                ),
              ),
            );
          },
          itemCount: 10),
    );
  }
}
