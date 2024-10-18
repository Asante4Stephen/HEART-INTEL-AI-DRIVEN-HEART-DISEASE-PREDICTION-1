import 'package:flutter/material.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/light_color.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/text_styles.dart';
import 'package:insta_med_ui/widgets/resource.dart';
import 'package:insta_med_ui/widgets/theme.dart';
 // Adjust import based on your project structure

Widget _categoryCard(String title, String subtitle,
    {required Color color, required lightColor, required BuildContext context}) {
  TextStyle titleStyle = TextStyles.title.copyWith(color: ColorResources.white);
  TextStyle subtitleStyle =
      TextStyles.body.copyWith(color: ColorResources.white);

  if (AppTheme.fullWidth(context) < 392) {
    titleStyle = TextStyles.body.copyWith(color: ColorResources.white);
    subtitleStyle = TextStyles.bodySm.copyWith(color: ColorResources.white);
  }

  return AspectRatio(
    aspectRatio: 6 / 8,
    child: Container(
      height: 280,
      width: AppTheme.fullWidth(context) * .3,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: lightColor.withOpacity(.8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -20,
                left: -20,
                child: CircleAvatar(
                  backgroundColor: lightColor,
                  radius: 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: Text(title, style: titleStyle).hP8,
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      subtitle,
                      style: subtitleStyle,
                    ).hP8,
                  ),
                ],
              ).p16,
            ],
          ),
        ),
      ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(20))),
    ),
  );
}
