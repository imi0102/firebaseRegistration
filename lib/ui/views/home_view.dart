import 'package:compound/ui/widgets/busy_button.dart';
import 'package:compound/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, this.homeViewModel}) : super(key: key);
  final HomeViewModel? homeViewModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getEmployeeData(1),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[800],
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  model.closeApp();
                }),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout),
                tooltip: "Save Todo and Retrun to List",
                onPressed: () {
                  model.logOut();
                },
              )
            ],
          ),
          body: !model.isShowLoading
              ? ListView.builder(
                  controller: model.scrollController,
                  shrinkWrap: true,
                  itemCount: model.employeeListData.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("Segment : $index"));
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
