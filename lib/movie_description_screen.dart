import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/constants.dart';

class MovieDescriptionScreen extends StatelessWidget {
  MovieDescriptionScreen({Key? key, required this.movie}) : super(key: key);
  var movie;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "${movie.title}",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 1,
        actions: [
          GestureDetector(
            onTap: () {
              print("DarkMode----------------->${Get.isDarkMode}");
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: Get.isDarkMode
                        ? [
                            Colors.red.shade900,
                            Colors.orange.shade500,
                            // iconColor,
                            // scaffold_color
                          ]
                        : [
                            Colors.black,
                            Colors.white,
                          ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  boxShadow: Get.isDarkMode
                      ? drawerDarkModeShadow
                      : drawerLightModeshadow),
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.1),
                // height: height * 0.7,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // SizedBox(height: height*0.1,),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.05),
                  child: Text(
                    "${movie.overview}",
                    style: Theme.of(context).textTheme.headline2,
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
