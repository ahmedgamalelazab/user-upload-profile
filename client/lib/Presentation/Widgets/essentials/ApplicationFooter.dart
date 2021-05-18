import 'package:flutter/material.dart';

import '../../../config/size.dart';
import '../fontsWidgets/fontWidgets.dart';

Widget applicationFooter(BuildContext context, String footerTitle) {
  return Container(
    alignment: Alignment.center,
    width: DeviceSizeConfigUtils.getDeviceWidth(context),
    height:
        DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(context) *
            0.080,
    color: Theme.of(context).primaryColor,
    child: ApplicationBarsFonts(
      barTitle: footerTitle,
      fontWeight: FontWeight.w200,
      fontSize:
          DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(context) *
              0.025,
    ),
  );
}
