import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/model/SourceResponse.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';

class TabItem extends StatelessWidget {
  Source source ;
  bool isSelected ;
  TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      padding: EdgeInsets.symmetric(vertical: 4,horizontal: 12),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryLightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: MyTheme.primaryLightColor
        ),
      ),
      child: Text(source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isSelected ? MyTheme.whiteColor : MyTheme.primaryLightColor,
          fontSize: 18
        ),
      ),

    );
  }
}
