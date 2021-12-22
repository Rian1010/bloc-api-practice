import 'package:bloc_api_prac/models/dashboard.dart';
import 'package:bloc_api_prac/widgets/show_user_data.dart';
import 'package:bloc_api_prac/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

enum FilterDataByPeriod { thisMonth, lastMonth, currentYear }

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _isInit = true;
  var _from = '2021-12-15';
  var _to = '2021-12-15';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Check if it's being run for the first time
    if (_isInit) {
      Provider.of<DashboardStats>(context).fetchStats(_from, _to);
    }

    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final List<Dashboard> loadedStats = [
    //   Dashboard(
    //     id: "1",
    //     newUsersToday: 4,
    //     newUsers: 5,
    //     usersActivePerDay: 6,
    //   ),
    // ];
    // final dashboardBloc = BlocProvider.of<DashboardBloc>(context);
    final statsData = Provider.of<DashboardStats>(context);
    final stats = statsData.stats;

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
      body: ShowUserData(
        _from,
        _to,
        stats[0].id,
        stats[0].newUsersToday,
        stats[0].newUsers,
        stats[0].usersActivePerDay,
      ),
      // body: GridView.builder(
      //   padding: const EdgeInsets.all(16),
      //   itemCount: loadedStats.length,
      //   itemBuilder: (ctx, i) => ShowUserData(
      //       _from,
      //       _to,
      //       loadedStats[i].id,
      //       loadedStats[i].newUsersToday,
      //       loadedStats[i].newUsers,
      //       loadedStats[i].usersActivePerDay),
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      // child: Container(
      //   child: ShowUserData(_from, _to),
      //   color: Theme.of(context).primaryColor,
      // ),
    );
  }
}
