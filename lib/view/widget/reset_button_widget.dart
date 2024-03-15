import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_grid/res/text_localization/text_localization.dart';

import '../../provider/gridview_provider.dart';
import '../../res/components/custome_button.dart';

class ResetButtonWidget extends StatelessWidget {
  const ResetButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        buttonText: AppText.reset_btn,
        onPressed: () {
          Provider.of<GridViewProvider>(context, listen: false)
              .clearAlphabets();
        }
    );
  }
}
