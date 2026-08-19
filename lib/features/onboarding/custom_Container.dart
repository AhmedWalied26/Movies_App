import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles.dart';
import 'package:movies_app/utils/size_utils.dart';

class CustomContainer extends StatelessWidget {
  final String Img ;
  final String text1 ;
  final String? text2;
  final String nameButton1;
  final String? nameButton2;
  final VoidCallback OnPressedButton1 ;
  final VoidCallback? OnPressedButton2 ;
  const CustomContainer({super.key , required this.Img ,
    required this.text1 , this.text2,
  required this.OnPressedButton1 , this.OnPressedButton2,
  required this.nameButton1 , this.nameButton2});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(Img,
            fit: BoxFit.cover,),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: context.width*0.07,
                right: context.width*0.07,
                top: height*0.04,
                bottom: height*0.02),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(41),
                  topRight: Radius.circular(41)),
            ),
            child: Column(
              spacing: height*0.025,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(text1,
                  textAlign: TextAlign.center,
                  style: AppStyles.bold24White,),
                if (text2 != null)
                Text(text2!,
                  textAlign: TextAlign.center,
                  style: AppStyles.regular20White,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                  ),
                  onPressed: OnPressedButton1, child: Text(nameButton1,
                style: AppStyles.semi20Black,),),
                if (nameButton2 != null)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blackColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
                          side: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          )
                      ),
                      onPressed: OnPressedButton2, child: Text(nameButton2!,
                    style: AppStyles.semi20Primary,)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
