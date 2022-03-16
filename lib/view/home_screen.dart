import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 40,
            color: Colors.grey[300],
            child: Row(
              children: const [
                Icon(Icons.done),
                rowspace,
                Icon(Icons.brush_outlined),
                rowspace,
                Icon(Icons.mic_none_outlined),
                rowspace,
                Icon(Icons.photo_size_select_actual_outlined),
              ],
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[300],
            ),
            width: double.infinity,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    splashRadius: 25,
                    splashColor: Colors.black,
                  ),
                  Text(
                    "Search your notes",
                    style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                  ),
                  const SizedBox(width: 90),
                  const Icon(Icons.grid_view_outlined),
                  rowminspace,
                  const CircleAvatar(
                    radius: 15,
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
