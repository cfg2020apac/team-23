import 'package:flutter/material.dart';

class WishTile extends StatelessWidget {
  final String id;
  final String title;
  final int points;

  WishTile(this.id, this.title, this.points);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${points} points devoted towards the wish',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
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
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Add more points",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(6, 250, 25, 1),
              Color.fromRGBO(193, 250, 218, 1)
            ]),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
