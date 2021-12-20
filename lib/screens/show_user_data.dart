import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/dashboard.dart';

class ShowUserData extends StatefulWidget {
  final String from;
  final String to;

  ShowUserData(
    this.from,
    this.to,
  );

  @override
  _ShowUserDataState createState() => _ShowUserDataState();
}

class _ShowUserDataState extends State<ShowUserData> {
  @override
  Widget build(BuildContext context) {
    Future refreshStats(BuildContext context) async {
      await Provider.of<DashboardStats>(context, listen: false)
          .fetchStats("2021-12-01", "2021-12-17");
    }

    final stats = Provider.of<DashboardStats>(context);

    return Card(
      child: Text('here: ${stats.stats}'),
    );

    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     childAspectRatio: 3 / 2,
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //   ),
    //   itemBuilder: (ctx, i) => ChangeNotifierProvider<Dashboard>.value(
    //     value: stats.stats[i],
    //   ),
    //   itemCount: stats.stats.length,
    // );
  }
}
