import 'dart:convert';

import 'package:flutter_app_news_c10_online/api/api_constatnts.dart';
import 'package:flutter_app_news_c10_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c10_online/model/SourceResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager{
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
------------------------------------------------------------
500c5a4f9b244f3db92a47f436f1819e
 */
  static Future<SourceResponse?> getSources()async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourcesApi,
    {
      'apiKey' : '500c5a4f9b244f3db92a47f436f1819e'
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body ;   /// String
      var json = jsonDecode(responseBody);  /// String => Json
      return SourceResponse.fromJson(json);   /// object => Json
    }catch(e){
      throw e ;
    }

  }

  /*
  https://newsapi.org/v2/everything?apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,
    {
      'apiKey' : '500c5a4f9b244f3db92a47f436f1819e',
      'sources' : sourceId
    });
    try{
      var response = await http.get(url);
      var responseBody = response.body ;  // string
      var json = jsonDecode(responseBody); // json
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e ;
    }

  }
}