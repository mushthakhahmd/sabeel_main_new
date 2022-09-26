import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sabeel/items.dart';
import 'app_icons.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle_rounded,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.category,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.assistant_navigation,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Qibla Finder",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_none,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Notifications",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black26,
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Color(0xff1D438A),
              ),
              title: Text(
                "Share",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.transparent,
            elevation: 10.10,
            toolbarHeight: 60,
            title: Text(
              "Sabeel_ul Falah",
              style: GoogleFonts.abel(
                  fontSize: 22,
                  color: Colors.black54,
                  fontWeight: FontWeight.normal),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.view_headline_outlined,
                  color: Color(0xff1D438A),
                  size: 28,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: 364,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white),
                                child: const Center(
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    cursorColor: Colors.black45,
                                    decoration: InputDecoration(
                                      focusColor: Colors.blue,
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Search by Title",
                                      hintStyle: TextStyle(
                                          color: Colors.black45, fontSize: 16),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Row(
                        children: [
                          Text(
                            "Catagories",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Color(0xff3F414E),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ), //catagories
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                item_list_wakeup(
                                                  cat_id: 1,
                                                )));
                                  },
                                  child: Container(
                                    height:
                                        130, //MediaQuery.of(content).size.height,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/shape.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 32,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/thahajjud.png"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          child: Text(
                                            "اوراد التهجد",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Upon Wakeup &",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Tahajjud Adhkar",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                item_list_wakeup(cat_id: 2)));
                                  },
                                  child: Container(
                                    height:
                                        130, //MediaQuery.of(content).size.height,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/shape.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 32,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:
                                                  AssetImage("assets/fajr1.png"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          child: Text(
                                            "أوراد الفجر",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Awrad of Fajr",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:3)));
                                  },
                                  child: Container(
                                    height:
                                        130, //MediaQuery.of(content).size.height,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/shape.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          width: 32,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/dikr.png"),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          child: Text(
                                            "الأَذْكَارُ بَعْدَ",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "صَلَوَاتِ الْخَمْس",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar After",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Five Prayers",
                                    style: GoogleFonts.blinker(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                    ]),
                    SizedBox(
                      height: 10,
                    ), //1st row
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:4)));
                                  },
                                child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/dhuha1.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          child: Text(
                                            "أوراد الضحى",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )                                ,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar Dhuha",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "  ",
                                    style: GoogleFonts.blinker(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:5)));
                                  },
                                child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/duhr.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "أوراد الظهر",
                                          style: GoogleFonts.cairo(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar Luhr",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "  ",
                                    style: GoogleFonts.blinker(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:6)));
                                  },
                                child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/asr1.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "أوراد العصر",
                                          style: GoogleFonts.cairo(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar Asr",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "   ",
                                    style: GoogleFonts.blinker(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                    ]),

                    ///2nd row
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:7)));
                                  },
                                child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/magrib1.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Container(
                                          child: Text(
                                            "أوراد المغرب",
                                            style: GoogleFonts.cairo(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar Magrib",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "   ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:8)));
                                  },
                                child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 26,
                                      ),
                                      Container(
                                        width: 28,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/surah.png"),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: Text(
                                          "السور المفضلة",
                                          style: GoogleFonts.cairo(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          "لكل اليوم",
                                          style: GoogleFonts.cairo(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Daily Surah",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "  ",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        width: 30,
                      ),
                      Row(children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => item_list_wakeup(cat_id:9)));
                                  },
                                  child:Container(
                                  height:
                                      130, //MediaQuery.of(content).size.height,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/shape.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage("assets/isha1.png"),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        child: Text(
                                          "أوراد العشاء",
                                          style: GoogleFonts.cairo(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "Azkar Isha",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    "   ",
                                    style: GoogleFonts.blinker(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ]),
                    ]), //3rd row
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:10)));
                                      },
                                      child: Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/bed.png"),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              "اذكار قبل",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "النوم",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Adhkar Before",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Sleep",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                          SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:11)));
                                      },
                                      child: Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/jumua.png"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              "اذكار اليوم",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "الجمعة",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Azkar of",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Friday",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                          SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:12)));
                                      },
                                      child: Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/muslim.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Container(
                                            child: Text(
                                              "  يوم المسلم",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "(سنة)",
                                              style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        " Day of Muslim",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "(Sunnah)",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ]), //4th row
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:13)));
                                      },
                                      child:
                                    Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/dalaelul.png"),
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Container(
                                              child: Text(
                                                "الصلوات المفضلة",
                                                style: GoogleFonts.cairo(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Container(
                                              child: Text(
                                                "و دلائل الخيرات",
                                                style: GoogleFonts.cairo(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Dalaelul Khairath",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "and Swalath",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                          SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:14)));
                                      },
                                      child:
                                    Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/moulid.png"),
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Container(
                                              child: Text(
                                                "الموالد",
                                                style: GoogleFonts.cairo(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Moulid",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                          SizedBox(
                            width: 30,
                          ),
                          Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => item_list_wakeup(cat_id:15)));
                                      },
                                      child:
                                    Container(
                                      height:
                                          130, //MediaQuery.of(content).size.height,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/shape.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: 32,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/quran.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, right: 5),
                                            child: Container(
                                              child: Text(
                                                "القصائد",
                                                style: GoogleFonts.cairo(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "Qaseeda",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        "",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ]), //5th row
                    SizedBox(
                      height: 10,
                    ),
                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   Row(children: [
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Container(
                    //               height:
                    //                   130, //MediaQuery.of(content).size.height,
                    //               width: 90,
                    //               decoration: BoxDecoration(
                    //                 image: DecorationImage(
                    //                   image: AssetImage("assets/shape.png"),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   SizedBox(
                    //                     height: 20,
                    //                   ),
                    //                   Container(
                    //                     width: 32,
                    //                     height: 36,
                    //                     decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                         image:
                    //                             AssetImage("assets/spday.png"),
                    //                         fit: BoxFit.fitWidth,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "أذكار الأيام",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "الفاضلة",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 "Special Days",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 "Adhkar",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ]),
                    //   SizedBox(
                    //     width: 30,
                    //   ),
                    //   Row(children: [
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Container(
                    //               height:
                    //                   130, //MediaQuery.of(content).size.height,
                    //               width: 90,
                    //               decoration: BoxDecoration(
                    //                 image: DecorationImage(
                    //                   image: AssetImage("assets/shape.png"),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   SizedBox(
                    //                     height: 20,
                    //                   ),
                    //                   Container(
                    //                     width: 32,
                    //                     height: 36,
                    //                     decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                         image:
                    //                             AssetImage("assets/hajj.png"),
                    //                         fit: BoxFit.fitHeight,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "اذكار الحج",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "والعمرة",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 "Hajj & Umrah",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 " ",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ]),
                    //   SizedBox(
                    //     width: 30,
                    //   ),
                    //   Row(children: [
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Container(
                    //               height:
                    //                   130, //MediaQuery.of(content).size.height,
                    //               width: 90,
                    //               decoration: BoxDecoration(
                    //                 image: DecorationImage(
                    //                   image: AssetImage("assets/shape.png"),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //               ),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: [
                    //                   SizedBox(
                    //                     height: 20,
                    //                   ),
                    //                   Container(
                    //                     width: 32,
                    //                     height: 36,
                    //                     decoration: BoxDecoration(
                    //                       image: DecorationImage(
                    //                         image: AssetImage(
                    //                             "assets/mayyith.jpg"),
                    //                         fit: BoxFit.fill,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 5,
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "ما ينتفع",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   ),
                    //                   Container(
                    //                     child: Text(
                    //                       "للموتى",
                    //                       style: GoogleFonts.cairo(
                    //                           fontSize: 13,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(
                    //           height: 5,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 "Which Benefits",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               child: Text(
                    //                 "For Mayyith",
                    //                 style: GoogleFonts.roboto(
                    //                     fontSize: 16,
                    //                     color: Colors.black,
                    //                     fontWeight: FontWeight.w600),
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //   ]),
                    // ]), //6th row
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Row(children: [
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   height:
                    //                       130, //MediaQuery.of(content).size.height,
                    //                   width: 90,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage("assets/shape.png"),
                    //                       fit: BoxFit.cover,
                    //                     ),
                    //                   ),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       SizedBox(
                    //                         height: 15,
                    //                       ),
                    //                       Container(
                    //                         width: 32,
                    //                         height: 36,
                    //                         decoration: BoxDecoration(
                    //                           image: DecorationImage(
                    //                             image: AssetImage(
                    //                                 "assets/travel.png"),
                    //                             fit: BoxFit.fitWidth,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 10,
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             bottom: 5),
                    //                         child: Container(
                    //                           child: Text(
                    //                             "أذكار السفر",
                    //                             style: GoogleFonts.cairo(
                    //                                 fontSize: 13,
                    //                                 color: Colors.black,
                    //                                 fontWeight:
                    //                                     FontWeight.bold),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "Adhkar & Dua",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "For Travelling",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ]),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Row(children: [
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   height:
                    //                       130, //MediaQuery.of(content).size.height,
                    //                   width: 90,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage("assets/shape.png"),
                    //                       fit: BoxFit.cover,
                    //                     ),
                    //                   ),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       SizedBox(
                    //                         height: 20,
                    //                       ),
                    //                       Container(
                    //                         width: 32,
                    //                         height: 36,
                    //                         decoration: BoxDecoration(
                    //                           image: DecorationImage(
                    //                             image: AssetImage(
                    //                                 "assets/mahlarath.png"),
                    //                             fit: BoxFit.fitHeight,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       Container(
                    //                         child: Text(
                    //                           "المحضرة",
                    //                           style: GoogleFonts.cairo(
                    //                               fontSize: 13,
                    //                               color: Colors.black,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Container(
                    //                         child: Text(
                    //                           "البدرية",
                    //                           style: GoogleFonts.cairo(
                    //                               fontSize: 13,
                    //                               color: Colors.black,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "Al Mahlarathul",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "badriyya",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ]),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       Row(children: [
                    //         Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   height:
                    //                       130, //MediaQuery.of(content).size.height,
                    //                   width: 90,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage("assets/shape.png"),
                    //                       fit: BoxFit.cover,
                    //                     ),
                    //                   ),
                    //                   child: Column(
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       SizedBox(
                    //                         height: 20,
                    //                       ),
                    //                       Container(
                    //                         width: 32,
                    //                         height: 36,
                    //                         decoration: BoxDecoration(
                    //                           image: DecorationImage(
                    //                             image: AssetImage(
                    //                                 "assets/other.png"),
                    //                             fit: BoxFit.cover,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         height: 5,
                    //                       ),
                    //                       Container(
                    //                         child: Text(
                    //                           "أذكار لسائر",
                    //                           style: GoogleFonts.cairo(
                    //                               fontSize: 13,
                    //                               color: Colors.black,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Container(
                    //                         child: Text(
                    //                           "الأوقات",
                    //                           style: GoogleFonts.cairo(
                    //                               fontSize: 13,
                    //                               color: Colors.black,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       )
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             SizedBox(
                    //               height: 5,
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "Adhkar On",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Container(
                    //                   child: Text(
                    //                     "Other Occasions",
                    //                     style: GoogleFonts.roboto(
                    //                         fontSize: 16,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w600),
                    //                   ),
                    //                 )
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ]),
                    //     ]), //7th row
                    // SizedBox(
                    //   height: 20,
                    // ), //7th row
                  ]),
            ],
          )),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Saved"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(MyFlutterApp.COUNTER),
            title: Text("Counter"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
