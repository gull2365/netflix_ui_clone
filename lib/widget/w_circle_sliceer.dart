import 'package:flutter/material.dart';
import '../model/model_movie.dart';
import '../screen/s_detail.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;
  const CircleSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("미리보기"),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeCircleImages(movies, context),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeCircleImages(List<Movie> movies, BuildContext context) {
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
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/${movies[i].poster}'),
            ),
          ),
        ),
      ),
    );
  }
  return results;
}
