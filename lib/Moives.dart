import 'package:flutter/material.dart';
import 'package:moiveapp/Movie.dart';
class Movies extends StatelessWidget {
  String moviename;
  String movieyear;
  String movieimage;
  String moviestorey;
  String movieurl;
  Movies({
    this.moviename,
    this.moviestorey,
    this.movieimage,
    this.movieyear,
    this.movieurl
  });
  @override
  Widget build(BuildContext context) {
return SingleChildScrollView(
  child: Center(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Movie(
                  moviename: moviename,
                  movieimage: movieimage,
                  moviestorey: moviestorey,
                  movieyear: movieyear,
                  movieurl: movieurl,
                )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Container(
                    height: 200,
                    width: 200,
           child: ClipRRect(
             child: Image.network(this.movieimage,fit: BoxFit.fill,)
           ),
                  ),
                ],
              ),
            ),
          )
]
      ),
  ),
);
  }
}
