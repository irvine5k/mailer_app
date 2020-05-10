import 'package:flutter/material.dart';
import 'package:mailer_app/src/app_colors.dart';
import 'package:mailer_app/src/home/widgets/app_bar_widget.dart';
import 'package:mailer_app/src/home/widgets/body_widget.dart';
import 'package:mailer_app/src/home/widgets/bottom_app_bar_widget.dart';
import 'package:mailer_app/src/home/widgets/email_details_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool showFab = true;

  void _showDetails(Email email) {
    setState(() {
      showFab = false;
    });

    PersistentBottomSheetController<dynamic> controller;

    controller = scaffoldKey.currentState.showBottomSheet(
      (context) => EmailDetailsWidget(
        controller: controller,
        email: email,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
    );

    controller.closed.then((value) {
      setState(() {
        showFab = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: <Widget>[
            AppBarWidget(),
            BodyWidget(_showDetails),
            // BottomAppBarWidget(),
          ],
        ),
        floatingActionButton: showFab
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.white,
                child: Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                ),
              )
            : null,
        bottomNavigationBar: showFab ? BottomAppBarWidget() : null,
      );
}
