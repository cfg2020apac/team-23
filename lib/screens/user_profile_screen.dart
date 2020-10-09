import 'package:flutter/material.dart';
import '../widgets/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UserProfileScreen extends StatelessWidget {
  final List<Progress> data = [
    Progress(
        year: '2016',
        score: 10,
        barColor: charts.ColorUtil.fromDartColor(Color(0xff374ABE))),
    Progress(
        year: '2017',
        score: 20,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    Progress(
        year: '2018',
        score: 20,
        barColor: charts.ColorUtil.fromDartColor(Color(0xff374ABE))),
    Progress(
        year: '2019',
        score: 30,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    Progress(
        year: '2020',
        score: 20,
        barColor: charts.ColorUtil.fromDartColor(Color(0xff374ABE))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: CircleAvatar(
      //     child: Image.network(
      //         'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png'),
      //   ),
      //   title: Text('Profile'),
      //   actions: [
      //     RaisedButton(
      //       child: Image.network(
      //         'https://harperlibrary.typepad.com/.a/6a0105368f4fef970b01b7c89530b0970b-800wi',
      //         colorBlendMode: BlendMode.clear,
      //       ),
      //       onPressed: () {
      //       },
      //     )
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff374ABE),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event), title: Text('Events')),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), title: Text('Wishlist')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.06,
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://i.kinja-img.com/gawker-media/image/upload/t_original/ijsi5fzb1nbkbhxa2gc1.png'))),
                      ),
                      Text('John Doe')
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '100 Points',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://harperlibrary.typepad.com/.a/6a0105368f4fef970b01b7c89530b0970b-800wi'))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: 80.0,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "My Events",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: 80.0,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Wish List",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: 80.0,
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Achievements",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ProgressChart(
              data: data,
            )
          ],
        ),
      ),
    );
  }
}
