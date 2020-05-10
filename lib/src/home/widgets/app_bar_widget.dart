import 'package:flutter/material.dart';
import 'package:mailer_app/src/app_colors.dart';
import 'package:mailer_app/src/assets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: AppColors.secundaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Inbox',
                  style: TextStyle(
                    color: AppColors.activeColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: AppColors.opaqueColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildCircleButtons(Assets.gmail),
                    buildCircleButtons(Assets.outlook, notificationsCount: 4),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.backgroundColor,
                      backgroundImage: AssetImage('assets/icon.png'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildCircleButtons(String iconAsset, {int notificationsCount = 0}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.opaqueColor,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.network(iconAsset),
                ),
              ),
            ),
          ),
          if (notificationsCount > 0)
            Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Text('$notificationsCount'),
              ),
            ),
        ],
      ),
    );
  }
}
