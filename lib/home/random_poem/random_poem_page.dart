import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poetry/home/random_poem/random_poem_class.dart';

class RandomPoem extends StatefulWidget {
  const RandomPoem({Key? key}) : super(key: key);

  @override
  State<RandomPoem> createState() => _RandomPoemState();
}

class _RandomPoemState extends State<RandomPoem> {
  List<Poem> parsePoem(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Poem>((json) => Poem.fromJson(json)).toList();
  }

  Future<List<Poem>> fetchPoem(http.Client client) async {
    final response =
        await client.get(Uri.parse('https://poetrydb.org/random/1'));
    return parsePoem(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Random poem'),
        ),
        body: FutureBuilder<List<Poem>>(
          future: fetchPoem(http.Client()),
          builder: (context, snapshot) {
            //final randomPoem = snapshot.data;
            //print(snapshot.data);

            if (snapshot.hasData) {
              //print(snapshot.hasData);
              return PoemList(poem: snapshot.data!);
            } else if (snapshot.hasError) {
              print(snapshot.hasData);
              print('hello');
              return Text('${snapshot.hasError}');
            }
            return Center(
              child: const CircularProgressIndicator(),
            );
          },
        ));
  }
}

class PoemList extends StatelessWidget {
  final List<Poem> poem;

  PoemList({required this.poem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: poem.length,
      itemBuilder: (context, index) {
        final data = poem[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                data.title.toString(),
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(data.author.toString()),
              SizedBox(
                height: 20,
              ),
              Text(
                data.lines.join(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    fontFamily: 'Kirimomi',
                    wordSpacing: 8,
                    color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}
