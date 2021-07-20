import 'dart:math';
import 'dart:ui';

class SizeUtil {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;
  static late double rpx;
  static late double px;
  static SizeUtil? _instance;

  SizeUtil._();

  static SizeUtil getInstance() {
    if (_instance == null) {
      _instance = SizeUtil._();
    }
    return _instance!;
  }

  static void initialize({standardSize = 750}) {
    if (_instance == null) {
      _instance = SizeUtil._();
    }
//    1. 手机的物理分辨率
    physicalWidth = window.physicalSize.width; // 拿到物理的宽度
    physicalHeight = window.physicalSize.height;

//    2. 求出dpr
    dpr = window.devicePixelRatio;

//    3. 求出逻辑的宽高
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

//    4. 状态栏高度
    statusHeight = window.padding.top / dpr;
    var width;
    width = min(screenWidth, screenHeight);
//    5. 计算rpx
    rpx = width / standardSize;
    px = width / standardSize * 2;
  }

  static double setRpx(double size) {
    return size * rpx;
  }

  static double setPx(double size) {
    return size * px;
  }
}

extension IntFit on int {
  double get px {
    return SizeUtil.setPx(this.toDouble());
  }

  double get rpx {
    return SizeUtil.setRpx(this.toDouble());
  }
}

extension DoubleFit on double {
  double get px {
    return SizeUtil.setPx(this);
  }

  double get rpx {
    return SizeUtil.setRpx(this);
  }
}
