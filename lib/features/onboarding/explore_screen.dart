import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_routes.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.onBoardingImage1,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: width*0.08 ,horizontal: height*0.03 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.find_Your_Next,
                style: AppStyles.medium36White,),
                Text(AppLocalizations.of(context)!.favorite_Movie_Here,
                style: AppStyles.medium36White,),
                SizedBox(height: height*0.02,),
                Text(AppLocalizations.of(context)!.get_access_to_a_huge,
                style: AppStyles.regular20White,),
                SizedBox(height: height*0.03,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    )
                  ),
                    onPressed: (){
                    Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
                    setState(() {

                    });
                    }, child: Text(AppLocalizations.of(context)!.explore_Now,
                style: AppStyles.semi20Black,))
              ],
            ),
          )

        ],
      ),
    );
  }
}
