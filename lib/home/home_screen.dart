import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/category/category_details.dart';
import 'package:flutter_app_news_c10_online/category/category_fragment.dart';
import 'package:flutter_app_news_c10_online/drawer/home_drawer.dart';
import 'package:flutter_app_news_c10_online/model/category_DM.dart';
import 'package:flutter_app_news_c10_online/my_theme.dart';
import 'package:flutter_app_news_c10_online/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            selectedMenuItem == HomeDrawer.settings?
                'Settings':
                selectedCategory == null ?
            'News App':
                    selectedCategory!.title
            ,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick),
        ),
        body: selectedMenuItem == HomeDrawer.settings ?
            SettingsTab()
            :
        selectedCategory == null
            ? CategoryFragment(onCategoryClick: onCategoryClick)
            : CategoryDetails(category: selectedCategory!),
      )
    ]);
  }

  CategoryDM? selectedCategory;

  void onCategoryClick(CategoryDM newSelectedCategory) {
    //todo: newSelectedCategory => User
    selectedCategory = newSelectedCategory;
    setState(() {

    });
  }

  int selectedMenuItem = HomeDrawer.categories ;
  void onSideMenuItemClick(int newSelectedMenuItem){
    selectedMenuItem = newSelectedMenuItem ;
    selectedCategory = null ;
    Navigator.pop(context);
    setState(() {

    });
  }
}
