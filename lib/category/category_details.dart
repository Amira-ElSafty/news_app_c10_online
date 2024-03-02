import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/api/api_manager.dart';
import 'package:flutter_app_news_c10_online/category/tab_widget.dart';
import 'package:flutter_app_news_c10_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'News App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: MyTheme.primaryLightColor,
                  ),
                );
              }else if(snapshot.hasError){
                return Column(
                  children: [
                    Text('Something went wrong'),
                    ElevatedButton(onPressed: (){
                      ApiManager.getSources();
                      setState(() {

                      });
                    }, child: Text('Try Again'))
                  ],
                );
              }
              /// server (success , error)
              if(snapshot.data?.status != 'ok'){
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? 'Something went wrong'),
                    ElevatedButton(onPressed: (){
                      ApiManager.getSources();
                      setState(() {

                      });
                    }, child: Text('Try Again'))
                  ],
                );
              }
              /// success
              var sourcesList = snapshot.data?.sources ?? [];
              return TabWidget(sourcesList: sourcesList);

            }
        ),
      )
    ]);
  }
}
