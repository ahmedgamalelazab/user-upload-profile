//the size config of the application 

import 'package:flutter/material.dart';

class DeviceSizeConfigUtils{

  static double getDeviceHeightWithoutNotificationBar(BuildContext context){
      return MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  }

  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }


}