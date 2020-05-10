import 'package:flutter/material.dart';
import 'package:mailer_app/src/app_colors.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  int _currentIndex = 0;
  void changeTab(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secundaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.15,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            0,
            changeTab,
            currentIndex: _currentIndex,
          ),
          buildButton(
            1,
            changeTab,
            currentIndex: _currentIndex,
            icon: Icons.people,
          ),
          buildButton(
            2,
            changeTab,
            currentIndex: _currentIndex,
            icon: Icons.mail,
          ),
        ],
      ),
    );
  }

  IconButton buildButton(
    int index,
    void Function(int) onPressed, {
    int currentIndex = 0,
    IconData icon = Icons.star,
  }) {
    final active = index == currentIndex;

    return IconButton(
      onPressed: () => onPressed(index),
      icon: Icon(
        icon,
        size: 30,
        color: active ? AppColors.activeColor : AppColors.opaqueColor,
      ),
    );
  }
}
