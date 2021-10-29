import 'package:stacked/stacked.dart';

class DrawerAnimationService extends BaseViewModel {
  double _xOffset = 0.0;
  double _yOffset = 0.0;
  double _scale = 1.0;

  void openDrawer() {
    _xOffset = 250.0;
    _yOffset = 150.0;
    _scale = 0.65;
    notifyListeners();
  }

  void closeDrawer() {
    _xOffset = 0.0;
    _yOffset = 0.0;
    _scale = 1.0;
    notifyListeners();
  }

  bool isDrawerOpen() {
    return _yOffset != 0 && _xOffset != 0;
  }

  double get scale => _scale;

  double get yOffset => _yOffset;

  double get xOffset => _xOffset;
}
