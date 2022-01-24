import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:makemywindoor/services/user_service.dart';
import 'package:makemywindoor/utils/size_config.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar: const NetworkImage(
                    'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                coverImage: const NetworkImage(
                    'https://images.pexels.com/photos/447592/pexels-photo-447592.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                title: context.read<UserServices>().currentUser!.name,
                subtitle: "user",
                // actions: <Widget>[
                //   MaterialButton(
                //     color: Colors.white,
                //     shape: const CircleBorder(),
                //     elevation: 0,
                //     child: const Icon(LineIcons.edit),
                //     onPressed: () {},
                //   )
                // ],
              ),
              const SizedBox(height: 10.0),
              const UserInfo(),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "User Information",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          ListTile(
                            leading: const Icon(LineIcons.user),
                            title: const Text("Name"),
                            subtitle: Text(
                                context.read<UserServices>().currentUser!.name),
                          ),
                          ListTile(
                            leading: const Icon(LineIcons.building),
                            title: const Text("Company Name"),
                            subtitle: Text(context
                                .read<UserServices>()
                                .currentUser!
                                .company!),
                          ),
                          // const ListTile(
                          //   leading: Icon(LineIcons.passport),
                          //   title: Text("Bank Details"),
                          //   subtitle: Text("9999876xxxxxxx"),
                          // ),
                          ListTile(
                            leading: const Icon(LineIcons.phone),
                            title: const Text("Phone"),
                            subtitle: Text(context
                                .read<UserServices>()
                                .currentUser!
                                .phone),
                          ),
                          ListTile(
                            leading: const Icon(LineIcons.mailBulk),
                            title: const Text("Email"),
                            subtitle: Text(context
                                .read<UserServices>()
                                .currentUser!
                                .email),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String? subtitle;
  final List<Widget>? actions;

  const ProfileHeader(
      {Key? key,
      required this.coverImage,
      required this.avatar,
      required this.title,
      this.subtitle,
      this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: SizeConfig.blockSizeVertical * 40,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: coverImage as ImageProvider<Object>, fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: SizeConfig.blockSizeVertical * 40,
          decoration: const BoxDecoration(
            color: Colors.white10,
          ),
        ),
        if (actions != null)
          Container(
            width: double.infinity,
            height: SizeConfig.blockSizeVertical * 40,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: actions!,
            ),
          ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: SizeConfig.screenWidth <= 360
                  ? SizeConfig.blockSizeVertical * 33
                  : SizeConfig.blockSizeVertical * 34),
          child: Column(
            children: <Widget>[
              Avatar(
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                // style: T,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 5.0),
                Text(
                  subtitle!,
                  // style: Theme.of(context).textTheme.subtitle,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar(
      {Key? key,
      required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: radius - borderWidth,
          backgroundImage: image as ImageProvider<Object>?,
        ),
      ),
    );
  }
}
