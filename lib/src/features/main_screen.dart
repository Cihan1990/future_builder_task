import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _zipController = TextEditingController();
  String _cityResult = 'Noch keine PLZ gesucht';

  Future<String> _getCityFromZip(String zip) async {
    // Simuliere Dauer der Datenbank-Anfrage
    await Future.delayed(const Duration(seconds: 1));

    switch (zip) {
      case "10115":
        return 'Berlin';
      case "20095":
        return 'Hamburg';
      case "80331":
        return 'München';
      case "50667":
        return 'Köln';
      case "60311":
      case "60313":
        return 'Frankfurt am Main';
      default:
        return 'Unbekannte Stadt';
    }
  }

  @override
  void dispose() {
    _zipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),
              TextField(
                controller: _zipController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Postleitzahl",
                ),
              ),
              const SizedBox(height: 32),
              OutlinedButton(
                onPressed: () {
                  final zip = _zipController.text;
                  _getCityFromZip(zip).then((city) {
                    setState(() {
                      _cityResult = 'Ergebnis: $city';
                    });
                  });
                },
                child: const Text("Suche"),
              ),
              const SizedBox(height: 32),
              Text(
                _cityResult,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
