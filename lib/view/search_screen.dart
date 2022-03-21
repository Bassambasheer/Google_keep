import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_keep_clone/api/firebase_api.dart';
import 'package:google_keep_clone/controller/home_controller.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/widgets/list_veiw_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({this.isSearch =false,Key? key}) : super(key: key);
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                onChanged: (value) {
                  Get.put(HomeController()).valueassign(value);
                },
              ),
              StreamBuilder<List<Note>>(
                  stream: FirebaseApi.getNote(),
                  builder: (context, snapshot) {
                    return GetBuilder<HomeController>(
                      builder: (ctrl) {
                        return ListViewWidget(data: snapshot.data,isSearch: isSearch,);
                      }
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
