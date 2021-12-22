import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/dashboard.dart';

class ShowUserData extends StatelessWidget {
  final String from;
  final String to;
  final String id;
  final int newUsersToday;
  final int newUsers;
  final double usersActivePerDay;

  ShowUserData(
    this.from,
    this.to,
    this.id,
    this.newUsersToday,
    this.newUsers,
    this.usersActivePerDay,
  );
  @override
  Widget build(BuildContext context) {
    // Future refreshStats(BuildContext context) async {
    //   await Provider.of<DashboardStats>(context, listen: false)
    //       .fetchStats("2021-12-01", "2021-12-17");
    // }

    final stats = Provider.of<DashboardStats>(context);

    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "New Users Today",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        newUsersToday.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 5,
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "New Users",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        newUsers.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 5,
          ),
          Card(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Users Active Per Day",
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        usersActivePerDay.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 5,
          ),
        ],
      ),
    );

    // return Card(
    //   child: Text('here: ${stats.stats}'),
    // );

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
