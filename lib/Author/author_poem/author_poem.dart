import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poetry/Author/author_poem/author_poem_model.dart';
import 'package:poetry/Author/author_poem/poem/poem.dart';

class AuthorPoem extends StatefulWidget {
  String authorName;
  AuthorPoem({required this.authorName});

  @override
  State<AuthorPoem> createState() => _AuthorPoemState();
}

class _AuthorPoemState extends State<AuthorPoem> {
  List<AuthorPoemModel> parsePoem(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<AuthorPoemModel>((json) => AuthorPoemModel.fromJson(json))
        .toList();
  }

  Future<List<AuthorPoemModel>> fetchPoem(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://poetrydb.org/author/${widget.authorName}'));

    return parsePoem(response.body);
  }

  /*
  Future<AuthorPoemModel> loadData() async {
    http.Response response;

    response = await http.get(Uri.parse('https://poetrydb.org/author/${widget.authorName}'));

    if(response.statusCode == 200){
      return AuthorPoemModel.fromJson(jsonDecode(response.body));
    } else{
      throw Exception()
    }


  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.authorName),
      ),
      body: FutureBuilder<List<AuthorPoemModel>>(
        future: fetchPoem(http.Client()),
        builder: (context, snapshot) {
          //final randomPoem = snapshot.data;
          //print(snapshot.data);

          if (snapshot.hasData) {
            //print(snapshot.hasData);
            return PoemListAuthor(authorPoem: snapshot.data!);
          } else if (snapshot.hasError) {
            print(snapshot.hasData);
            print('hello');
            return Text('${snapshot.hasError}');
          }
          return Center(
            child: const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PoemListAuthor extends StatelessWidget {
  final List<AuthorPoemModel> authorPoem;

  PoemListAuthor({required this.authorPoem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: authorPoem.length,
      itemBuilder: (context, index) {
        final data = authorPoem[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CardPoem(
                        poemName: data.title.toString(),
                        poem: data.lines,
                      )));
            },
            child: Card(
              elevation: 8,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(
                    child: Text(
                  data.title.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      fontFamily: 'Kirimomi',
                      wordSpacing: 8,
                      fontStyle: FontStyle.italic,
                      color: Colors.white),
                )),
              ),
            ),
          ),
        );
      },
    );
    ;
  }
}
