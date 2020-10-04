import 'package:flutter/material.dart';
import 'package:inshortapp/models/model.dart';
import 'package:inshortapp/service/api.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Future<Welcome> _welcome;
  @override
  void initState() {
    // TODO: implement initState
    _welcome = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Welcome>(
        future: _welcome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: [
                              // Card(
                              //   clipBehavior: Clip.antiAlias,
                              //   shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(24),
                              //   ),
                              //   child: AspectRatio(
                              //     aspectRatio: 1,
                              //     child: Image.network(
                              //       article.urlToImage,
                              //       fit: BoxFit.cover,
                              //     ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Image.network(article.urlToImage)),
                              SizedBox(height: 10),

                              Text(article.title,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 10),
                              Text(article.description,
                                  overflow: TextOverflow.visible,
                                  maxLines: 6,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
