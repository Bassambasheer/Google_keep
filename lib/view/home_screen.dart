import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_keep_clone/controller.dart/home_controller.dart';
import 'package:google_keep_clone/view/add_notes%20screen.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';
import 'package:google_keep_clone/widgets/grid_view.dart';
import 'package:google_keep_clone/widgets/list_veiw_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [Text("hey")],
          ),
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                  alignment: Alignment.bottomCenter,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 600),
                  reverseDuration: const Duration(milliseconds: 600),
                  type: PageTransitionType.bottomToTopJoined,
                  child: const AddNotes(),
                  childCurrent: this),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.red,
            size: 40,
          ),
        ),
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
                    icon: const Icon(Icons.check_box_outlined),
                    onPressed: () {},
                  ),
                  rowminspace,
                  IconButton(
                    icon: const Icon(Icons.brush_outlined),
                    onPressed: () {},
                  ),
                  rowminspace,
                  IconButton(
                    icon: const Icon(Icons.mic_none_outlined),
                    onPressed: () {},
                  ),
                  rowminspace,
                  IconButton(
                    icon: const Icon(Icons.photo_size_select_actual_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            )),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[100],
                ),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GetBuilder<HomeController>(builder: (ctrl) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.menu),
                          splashRadius: 25,
                        ),
                        Text(
                          "Search your notes",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[800]),
                        ),
                        const SizedBox(width: 60),
                        ctrl.veiwtype == false
                            ? IconButton(
                                onPressed: () {
                                  ctrl.viewtrue();
                                },
                                icon: const Icon(
                                  Icons.grid_view_outlined,
                                ))
                            : IconButton(
                                onPressed: () {
                                  ctrl.viewfalse();
                                },
                                icon: const Icon(Icons.view_agenda_outlined),
                                splashRadius: 25,
                              ),
                        rowminspace,
                        const CircleAvatar(
                          radius: 15,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              GetBuilder<HomeController>(builder: (ctrl) {
                return ctrl.veiwtype == true
                    ? GridViewWidget()
                    : ListViewWidget();
              })
            ],
          ),
        )));
  }
}
