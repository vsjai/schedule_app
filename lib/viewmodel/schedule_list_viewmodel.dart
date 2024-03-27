import 'package:schedule_app/app/app.locator.dart';
import 'package:schedule_app/app/models.dart';
import 'package:schedule_app/service/api_service.dart';
import 'package:stacked/stacked.dart';

class ScheduleListViewModel extends FutureViewModel<List<ScheduleModel>?> {
  final _apiService = locator<ApiService>();
  @override
  Future<List<ScheduleModel>?> futureToRun() => _apiService.getScheduleList();

  refreshData() async {
    await initialise();
  }
}
