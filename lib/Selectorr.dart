import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selectorr extends StatefulWidget {
  const Selectorr({super.key});

  @override
  State<Selectorr> createState() => _SelectorrState();
}

class _SelectorrState extends State<Selectorr> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Selector Example"),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Selector<ProveOne, String>(
                  selector: (context, prv1) => prv1.showone,
                  builder: (context, proveone, child) {
                    print("Selector 1 rebuilt");
                    return Text(
                      proveone,
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Selector<ProveOne, String>(
                  selector: (context, prv1) => prv1.showtwo,
                  builder: (context, proveone, child) {
                    print("Selector 2 rebuilt");
                    return Text(
                      proveone,
                      style: TextStyle(fontSize: 20),
                    );
                  },
                ),
                const SizedBox(height: 30),
                Consumer<ProveOne>(
                  builder: (context, proveone, child) {
                    return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent
                          ),
                      onPressed: () {
                        proveone.doSomthing1();
                      },
                      child: const Text("Update sm1"),
                    );
                  },
                ),
                const SizedBox(height: 10),
                Consumer<ProveOne>(
                  builder: (context, proveone, child) {
                    return ElevatedButton(
                       style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent
                          ),
                      onPressed: () {
                        proveone.doSomthing2();
                      },
                      child: const Text("Update sm2"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProveOne extends ChangeNotifier {
  String sm1 = "sm1";
  String sm2 = "sm2";

  String get showone => sm1;
  String get showtwo => sm2;

  void doSomthing1() {
    sm1 = "Updated sm1";
    notifyListeners();
  }

  void doSomthing2() {
    sm2 = "Updated sm2";
    notifyListeners();
  }
}
