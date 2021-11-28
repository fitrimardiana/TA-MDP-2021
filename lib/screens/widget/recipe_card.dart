import 'package:cook_mate/screens/detail_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String cookTime;
  final String country;
  final String thumbnailUrl;
  final String description;
  final String videoUrl;

  const RecipeCard(
      {required this.title,
      required this.cookTime,
      required this.country,
      required this.thumbnailUrl,
      required this.description,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0),
          ],
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.multiply),
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 19),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: videoUrl != 'noVideo' ? true : false,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadiusDirectional.circular(15)),
                    child: InkWell(
                      onTap: () => {
                        Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => DetailVideo(
                          videoUrl: videoUrl,)))
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_fill_rounded,
                            color: Colors.yellow,
                            size: 10,
                          ),
                          SizedBox(width: 7),
                          Text('Play Video')
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadiusDirectional.circular(15)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 10,
                      ),
                      SizedBox(width: 7),
                      Text(cookTime),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );
  }
}
