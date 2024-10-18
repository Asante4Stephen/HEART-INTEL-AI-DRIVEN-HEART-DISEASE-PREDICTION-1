import 'package:flutter/material.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/light_color.dart';
import 'package:insta_med_ui/widgets/lib/src/theme/text_styles.dart';
import 'package:insta_med_ui/widgets/resource.dart';


Widget _searchField(BuildContext context) {
  return Container(
    height: 55,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: ColorResources.white,
      borderRadius: const BorderRadius.all(Radius.circular(13)),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: ColorResources.grey.withOpacity(.3),
          blurRadius: 15,
          offset: const Offset(5, 5),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: InputBorder.none,
        hintText: "Search",
        hintStyle: TextStyles.body.copyWith(color: ColorResources.subTitleTextColor),
        suffixIcon: SizedBox(
          width: 50,
          child: const Icon(Icons.search, color: ColorResources.purple)
            .alignCenter
            .ripple(() {}, borderRadius: BorderRadius.circular(13)),
        ),
      ),
    ),
  );
}
