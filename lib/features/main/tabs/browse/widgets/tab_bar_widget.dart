import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/size_utils.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final tabs = [
      loc.action,
      loc.horror,
      loc.comedy,
      loc.drama,
      loc.sci_fi,
      loc.fantasy,
      loc.romance,
      loc.crime,
      loc.adventure,
    ];

    final movieImages = [
      AppAssets.blackWidowMovie,
      AppAssets.jokerMovie,
      AppAssets.ironManMovie,
      AppAssets.civilWarMovie,
      AppAssets.avengersMovie,
      AppAssets.doctorStrangeMovie,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelColor: AppColors.blackColor,
                unselectedLabelColor: AppColors.primaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: tabs.map((label) {
                  return Tab(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: SizeConfig.width(context) * 0.005,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(label),
                    ),
                  );
                }).toList(),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: movieImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image(
                            image: AssetImage(movieImages[index]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
