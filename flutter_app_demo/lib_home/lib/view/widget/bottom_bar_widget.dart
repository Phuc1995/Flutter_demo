
import 'package:flutter/material.dart';

class WidgetBottomBar{

  BottomNavigationBarItem BottomNavigationBar({Icon icon, String title, String key}){
      return BottomNavigationBarItem(
        icon: icon,
        title: Text(title, key: Key(key),),
      );
  }
}