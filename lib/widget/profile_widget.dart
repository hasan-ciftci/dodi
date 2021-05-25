import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatefulWidget {
  final String name;
  final IconData icon;
  final Size size;
  final bool isEditing;
  final String image;

  ProfileWidget({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.size,
    this.isEditing = false,
    this.image,
  }) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
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
                      borderRadius: BorderRadius.circular(32.0.r)),
                ),
                height: widget.size.width / 4,
                width: widget.size.width / 4,
                child: widget.image == null
                    ? buildProfileIcon()
                    : Image.asset(widget.image,fit: BoxFit.contain,),
              ),
              SizedBox(
                height: 4,
              ),
              Text(widget.name,
             style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).disabledColor),)
            ],
          ),
        ),
        Visibility(
            visible: widget.isEditing,
            child: Positioned(
                child: Image.asset(ImageConstants.instance.penVector))),
      ],
    );
  }

  LayoutBuilder buildProfileIcon() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Icon(
          widget.icon,
          color: Colors.white,
          size: constraints.maxHeight - 16,
        );
      },
    );
  }
}
