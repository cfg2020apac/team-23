import 'package:flutter/material.dart';
import 'package:team_23/widgets/wish_tile.dart';

class WishList extends StatelessWidget {
  final wishes = [
    {'id': '1', 'title': 'Wish 1', 'points': 50},
    {'id': '2', 'title': 'Wish 2', 'points': 70}
  ];
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WishList'),
        backgroundColor: Color(0xff374ABE),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: GridView(
                  children: wishes
                      .map((wish) =>
                          WishTile(wish['id'], wish['title'], wish['points']))
                      .toList(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width,
                    childAspectRatio: 2 / 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
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
                    color: Color(0xff374ABE),
                    borderRadius: BorderRadius.circular(30.0)),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: Text(
                    "Add a wish",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
