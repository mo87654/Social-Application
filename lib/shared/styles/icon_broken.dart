/*
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class IconBrokenData extends IconData {
  const IconBrokenData(int codePoint)
      : super(
    codePoint,
    fontFamily: 'IconBroken',
    fontPackage: 'icon_broken',
  );
}

/// ```
/// const IconData icon = Icon(IconBroken.IconName)
/// example
/// const IconData icon = Icon(IconBroken.User)
/// ```
class IconBroken {
  IconBroken._();

  static const IconData User = IconBrokenData(0xe900);
  static const IconData User1 = IconBrokenData(0xe901);
  static const IconData Activity = IconBrokenData(0xe902);
  static const IconData AddUser = IconBrokenData(0xe903);
  static const IconData Arrow___Down_2 = IconBrokenData(0xe904);
  static const IconData Arrow___Down_3 = IconBrokenData(0xe905);
  static const IconData Arrow___Down_Circle = IconBrokenData(0xe906);
  static const IconData Arrow___Down_Square = IconBrokenData(0xe907);
  static const IconData Arrow___Down = IconBrokenData(0xe908);
  static const IconData Arrow___Left_2 = IconBrokenData(0xe909);
  static const IconData Arrow___Left_3 = IconBrokenData(0xe90a);
  static const IconData Arrow___Left_Circle = IconBrokenData(0xe90b);
  static const IconData Arrow___Left_Square = IconBrokenData(0xe90c);
  static const IconData Arrow___Left = IconBrokenData(0xe90d);
  static const IconData Arrow___Right_2 = IconBrokenData(0xe90e);
  static const IconData Arrow___Right_3 = IconBrokenData(0xe90f);
  static const IconData Arrow___Right_Circle = IconBrokenData(0xe910);
  static const IconData Arrow___Right_Square = IconBrokenData(0xe911);
  static const IconData Arrow___Right = IconBrokenData(0xe912);
  static const IconData Arrow___Up_2 = IconBrokenData(0xe913);
  static const IconData Arrow___Up_3 = IconBrokenData(0xe914);
  static const IconData Arrow___Up_Circle = IconBrokenData(0xe915);
  static const IconData Arrow___Up_Square = IconBrokenData(0xe916);
  static const IconData Arrow___Up = IconBrokenData(0xe917);
  static const IconData Bag_2 = IconBrokenData(0xe918);
  static const IconData Bag = IconBrokenData(0xe919);
  static const IconData Bookmark = IconBrokenData(0xe91a);
  static const IconData Buy = IconBrokenData(0xe91b);
  static const IconData Calendar = IconBrokenData(0xe91c);
  static const IconData Call_Missed = IconBrokenData(0xe91d);
  static const IconData Call_Silent = IconBrokenData(0xe91e);
  static const IconData Call = IconBrokenData(0xe91f);
  static const IconData Calling = IconBrokenData(0xe920);
  static const IconData Camera = IconBrokenData(0xe921);
  static const IconData Category = IconBrokenData(0xe922);
  static const IconData Chart = IconBrokenData(0xe923);
  static const IconData Chat = IconBrokenData(0xe924);
  static const IconData Close_Square = IconBrokenData(0xe925);
  static const IconData Danger = IconBrokenData(0xe926);
  static const IconData Delete = IconBrokenData(0xe927);
  static const IconData Discount = IconBrokenData(0xe928);
  static const IconData Discovery = IconBrokenData(0xe929);
  static const IconData Document = IconBrokenData(0xe92a);
  static const IconData Download = IconBrokenData(0xe92b);
  static const IconData Edit_Square = IconBrokenData(0xe92c);
  static const IconData Edit = IconBrokenData(0xe92d);
  static const IconData Filter_2 = IconBrokenData(0xe92e);
  static const IconData Filter = IconBrokenData(0xe92f);
  static const IconData Folder = IconBrokenData(0xe930);
  static const IconData Game = IconBrokenData(0xe931);
  static const IconData Graph = IconBrokenData(0xe932);
  static const IconData Heart = IconBrokenData(0xe933);
  static const IconData Hide = IconBrokenData(0xe934);
  static const IconData Home = IconBrokenData(0xe935);
  static const IconData Image_2 = IconBrokenData(0xe936);
  static const IconData Image = IconBrokenData(0xe937);
  static const IconData Info_Circle = IconBrokenData(0xe938);
  static const IconData Info_Square = IconBrokenData(0xe939);
  static const IconData Location = IconBrokenData(0xe93a);
  static const IconData Lock = IconBrokenData(0xe93b);
  static const IconData Login = IconBrokenData(0xe93c);
  static const IconData Logout = IconBrokenData(0xe93d);
  static const IconData Message = IconBrokenData(0xe93e);
  static const IconData More_Circle = IconBrokenData(0xe93f);
  static const IconData More_Square = IconBrokenData(0xe940);
  static const IconData Notification = IconBrokenData(0xe941);
  static const IconData Paper_Download = IconBrokenData(0xe942);
  static const IconData Paper_Fail = IconBrokenData(0xe943);
  static const IconData Paper_Negative = IconBrokenData(0xe944);
  static const IconData Paper_Plus = IconBrokenData(0xe945);
  static const IconData Paper_Upload = IconBrokenData(0xe946);
  static const IconData Paper = IconBrokenData(0xe947);
  static const IconData Password = IconBrokenData(0xe948);
  static const IconData Play = IconBrokenData(0xe949);
  static const IconData Plus = IconBrokenData(0xe94a);
  static const IconData Profile = IconBrokenData(0xe94b);
  static const IconData Scan = IconBrokenData(0xe94c);
  static const IconData Search = IconBrokenData(0xe94d);
  static const IconData Send = IconBrokenData(0xe94e);
  static const IconData Setting = IconBrokenData(0xe94f);
  static const IconData Shield_Done = IconBrokenData(0xe950);
  static const IconData Shield_Fail = IconBrokenData(0xe951);
  static const IconData Show = IconBrokenData(0xe952);
  static const IconData Star = IconBrokenData(0xe953);
  static const IconData Swap = IconBrokenData(0xe954);
  static const IconData Tick_Square = IconBrokenData(0xe955);
  static const IconData Ticket_Star = IconBrokenData(0xe956);
  static const IconData Ticket = IconBrokenData(0xe957);
  static const IconData Time_Circle = IconBrokenData(0xe958);
  static const IconData Time_Square = IconBrokenData(0xe959);
  static const IconData Unlock = IconBrokenData(0xe95a);
  static const IconData Upload = IconBrokenData(0xe95b);
  static const IconData Video = IconBrokenData(0xe95c);
  static const IconData Voice_2 = IconBrokenData(0xe95d);
  static const IconData Voice = IconBrokenData(0xe95e);
  static const IconData Volume_Down = IconBrokenData(0xe95f);
  static const IconData Volume_Off = IconBrokenData(0xe960);
  static const IconData Volume_Up = IconBrokenData(0xe961);
  static const IconData Wallet = IconBrokenData(0xe962);
  static const IconData Work = IconBrokenData(0xe963);
}
*/
import 'package:flutter/widgets.dart';

class IconBroken{
  IconBroken._();
  static const String _fontFamily = 'IconBroken';

  static const IconData User = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData User1 = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData Activity = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData AddUser = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData Arrow___Down_2 = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData Arrow___Down_3 = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData Arrow___Down_Circle = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData Arrow___Down_Square = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData Arrow___Down = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData Arrow___Left_2 = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData Arrow___Left_3 = IconData(0xe90a, fontFamily: _fontFamily);
  static const IconData Arrow___Left_Circle = IconData(0xe90b, fontFamily: _fontFamily);
  static const IconData Arrow___Left_Square = IconData(0xe90c, fontFamily: _fontFamily);
  static const IconData Arrow___Left = IconData(0xe90d, fontFamily: _fontFamily);
  static const IconData Arrow___Right_2 = IconData(0xe90e, fontFamily: _fontFamily);
  static const IconData Arrow___Right_3 = IconData(0xe90f, fontFamily: _fontFamily);
  static const IconData Arrow___Right_Circle = IconData(0xe910, fontFamily: _fontFamily);
  static const IconData Arrow___Right_Square = IconData(0xe911, fontFamily: _fontFamily);
  static const IconData Arrow___Right = IconData(0xe912, fontFamily: _fontFamily);
  static const IconData Arrow___Up_2 = IconData(0xe913, fontFamily: _fontFamily);
  static const IconData Arrow___Up_3 = IconData(0xe914, fontFamily: _fontFamily);
  static const IconData Arrow___Up_Circle = IconData(0xe915, fontFamily: _fontFamily);
  static const IconData Arrow___Up_Square = IconData(0xe916, fontFamily: _fontFamily);
  static const IconData Arrow___Up = IconData(0xe917, fontFamily: _fontFamily);
  static const IconData Bag_2 = IconData(0xe918, fontFamily: _fontFamily);
  static const IconData Bag = IconData(0xe919, fontFamily: _fontFamily);
  static const IconData Bookmark = IconData(0xe91a, fontFamily: _fontFamily);
  static const IconData Buy = IconData(0xe91b, fontFamily: _fontFamily);
  static const IconData Calendar = IconData(0xe91c, fontFamily: _fontFamily);
  static const IconData Call_Missed = IconData(0xe91d, fontFamily: _fontFamily);
  static const IconData Call_Silent = IconData(0xe91e, fontFamily: _fontFamily);
  static const IconData Call = IconData(0xe91f, fontFamily: _fontFamily);
  static const IconData Calling = IconData(0xe920, fontFamily: _fontFamily);
  static const IconData Camera = IconData(0xe921, fontFamily: _fontFamily);
  static const IconData Category = IconData(0xe922, fontFamily: _fontFamily);
  static const IconData Chart = IconData(0xe923, fontFamily: _fontFamily);
  static const IconData Chat = IconData(0xe924, fontFamily: _fontFamily);
  static const IconData Close_Square = IconData(0xe925, fontFamily: _fontFamily);
  static const IconData Danger = IconData(0xe926, fontFamily: _fontFamily);
  static const IconData Delete = IconData(0xe927, fontFamily: _fontFamily);
  static const IconData Discount = IconData(0xe928, fontFamily: _fontFamily);
  static const IconData Discovery = IconData(0xe929, fontFamily: _fontFamily);
  static const IconData Document = IconData(0xe92a, fontFamily: _fontFamily);
  static const IconData Download = IconData(0xe92b, fontFamily: _fontFamily);
  static const IconData Edit_Square = IconData(0xe92c, fontFamily: _fontFamily);
  static const IconData Edit = IconData(0xe92d, fontFamily: _fontFamily);
  static const IconData Filter_2 = IconData(0xe92e, fontFamily: _fontFamily);
  static const IconData Filter = IconData(0xe92f, fontFamily: _fontFamily);
  static const IconData Folder = IconData(0xe930, fontFamily: _fontFamily);
  static const IconData Game = IconData(0xe931, fontFamily: _fontFamily);
  static const IconData Graph = IconData(0xe932, fontFamily: _fontFamily);
  static const IconData Heart = IconData(0xe933, fontFamily: _fontFamily);
  static const IconData Hide = IconData(0xe934, fontFamily: _fontFamily);
  static const IconData Home = IconData(0xe935, fontFamily: _fontFamily);
  static const IconData Image_2 = IconData(0xe936, fontFamily: _fontFamily);
  static const IconData Image = IconData(0xe937, fontFamily: _fontFamily);
  static const IconData Info_Circle = IconData(0xe938, fontFamily: _fontFamily);
  static const IconData Info_Square = IconData(0xe939, fontFamily: _fontFamily);
  static const IconData Location = IconData(0xe93a, fontFamily: _fontFamily);
  static const IconData Lock = IconData(0xe93b, fontFamily: _fontFamily);
  static const IconData Login = IconData(0xe93c, fontFamily: _fontFamily);
  static const IconData Logout = IconData(0xe93d, fontFamily: _fontFamily);
  static const IconData Message = IconData(0xe93e, fontFamily: _fontFamily);
  static const IconData More_Circle = IconData(0xe93f, fontFamily: _fontFamily);
  static const IconData More_Square = IconData(0xe940, fontFamily: _fontFamily);
  static const IconData Notification = IconData(0xe941, fontFamily: _fontFamily);
  static const IconData Paper_Download = IconData(0xe942, fontFamily: _fontFamily);
  static const IconData Paper_Fail = IconData(0xe943, fontFamily: _fontFamily);
  static const IconData Paper_Negative = IconData(0xe944, fontFamily: _fontFamily);
  static const IconData Paper_Plus = IconData(0xe945, fontFamily: _fontFamily);
  static const IconData Paper_Upload = IconData(0xe946, fontFamily: _fontFamily);
  static const IconData Paper = IconData(0xe947, fontFamily: _fontFamily);
  static const IconData Password = IconData(0xe948, fontFamily: _fontFamily);
  static const IconData Play = IconData(0xe949, fontFamily: _fontFamily);
  static const IconData Plus = IconData(0xe94a, fontFamily: _fontFamily);
  static const IconData Profile = IconData(0xe94b, fontFamily: _fontFamily);
  static const IconData Scan = IconData(0xe94c, fontFamily: _fontFamily);
  static const IconData Search = IconData(0xe94d, fontFamily: _fontFamily);
  static const IconData Send = IconData(0xe94e, fontFamily: _fontFamily);
  static const IconData Setting = IconData(0xe94f, fontFamily: _fontFamily);
  static const IconData Shield_Done = IconData(0xe950, fontFamily: _fontFamily);
  static const IconData Shield_Fail = IconData(0xe951, fontFamily: _fontFamily);
  static const IconData Show = IconData(0xe952, fontFamily: _fontFamily);
  static const IconData Star = IconData(0xe953, fontFamily: _fontFamily);
  static const IconData Swap = IconData(0xe954, fontFamily: _fontFamily);
  static const IconData Tick_Square = IconData(0xe955, fontFamily: _fontFamily);
  static const IconData Ticket_Star = IconData(0xe956, fontFamily: _fontFamily);
  static const IconData Ticket = IconData(0xe957, fontFamily: _fontFamily);
  static const IconData Time_Circle = IconData(0xe958, fontFamily: _fontFamily);
  static const IconData Time_Square = IconData(0xe959, fontFamily: _fontFamily);
  static const IconData Unlock = IconData(0xe95a, fontFamily: _fontFamily);
  static const IconData Upload = IconData(0xe95b, fontFamily: _fontFamily);
  static const IconData Video = IconData(0xe95c, fontFamily: _fontFamily);
  static const IconData Voice_2 = IconData(0xe95d, fontFamily: _fontFamily);
  static const IconData Voice = IconData(0xe95e, fontFamily: _fontFamily);
  static const IconData Volume_Down = IconData(0xe95f, fontFamily: _fontFamily);
  static const IconData Volume_Off = IconData(0xe960, fontFamily: _fontFamily);
  static const IconData Volume_Up = IconData(0xe961, fontFamily: _fontFamily);
  static const IconData Wallet = IconData(0xe962, fontFamily: _fontFamily);
  static const IconData Work = IconData(0xe963, fontFamily: _fontFamily);
}