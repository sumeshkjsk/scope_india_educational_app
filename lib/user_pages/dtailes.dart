import 'package:flutter/material.dart';
import 'package:fourthpro/placements.dart';

import '../about_page.dart';
import '../contact_page.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Contact()));
              },
              child: Text("Contact",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[800],
                ),
              ),
            ),
            const SizedBox(width: 10,),
            TextButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const About()));
              },
              child: Text("About",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800]
                ),
              ),
            ),
            const SizedBox(width: 10,),
            TextButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Placements()));
              },
              child: Text("Placement cell",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
