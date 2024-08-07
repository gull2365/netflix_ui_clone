import 'package:flutter/material.dart';

import '../model/model_movie.dart';
import '../screen/s_detail.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movies;
  const BoxSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("지금 뜨는 콘텐츠"),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeBoxImages(movies, context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> makeBoxImages(List<Movie> movies, BuildContext context) {
    List<Widget> results = [];
    for (var i = 0; i < movies.length; i++) {
      results.add(
        InkWell(
          // 클릭 가능하도록 InkWell 위젯 사용
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return DetailScreen(movie: movies[i]);
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('images/${movies[i].poster}'),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return results;
  }
}
