import 'package:bloc_api_prac/models/dashboard.dart';
import 'package:bloc_api_prac/screens/show_user_data.dart';
import 'package:bloc_api_prac/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

enum FilterDataByPeriod { thisMonth, lastMonth, currentYear }

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    Provider.of<DashboardStats>(context);
    var _from = '2021-12-15';
    var _to = '2021-12-15';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterDataByPeriod selectedValue) {
              setState(() {
                if (selectedValue == FilterDataByPeriod.thisMonth) {
                  _from = "2021-12-01";
                  _to = "2021-12-15";
                } else if (selectedValue == FilterDataByPeriod.lastMonth) {
                  _from = "2021-11-01";
                  _to = "2021-11-30";
                } else {
                  _from = "2021-01-01";
                  _to = "2021-12-15";
                }
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('This Month'),
                value: FilterDataByPeriod.thisMonth,
              ),
              const PopupMenuItem(
                child: Text('Last Month'),
                value: FilterDataByPeriod.lastMonth,
              ),
              const PopupMenuItem(
                child: Text('Current Year'),
                value: FilterDataByPeriod.currentYear,
              ),
            ],
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Container(
          child: ShowUserData(_from, _to),
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
