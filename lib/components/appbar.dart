import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pating_ai/consts/strings.dart';
import 'package:share_plus/share_plus.dart';

class PatingoAppBar extends StatelessWidget implements PreferredSizeWidget {

  final TextTheme textTheme;

  const PatingoAppBar({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        AppStrings.brandNameFa,
        style: textTheme.labelLarge,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            onPressed: () async {
              await SharePlus.instance.share(
                ShareParams(
                  title: AppStrings.shareApplicationTitle,
                  text: AppStrings.shareApplicationText,
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.share_solid,
              color: Colors.white
            )
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}