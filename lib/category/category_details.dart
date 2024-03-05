import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/api/api_manager.dart';
import 'package:flutter_app_news_c10_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_online/model/category_DM.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';
import 'package:flutter_app_news_c10_online/tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  CategoryDM category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          /// server (success , error)
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          /// success
          var sourcesList = snapshot.data?.sources ?? [];
          return TabWidget(sourcesList: sourcesList);
        });
  }
}
