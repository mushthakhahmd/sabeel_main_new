import 'package:flutter/material.dart';
import 'package:sabeel/constant.dart';
import 'package:sabeel/db/db_function.dart';
import 'package:sabeel/home.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:sabeel/model/item_model.dart';

class item_list_wakeup extends StatefulWidget {
  final int id;
  const item_list_wakeup({Key? key, required this.id}) : super(key: key);

  @override
  _item_list_wakeupState createState() => _item_list_wakeupState();
}

class _item_list_wakeupState extends State<item_list_wakeup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getItems(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        // body: Expanded(
        //   child: Container(
        //     margin: EdgeInsets.all(10),
        //     padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        //     decoration: BoxDecoration(
        //         border: Border.all(
        //           color: Color(0xffB9930E),
        //           width: 1,
        //         ),
        //         borderRadius: BorderRadius.circular(10)),
        //     child: ListView.builder(
        //         itemCount: 4,
        //         itemBuilder: (itemBuilder, index) {
        //           return Padding(
        //             padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        //             child: Card(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(12.0),
        //               ),
        //               child: ListTile(
        //                 leading: SizedBox(
        //                     height: 50.0,
        //                     width: 50.0, // fixed width and height
        //                     child: Image.asset("list.png")),
        //                 title: Text(
        //                   'Dua After Waking From Sleep',
        //                   style: TextStyle(color: Colors.black, fontSize: 16),
        //                 ),
        //                 subtitle: Text(
        //                   'دُعَاءُ الِاستِيْقَاظِ مِنَ النَّوم',
        //                   style: TextStyle(color: Colors.black87, fontSize: 16),
        //                 ),
        //                 trailing: Padding(
        //                   padding: const EdgeInsets.only(bottom: 25),
        //                   child: Container(
        //                     height: 24,
        //                     width: 24,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(20),
        //                       color: Colors.white,
        //                       boxShadow: [
        //                         BoxShadow(
        //                           color: Colors.grey
        //                               .withOpacity(0.5), //color of shadow
        //                           spreadRadius:
        //                               0.5, //spread radius// blur radius
        //                           // changes position of shadow
        //                         ),
        //                       ],
        //                     ),
        //                     child: FavoriteButton(
        //                       iconSize: 24,
        //                       isFavorite: false,
        //                       // iconDisabledColor: Colors.white,
        //                       valueChanged: (_isFavorite) {
        //                         print('Is Favorite : $_isFavorite');
        //                       },
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //         }),
        //   ),
        // ));

        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 330,
              ),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => home_page()));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xff1D438A),
                        size: 24,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SpaceBar(),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: itemsNotifier,
                  builder:
                      (BuildContext ctx, List<Items> items, Widget? child) {
                    return ListView.builder(
                      itemCount: itemsNotifier.value.length,
                      shrinkWrap: true,
                      itemBuilder: (itemBuilder, index) {
                        final item = itemsNotifier.value[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              leading: SizedBox(
                                  height: 50.0,
                                  width: 50.0, // fixed width and height
                                  child: Image.asset("list.png")),
                              title: Text(
                                item.title,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              subtitle: Text(
                                item.subTitle,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), //color of shadow
                                        spreadRadius:
                                            0.5, //spread radius// blur radius
                                        // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: FavoriteButton(
                                    iconSize: 24,
                                    isFavorite: item.isFavorite,
                                    // iconDisabledColor: Colors.white,
                                    valueChanged: (_isFavorite) async {
                                      await updateFavorite(
                                          item.id, _isFavorite.toString());
                                      print('Is Favorite : $_isFavorite');
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class adkr_aftr_prayer extends StatefulWidget {
  const adkr_aftr_prayer({Key? key}) : super(key: key);

  @override
  _adkr_aftr_prayerState createState() => _adkr_aftr_prayerState();
}

class _adkr_aftr_prayerState extends State<adkr_aftr_prayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade200,
            pinned: true,
            floating: true,
            expandedHeight: 150,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 330,
                  ),
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home_page()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff1D438A),
                            size: 24,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SpaceBar(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffB9930E),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Dua After Waking From Sleep',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'دُعَاءُ الِاستِيْقَاظِ مِنَ النَّوم',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Sura Al-Imran (190-200)',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'آل عمران (190-200)',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Thahajjud Prayer',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'صَلَاةُ التَّهَجُّدِ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Dua of Asma-Ul-Husna',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'دُعَاءُ أَسْمَاءِ اللهِ الْحُسْنَى',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Ya Aalimi Sirra Minna',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'يَا عَالِمَ السِّرِّ مِنَّا',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class adkr_fajr extends StatefulWidget {
  const adkr_fajr({Key? key}) : super(key: key);

  @override
  _adkr_fajrState createState() => _adkr_fajrState();
}

class _adkr_fajrState extends State<adkr_fajr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade200,
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 150,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 330,
                  ),
                  child: Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home_page()));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff1D438A),
                            size: 24,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SpaceBar(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffB9930E),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Before And After Fajr Prayer',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'قَبْلَ صَلَاةِ الفَجْرِ وَبَعْدَهَا',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Dua For Children Of Imam Haddad',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'الدعاء للأولاد للإمام الحداد',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Ilaika Ya Rabbi',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'إِلَيْكَ يَا رَبِّ قَدْ وَجَّهْتُ حَاجَاتِيِ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            "Virdul Latheef Of Imam Haddad",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'الْوِرْدُ اللَّطِيفُ لِلْإِمَامِ الْحَدَّاد',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius:
                                        0.5, //spread radius// blur radius
                                    // changes position of shadow
                                  ),
                                ],
                              ),
                              child: FavoriteButton(
                                iconSize: 24,
                                isFavorite: false,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Seven Zhikr',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'المُسَبِّعَات',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Salamathul Iman',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'سَلَامَةُ الْإِيمَانِ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          leading: SizedBox(
                              height: 50.0,
                              width: 50.0, // fixed width and height
                              child: Image.asset("list.png")),
                          title: Text(
                            'Reward of sura fathia ',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          subtitle: Text(
                            'ترتيب ايصال ثواب سورة الفاتحة ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 1, //spread radius
                                    blurRadius: 1, // blur radius
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius:
                                          0.5, //spread radius// blur radius
                                      // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: FavoriteButton(
                                  iconSize: 24,
                                  isFavorite: false,
                                  // iconDisabledColor: Colors.white,
                                  valueChanged: (_isFavorite) {
                                    print('Is Favorite : $_isFavorite');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
