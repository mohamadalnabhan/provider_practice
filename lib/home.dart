import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(title: Text(" Selector ")),
        body: ListView(
          children: <Widget>[
            Selector<ProveOne, String>(
              selector: (context, prv1) => prv1.showone,

              builder: (context, proveone, child) {
                print("co sm 1");
                return Text("${proveone}");
              },
            ),
              Selector<ProveOne, String>(
              selector: (context, prv1) => prv1.showtwo,
              builder: (context, proveone, child) {
                print("co sm 2");
                return Text("${proveone}");
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  onPressed: () {
                    proveone.doSomthing1();
                  },
                  child: Text("btn 1"),
                );
              },
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                return MaterialButton(
                  onPressed: () {
                    proveone.doSomthing2();
                  },
                  child: Text("btn 2"),
                );
              },
          )
          ],
        ),
      ),
    );
  }
}

class ProveOne extends ChangeNotifier {
  String sm1 = "sm1";
  String sm2 = "sm2";
  get showone => sm1;
  get showtwo => sm2;
  doSomthing1() {
    sm1 = "hellllo sm 1";
    notifyListeners();
  }

  doSomthing2() {
    sm2 = "hellllo sm 2";
    notifyListeners();
  }
}
