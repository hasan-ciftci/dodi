import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Size size;
  bool isEditing;

  ProfileWidget(
      {Key key,
      @required this.name,
      @required this.icon,
      @required this.size,
      this.isEditing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
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
          ),
        ),
        Visibility(
            visible: isEditing,
            child: Positioned(
                child: Image.asset(ImageConstants.instance.penVector))),
      ],
    );
  }
}
