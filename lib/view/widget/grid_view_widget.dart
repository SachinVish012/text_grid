import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_grid/res/app_colors/app_colors.dart';

import '../../provider/gridview_provider.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<GridViewProvider>(
        builder: (context, provider, _) {
          return provider.alphabets.isNotEmpty?GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: provider.column,
            ),
            itemCount: provider.row * provider.column,
            itemBuilder: (context, index) {
              if(index<provider.alphabets.length) {
                bool isMatched = provider.searchText.isNotEmpty &&
                    provider.alphabets[index]
                        .toLowerCase()
                        .contains(provider.searchText.toLowerCase());
                return Center(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isMatched ? Colors.green : Colors.blueAccent,
                        width: 2,
                      ),
                      color: isMatched ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      provider.alphabets[index],
                      style: TextStyle(
                        fontSize: isMatched ? 20 : 18,
                        color: isMatched ? Colors.black : Colors.black,
                      ),
                    ),
                  ),
                );
              }else {
                return Container();
              }
            },
          ):Center(child: Text("Grid View",style: TextStyle(color: AppColors.textBalck,fontSize: 18,fontWeight: FontWeight.bold),),);
        },
      ),
    );
  }
}
