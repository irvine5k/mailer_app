import 'package:flutter/material.dart';
import 'package:mailer_app/src/app_colors.dart';
import 'package:mailer_app/src/home/widgets/body_widget.dart';

class EmailDetailsWidget extends StatelessWidget {
  const EmailDetailsWidget({
    Key key,
    @required this.controller,
    @required this.email,
  }) : super(key: key);

  final PersistentBottomSheetController controller;
  final Email email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildHeaderButtons(),
                  buildTitle(),
                  buildUserHeader(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildMessage(),
                  const Spacer(),
                  buildTextField(context),
                ],
              ),
            ),
          ),
          buildTopDetail(),
        ],
      ),
    );
  }

  Align buildTopDetail() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 35,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.opaqueColor,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Container buildTextField(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.secundaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.only(right: 10),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: TextStyle(
                  color: Color(0xff7491C7),
                ),
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xff7491C7),
            radius: 18,
            child: Icon(
              Icons.send,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Padding buildMessage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        email.message,
        style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Padding buildUserHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  email.userImageUrl,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                email.userName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                'To You',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
          Spacer(),
          Text(
            '1m ago',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        email.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Row buildHeaderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {
            controller.close();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.opaqueColor,
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.archive,
                color: AppColors.opaqueColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.restore_from_trash,
                color: AppColors.opaqueColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
