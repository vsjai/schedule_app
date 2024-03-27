import 'dart:math';

import 'package:stacked/stacked.dart';

class ActivityViewModel extends BaseViewModel {
  double _mindPercent = 0;
  double _bodyPercent = 0;
  double _moneyPercent = 0;
  double _tribePercent = 0;
  double _worldPercent = 0;
  double get mindPercent => _mindPercent;
  double get bodyPercent => _bodyPercent;
  double get moneyPercent => _moneyPercent;
  double get tribePercent => _tribePercent;
  double get worldPercent => _worldPercent;

  generateRandomNumbers() {
    Random random = Random();
    _mindPercent = random.nextInt(100) + 1;
    _bodyPercent = random.nextInt(100) + 1;
    _moneyPercent = random.nextInt(100) + 1;
    _tribePercent = random.nextInt(100) + 1;
    _worldPercent = random.nextInt(100) + 1;
  }

  refreshData() {
    rebuildUi();
  }
}
