import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poetry/Author/author_page.dart';
import 'package:poetry/home/random_poem/random_poem_page.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  dynamic ramdomPoemData;

  dynamic real_data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AuthorPage()));
              },
              child: Ink(
                color: Colors.black,
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Center(
                        child: Text(
                      'See All Authors Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'KirimomiSwash',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    )),
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RandomPoem()));
              },
              splashColor: Colors.grey.withOpacity(0.3),
              highlightColor: Colors.grey.withOpacity(0.3),
              child: Ink(
                color: Colors.black,
                child: Card(
                  elevation: 10,
                  child: SizedBox(
                    child: Center(
                        child: Text(
                      'press for a poem',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'KirimomiSwash',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                      ),
                    )),
                    height: 100,
                    width: double.infinity,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
