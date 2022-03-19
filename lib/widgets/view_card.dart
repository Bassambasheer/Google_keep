import 'package:flutter/material.dart';
import 'package:google_keep_clone/widgets/common_widgets.dart';

class ViewCard extends StatelessWidget {
  const ViewCard({this.title, this.description, Key? key}) : super(key: key);
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
      decoration: BoxDecoration(
    border: Border.all(
      color: Colors.grey.shade500,
    ),
    borderRadius: BorderRadius.circular(6),
  ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               title.toString().isEmpty? const SizedBox() : Text(title??'',
               style:const TextStyle(
                 fontSize: 18,
                 fontWeight: FontWeight.w500
               ) ,),
               minspace,
               description.toString().isEmpty? const SizedBox() : Text(description??'',
                style:const TextStyle(
                 fontSize: 16,
               ) )
            ],
          ),
        ),
      ),
    );
  }
}
