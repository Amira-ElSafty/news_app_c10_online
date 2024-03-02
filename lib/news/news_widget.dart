import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/api/api_manager.dart';
import 'package:flutter_app_news_c10_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c10_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';

class NewsWidget extends StatefulWidget {
  Source source ;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ??''),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('SomeThing went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          // server (success , error)
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          // data
          var newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
              itemBuilder: (context,index){
                return Text(newsList[index].title ?? '');
              },
            itemCount: newsList.length,
          );
        }
    );
  }
}
