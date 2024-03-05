import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1 ;
  static const int settings = 2 ;
  Function onSideMenuItemClick ;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            // height:MediaQuery.of(context)
            //     .size.height*0.10 ,
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context)
            .size.height*0.10),
            color: MyTheme.primaryLightColor,
            child: Text('News APP!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 10,),
                  Text('Categories',
                    style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 10,),
                  Text('Settings',
                  style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
