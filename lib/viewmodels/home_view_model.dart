import 'package:compound/constants/route_names.dart';
import 'package:compound/localDatabase/shared_preferences.dart';
import 'package:compound/models/employee_model.dart';
import 'package:compound/services/apiServices.dart';
import 'package:compound/services/navigation_service.dart';
import 'package:flutter/cupertino.dart';

import '../locator.dart';
import 'base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SharedPreferencesData _preferencesData = SharedPreferencesData();
  List<EmployeeModel> employeeListData = [];
  var scrollController = ScrollController();
  int page = 1;
  bool isShowLoading = false;

  Future closeApp() async {
    _navigationService.navigateToCloseApp();
  }

  Future getEmployeeData(int page) async {
    setLoading(true);
    employeeListData = await ApiServices.getPosts(page);
    setLoading(false);
    print(employeeListData.length);
    notifyListeners();
  }

  void pagination() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (employeeListData.length < employeeListData.length)) {
      page++;
      getEmployeeData(page);
    }
  }

  void setLoading(bool isLoading) {
    isShowLoading = isLoading;
  }

  void logOut() async {
    await _preferencesData.clearPref();
    _navigationService.navigateToAndClearBackStack(LoginViewRoute);
  }
}
