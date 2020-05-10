import 'package:flutter/material.dart';
import 'package:mailer_app/src/app_colors.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget(
    this.callback, {
    Key key,
  }) : super(key: key);

  final void Function(Email) callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.backgroundColor,
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) => buildEmailWidget(
            Email(
              userName: 'Kendra Blau',
              title: 'Re: Design feedback',
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque maximus, libero ac tempor interdum, purus augue sagittis lorem, quis convallis diam est et sem. Curabitur ultrices nibh quis urna tincidunt, et rhoncus purus elementum. Proin vitae tempus risus. Nulla blandit eget ligula id eleifend. Proin eu risus felis. Quisque vel facilisis lectus.',
              userImageUrl:
                  'https://www.hypeness.com.br/wp-content/uploads/2017/07/Nyakim3.jpg',
              readed: true,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildEmailWidget(Email email) {
    return GestureDetector(
      onTap: () => callback(email),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          email.readed ? Colors.red : Colors.transparent,
                    ),
                  ),
                  const SizedBox(width: 15),
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
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          email.userName,
                          style: TextStyle(
                            color: AppColors.activeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          email.title,
                          style: TextStyle(
                            color: AppColors.activeColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          email.message,
                          style: TextStyle(
                            color: AppColors.opaqueColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Text(
                'Just now',
                style: TextStyle(
                  color: AppColors.opaqueColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Email {
  final String userImageUrl;
  final String userName;
  final String title;
  final String message;
  final bool readed;

  Email({
    @required this.userImageUrl,
    @required this.userName,
    @required this.title,
    @required this.message,
    @required this.readed,
  });
}
