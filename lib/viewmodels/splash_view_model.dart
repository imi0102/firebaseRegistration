import 'package:compound/constants/route_names.dart';
import 'package:compound/localDatabase/shared_preferences.dart';
import 'package:compound/services/authentication_service.dart';
import 'package:compound/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class SplashViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final SharedPreferencesData _preferencesData = SharedPreferencesData();

  Future login() async {
    var email;
    email = await _preferencesData.getPrefData('email');
    var password;
    password = await _preferencesData.getPrefData('pass');
    print("email: $email Pass: $password");
    if(email != null && password != null) {
      var result = await _authenticationService.loginWithEmail(
        email: email,
        password: password,
      );

      if (result is bool) {
        if (result) {
          _navigationService.navigateToReplacement(HomeViewRoute);
        } else {
          _navigationService.navigateToReplacement(LoginViewRoute);
        }
      } else {
        _navigationService.navigateToReplacement(LoginViewRoute);
      }
    }else{
      Future.delayed(Duration(seconds: 2), () {
        _navigationService.navigateToReplacement(LoginViewRoute);
      });
    }
  }
}
