import 'package:care453/core/utils/map_styles/map_styles.dart';
import 'package:flutter/foundation.dart';


class MapStyleProvider with ChangeNotifier {
  String _currentMapStyle = MapStyle.navigationDayView;

  String get currentMapStyle => _currentMapStyle;

  void setMapStyle(String newStyle) {
    _currentMapStyle = newStyle;
    notifyListeners();
  }
}
