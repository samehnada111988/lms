import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/app_const.dart';

class AppBoxes {
  static Box mainBox = Hive.box(AppConst.mainBoxName);
}
