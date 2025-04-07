import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviderPage extends StatelessWidget {
  const MultiProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const MultiProviderContent(),
    );
  }
}

class MultiProviderContent extends StatelessWidget {
  const MultiProviderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterModel>();
    final themeModel = context.watch<ThemeModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("MultiProvider Example"),
        backgroundColor: themeModel.isDark ? Colors.grey[900] : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Count: ${counter.count}", style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text("Increment"),
            ),
            const SizedBox(height: 30),
            SwitchListTile(
              title: const Text("Dark Mode"),
              value: themeModel.isDark,
              onChanged: (_) => themeModel.toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}

// Counter model
class CounterModel extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

// Theme model
class ThemeModel extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
