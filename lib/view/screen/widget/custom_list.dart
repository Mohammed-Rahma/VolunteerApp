import 'package:flutter/material.dart';


class CustomListTileCard extends StatelessWidget {
  const CustomListTileCard({
    required this.LeaddingIcon,
    required this.Title,
    required this.subTitle,
    required this.Trailingicon,
    this.marginBottom = 0 ,
    required this.onActionPressed,
    Key? key,
  }) : super(key: key);

  final IconData LeaddingIcon;
  final String Title ;
  final String subTitle;
  final double marginBottom;
  final IconData Trailingicon;
  final void Function() onActionPressed ;



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 20,right: 20 , bottom: marginBottom),

      child: ListTile(
        // contentPadding: EdgeInsets.zero,
        // horizontalTitleGap: 0,
        // onTap: (){},
        leading: Icon(LeaddingIcon),
        title: Text(Title),
        subtitle: Text(subTitle),
        trailing: IconButton(
          onPressed: onActionPressed,
          icon: Icon(Trailingicon),
        ),
      ),

    );
  }
}