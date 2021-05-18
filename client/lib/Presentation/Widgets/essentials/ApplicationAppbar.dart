import 'package:flutter/material.dart';

import '../../../config/size.dart';
import '../fontsWidgets/fontWidgets.dart';

PreferredSize applicationAppbar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(
        DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(context) *
            0.080),
    child: AppBar(
      centerTitle: true,
      title: ApplicationBarsFonts(
        barTitle: title,
        fontSize: DeviceSizeConfigUtils.getDeviceHeightWithoutNotificationBar(
                context) *
            0.045,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
