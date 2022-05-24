import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'author_model.dart';
import 'author_poem/author_poem.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({Key? key}) : super(key: key);

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  Future<Author> authorData() async {
    http.Response response;
    response = await http.get(Uri.parse('https://poetrydb.org/author'));

    if (response.statusCode == 200) {
      return Author.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild to load author');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Author List')),
      body: FutureBuilder<Author>(
        future: authorData(),
        builder: (context, snapshot) {
          final allAuthor = snapshot.data;
          if (snapshot.hasData) {
            return buildAuthorname(allAuthor!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildAuthorname(Author author) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: author.authors.length,
        itemBuilder: (context, index) {
          final data = author.authors[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      AuthorPoem(authorName: data.toString())));
            },
            splashColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.grey.withOpacity(0.3),
            child: Card(
              elevation: 8,
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(
                    child: Text(
                  data.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Kirimomi',
                      fontStyle: FontStyle.italic),
                )),
              ),
            ),
          );
        });
  }
}
