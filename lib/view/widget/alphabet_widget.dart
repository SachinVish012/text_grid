import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_grid/res/text_localization/text_localization.dart';

import '../../provider/gridview_provider.dart';
import '../../res/components/custom_textfield.dart';

class EnterAlphabetWidget extends StatelessWidget {
  const EnterAlphabetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GridViewProvider>(builder: (context, value, child) {
      return CustomTextField(
          labelText: AppText.enter_alphabet,
          controller: value.textcontroller,
          margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 15),
          inputFormatter: FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
          onChanged:(value1) {
            if(value1.isNotEmpty)
              {
                value.addAlphabet(value1);
              }
          }
      );
    },);

  }
}
