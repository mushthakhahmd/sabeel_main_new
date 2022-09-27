import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabeel/home.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context)=> const home_page()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 390,
                  width: 320,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/nale.gif"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 240,
                //   width: 360,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/name.png"),
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
                Text("Sabeel_ul Falah", style: GoogleFonts.abel(
                    fontSize: 36,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
