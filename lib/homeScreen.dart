import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_api/ApiService/api_service.dart';
import 'package:movie_api/Models/movieModel.dart';
import 'package:movie_api/constants.dart';
import 'package:movie_api/movie_description_screen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _movieData;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movieData = MovieApi().getMovies();
    print(_movieData);
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 10);
    return await Timer(duration, () {
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => OnbordingPage()));
      setState(() {
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Color(0XFFE6EEF8),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "Top Rated Movies",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        // backgroundColor: Colors.blueGrey,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 1,
        actions: [
          GestureDetector(
            onTap: () {
              // print("DarkMode----------------->${Get.isDarkMode}");
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
      body: FutureBuilder<Movie>(
          future: _movieData,
          builder: (context, snapshot) {
            if (snapshot.hasData && loading) {
              return ListView.builder(
                  itemCount: snapshot.data?.results.length,
                  itemBuilder: (context, index) {
                    var movie = snapshot.data!.results[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Get.to(MovieDescriptionScreen(movie: movie));
                        });
                      },
                      child: Container(
                        height: height * 0.1,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: Colors.green.shade100,
                          color: Theme.of(context).primaryColor,
                          boxShadow:
                              Get.isDarkMode ? darkmodeShadow : lightmodeShadow,
                        ),
                        child: Row(
                          children: [
                            Hero(
                              tag: movie.id,
                              child: Container(
                                width: width * 0.2,
                                height: width * 0.2,
                                decoration: BoxDecoration(
                                    // color:Colors.red,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original/${movie.backdropPath}",
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Expanded(
                                child: Text(
                              movie.title,
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              print(snapshot.data?.results.length);
              return Center(
                  // child: CircularProgressIndicator(),
                  child: Lottie.asset('assets/lottieFiles/movie.json',
                      width: width * 0.6));
            }
          }),
    );
  }
}
