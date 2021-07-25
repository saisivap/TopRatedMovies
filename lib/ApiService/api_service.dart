import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/Models/movieModel.dart';

class MovieApi {
  Future<Movie> getMovies() async {
    var movieModel = null;
    var url = Uri.parse(
        "https://api.themoviedb.org/3/movie/top_rated?api_key=dabe7895b0e1f59ae1ac648e4fbfca3c&language=en-US&page=1");
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print("I am here");
      var jsonResponse = jsonDecode(res.body);
      print(jsonResponse);
      var movieModel = Movie.fromJson(jsonResponse);
       return movieModel;
    } else {
      print("error in APi");
       return movieModel;
    }
   
  }
}
