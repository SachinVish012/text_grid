import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_grid/res/text_localization/text_localization.dart';
import 'package:test_grid/res/toast/flutter_toast.dart';

import '../../provider/gridview_provider.dart';
import '../../res/components/custom_textfield.dart';
import '../../res/components/custome_button.dart';

class RowColumnWidget extends StatelessWidget {
  RowColumnWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GridViewProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Consumer<GridViewProvider>(
              builder: (context, value, child) {
                return CustomTextField(
                    controller: value.rowController,
                    keyboardType: TextInputType.number,
                    labelText: AppText.row_text,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    onChanged: (value1) {}
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Consumer<GridViewProvider>(
              builder: (context, value, child) {
                return CustomTextField(
                    controller: value.columnController,
                    keyboardType: TextInputType.number,
                    labelText: AppText.column_text,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    onChanged: (value1) {}
                );
              },
            ),
          ),
          Expanded(
              flex: 4,
              child: CustomButton(
                onPressed: () {
                  if (provider.rowController.text.isNotEmpty&&provider.columnController.text.isNotEmpty && provider.rowController.text!="0"&&provider.columnController.text!="0") {
                   provider.changeRowColumn(provider.rowController.text, provider.columnController.text);
                  }
                  else{
                    toastRedC("Please Enter Valid Row/Column");
                  }
                },
                buttonText: AppText.set_btn,
              )
          )
        ],
      ),
    );
  }
}
