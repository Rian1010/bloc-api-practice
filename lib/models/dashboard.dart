import 'dart:convert';
import 'dart:io';

// import 'package:administration_app/dashboard/repositories/dashboard_repository.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard with ChangeNotifier {
  final String id;
  final int newUsersToday;
  final int newUsers;
  final double usersActivePerDay;

  Dashboard({
    required this.id,
    required this.newUsersToday,
    required this.newUsers,
    required this.usersActivePerDay,
  });

  // Dashboard.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       newUsersToday = json['sumToday'],
  //       newUsers = json['sumPeriod'],
  //       usersActivePerDay = json['activeUsers'];
}

class DashboardStats with ChangeNotifier {
  List<Dashboard> _stats = [
    Dashboard(
      id: "1",
      newUsersToday: 1,
      newUsers: 2,
      usersActivePerDay: 3,
    ),
  ];

  List<Dashboard> get stats {
    return [..._stats];
  }

  Future<List<Dashboard>> fetchStats(String from, String to) async {
    final rawUserData = Uri.parse(
        'https://test.ouslygroup.com/api/admin/stats/users/new/2021-11-01/2021-11-20');
    try {
      final response = await http.get(rawUserData, headers: {
        HttpHeaders.authorizationHeader: 'someToken',
      });
      print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
    // final extractedData = json.decode(response.body) as Map<String, dynamic>;

    // if (response.statusCode != 200) {
    //   throw Exception();
    // }

    // final List<Dashboard> loadedUserInfo = [];
    // print(extractedData);

    // extractedData.forEach((userId, userData) {
    //   loadedUserInfo.add(
    //     Dashboard(
    //       id: userId,
    //       newUsersToday: userData['sumToday'],
    //       newUsers: userData['sumPeriod'],
    //       usersActivePerDay: userData['activeUsers'],
    //     ),
    //   );
    // });
    // print('here: ${extractedData}');
    // _stats = loadedUserInfo;
    // notifyListeners();

    return _stats;
  }
}
