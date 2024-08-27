import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/color_theme.dart';


class Hobbies extends StatefulWidget {
  const Hobbies({super.key});

  @override
  State<Hobbies> createState() => _HobbiesState();
}

class _HobbiesState extends State<Hobbies> {
  List<String> items = [
    "Reading",
    "Writing",
    "Drawing",
    "Travel",
    "Sleeping"
  ];
  List<String> selectedItem = [];

  @override
  Widget build(BuildContext context) {


    return Container(width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColor.greyColor,
              width: 1.3
          )
      ),
      child: Column(
          children: [
            // AllItemCheckHandler(
            //   // im not using list equality
            //   // isAllSelected: items.length == selectedItem.length,
            //   selectAll: (isAllSelected) {
            //     if (isAllSelected) {
            //       selectedItem = items.toList(); // not passing reference
            //     } else {
            //       selectedItem.clear();
            //     }
            //     setState(() {});
            //   },
            // ),

            SizedBox(height: 3,),
            Row(
              children: [
                Text("  Hobbies  :",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
              ],
            ),

            ...items
                .map((e) => CheckboxListTile(
              value: selectedItem.contains(e),
              onChanged: (value) {
                if (selectedItem.contains(e)) {
                  selectedItem.remove(e);
                } else {
                  selectedItem.add(e);
                }
                setState(() {});
              },
              title: Text(e),
            )),
          ],
      ),
    );
  }
}

// class AllItemCheckHandler extends StatefulWidget {
//   const AllItemCheckHandler(
//       {super.key, required this.selectAll, this.isAllSelected = false});
//   final Function(bool) selectAll;
//   final bool isAllSelected;
//
//   @override
//   State<AllItemCheckHandler> createState() => _AllItemCheckHandlerState();
// }
//
// class _AllItemCheckHandlerState extends State<AllItemCheckHandler> {
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       value: widget.isAllSelected,
//       onChanged: (value) {
//         setState(() {});
//         widget.selectAll(value ?? false);
//       },
//     );
//   }
// }