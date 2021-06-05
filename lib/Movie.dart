import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class Movie extends StatefulWidget {
  Movie({Key key, this.moviename,this.movieyear,this.movieimage,this.moviestorey,this.movieurl}) : super(key: key);
  String moviename;
  String movieyear;
  String movieimage;
  String moviestorey;
  String movieurl;
  @override
  _Movie createState() => _Movie();
}
class _Movie extends State<Movie> {
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(widget.movieurl),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.moviename),),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 10.0,
                color: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                            child: Image.network(widget.movieimage,fit: BoxFit.fill,)
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 20,),
              Text(widget.movieyear,style: TextStyle(color: Colors.white),),
Divider(
  thickness: 1,
),
Column(
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    SizedBox(height: 10,),
    Text(widget.moviestorey,style: TextStyle(color: Colors.white),),
    SizedBox(height: 10,),
    FlickVideoPlayer(
      flickManager: flickManager,
      flickVideoWithControls: FlickVideoWithControls(
        controls: FlickPortraitControls(),
      ),
      flickVideoWithControlsFullscreen: FlickVideoWithControls(
        controls: FlickLandscapeControls(),
      ),
    ),
  ],
)
            ],
          ),
        ),
      ),
    );
  }
}
