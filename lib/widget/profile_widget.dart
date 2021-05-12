import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Size size;
  const ProfileWidget({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Theme.of(context).backgroundColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
          ),
          height: size.width / 4,
          width: size.width / 4,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Icon(
                icon,
                color: Colors.white,
                size: constraints.maxHeight - 16,
              );
            },
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(name,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.grey))
      ],
    );
  }
}
