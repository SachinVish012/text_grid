import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GridViewProvider with ChangeNotifier{

  TextEditingController _textcontroller = TextEditingController();
  TextEditingController get textcontroller=>_textcontroller;
  TextEditingController _searchcontroller = TextEditingController();
  TextEditingController get searchcontroller=>_searchcontroller;
  //----for row column
  TextEditingController _rowController=TextEditingController();
  TextEditingController get rowController=>_rowController;
  TextEditingController _columnController=TextEditingController();
  TextEditingController get columnController=>_columnController;

  int _row=3;
  int get row=>_row;
  int _column=3;
  int get column=>_column;


  List<String> alphabets = [];
  String searchText = '';

  //----for add alphabet to create grid
  void addAlphabet(String alphabet) {
    if (alphabet.isNotEmpty) {
      alphabets.add(alphabet);
      _textcontroller.clear();
      _searchcontroller.clear();
      notifyListeners();
    }
  }

  //------reset
  void clearAlphabets() {
    alphabets.clear();
    _textcontroller.clear();
    _searchcontroller.clear();
    searchText='';
    _row=3;
    _column=3;
    notifyListeners();
  }

  //-----search text
  void setSearchText() {
    searchText = searchcontroller.text;
    notifyListeners();
  }

  //----for add row and column
  void changeRowColumn(row,column){
    if(row!="0"&&column!="0"){
      _row=int.parse(row);
      _column=int.parse(column);
      notifyListeners();
    }
  }
}