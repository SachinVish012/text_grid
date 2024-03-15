import 'package:flutter/material.dart';
import 'package:test_grid/view/widget/alphabet_widget.dart';
import 'package:test_grid/view/widget/grid_view_widget.dart';
import 'package:test_grid/view/widget/reset_button_widget.dart';
import 'package:test_grid/view/widget/row_colmun_text_widget.dart';
import 'package:test_grid/view/widget/search_textWidget.dart';

class GridViewScreen extends StatefulWidget {
  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            //for row colmun widget
            RowColumnWidget(),
            //----for Enter Alphabet TextField
            EnterAlphabetWidget(),

            //------for Grid View
            GridViewWidget(),
            //for Search Text Field
            SearchTextFieldWidget(),
            const SizedBox(
              height: 10,
            ),
            //----for Reset Button
            ResetButtonWidget(),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
