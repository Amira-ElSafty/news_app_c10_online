import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_online/category/category_item.dart';
import 'package:flutter_app_news_c10_online/model/category_DM.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = CategoryDM.getCategories();
  Function onCategoryClick ;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \nof interest',
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15
                ),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoriesList[index]);
                    },
                      child: CategoryItem(category: categoriesList[index], index: index));
                },
            itemCount: categoriesList.length ,),
          )
        ],
      ),

    );
  }
}
