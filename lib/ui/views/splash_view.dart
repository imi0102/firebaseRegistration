import 'package:compound/ui/widgets/busy_button.dart';
import 'package:compound/viewmodels/home_view_model.dart';
import 'package:compound/viewmodels/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import '../shared/ui_helpers.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key, this.homeViewModel}) : super(key: key);
  final HomeViewModel? homeViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.login(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                width: 120.0,
                height: 120.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/logo.png"),
                    )),
              ),
              verticalSpaceSmall,
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Welcome to Firebase Application",
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
