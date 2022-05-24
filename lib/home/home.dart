import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:poetry/home/appbar.dart';
import 'package:poetry/home/body.dart';

import 'utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late StreamSubscription subscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    subscription =
        Connectivity().onConnectivityChanged.listen(showConnentivitySnackBar);
  }

  @override
  void dispose() {
    subscription.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  void showConnentivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final massage = hasInternet
        ? 'You have again ${result.toString()}'
        : 'you have no Internet';

    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnakBar(context, massage, color);
  }
}
