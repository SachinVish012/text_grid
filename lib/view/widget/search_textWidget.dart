import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_grid/res/components/custome_button.dart';
import 'package:test_grid/res/text_localization/text_localization.dart';
import 'package:test_grid/res/toast/flutter_toast.dart';

import '../../provider/gridview_provider.dart';
import '../../res/components/custom_textfield.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<GridViewProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: Consumer<GridViewProvider>(
            builder: (context, value, child) {
              return  CustomTextField(
                controller: value.searchcontroller,
                  labelText: AppText.search_text,
                  margin: EdgeInsets.only(left: 10,right: 10),
                  inputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
                  onChanged:(value1) {
                  }
              );
            },
          ),
        ),
        Expanded(
          flex: 4,
            child: CustomButton(
              onPressed: (){
                if(provider.searchcontroller.text.isNotEmpty &&provider.searchcontroller.text!=""){
                  provider.setSearchText();
                }
                else
                  {
                    toastRedC("Please Enter Search Alphabet");
                  }
              },
              buttonText: AppText.search_btn,
            )
        )
      ],
    );
  }
}
