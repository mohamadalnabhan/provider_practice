import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderOfContext extends StatefulWidget {
  const ProviderOfContext({super.key});

  @override
  State<ProviderOfContext> createState() => _ProviderOfContextState();
}

class _ProviderOfContextState extends State<ProviderOfContext> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model2(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text("Provider of Context"),
          backgroundColor: Colors.deepPurple,
        ),
        body:  Center(child: customWid()),
      ),
    );
  }
}

class customWid extends StatelessWidget {
  const customWid({super.key});

  @override
  Widget build(BuildContext context) {
    var model2 = Provider.of<Model2>(context);

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            model2.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          MaterialButton(
            color: Colors.deepPurple,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              model2.ChangeName();
            },
            child: const Text("Do Something"),
          ),
        ],
      ),
    );
  }
}

class Model2 extends ChangeNotifier {
  String name = "momo";

  ChangeName() {
    name = "mo";
    notifyListeners(); 
  }
}
