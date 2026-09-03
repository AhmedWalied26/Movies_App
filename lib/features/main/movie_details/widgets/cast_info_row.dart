// import 'package:flutter/material.dart';
// import 'package:movies_app/utils/app_styles.dart';

// class CastInfoRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const CastInfoRow({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Text.rich(
//       TextSpan(
//         children: [
//           TextSpan(text: '$label: ', style: AppStyles.bold20White),
//           WidgetSpan(
//             alignment: PlaceholderAlignment.middle,
//             child: Directionality(
//               textDirection: TextDirection.ltr,
//               child: Text(value, style: AppStyles.regular20White),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles.dart';

class CastInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const CastInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: ', style: AppStyles.bold20White),
        Expanded(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: AppStyles.regular20White,
            ),
          ),
        ),
      ],
    );
  }
}
