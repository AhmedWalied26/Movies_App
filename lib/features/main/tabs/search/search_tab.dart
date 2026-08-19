import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/size_utils.dart';
import 'package:movies_app/widgets/custom_text_field.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.035),
        child: Column(
          children: [
            CustomTextField(
              title: AppLocalizations.of(context)!.search,
              prefix: Padding(
                padding: EdgeInsetsDirectional.only(start: width * 0.025),
                child: SvgPicture.asset(AppAssets.searchIcon),
              ),
            ),
            Expanded(
              child: Center(child: Image.asset(AppAssets.emptyListImage)),
            ),
          ],
        ),
      ),
    );
  }
}
