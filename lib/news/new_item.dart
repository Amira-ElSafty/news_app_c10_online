import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/model/NewsResponse.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';

class NewsItem extends StatelessWidget {
  News news ;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: MediaQuery.of(context).size.height*0.3 ,
          //   child:
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3 ,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          // ),
          // Container(
          //   clipBehavior: Clip.antiAlias,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20)
          //   ),
          //   child: Image.network(news.urlToImage??""),
          // ),
          SizedBox(height: 10,),
          Text(news.author ??'',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: MyTheme.greyColor
          ),),
          SizedBox(height: 10,),
          Text(news.title ??'',
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          Text(
            news.publishedAt ?? '',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: MyTheme.greyColor
            ),
            textAlign: TextAlign.end,
          ),

        ],
      ),
    );
  }
}
