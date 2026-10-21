import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

/// Fetches a table from the PHP API and prints its rows to the console.
Future<void> main() async {
  // Read the table name from the user
  stdout.write('Select Tabelle: ');
  final userInput = stdin.readLineSync();
  final url = Uri.parse(
    'http://localhost/online_shop/api.php?tabelle=$userInput',
  );

  final response = await http.get(url);

  print('Status: ${response.statusCode}');

  // On error (e.g. 400 = unknown table) show the API's message
  if (response.statusCode != 200) {
    print(response.body);
    return;
  }

  // JSON text -> list of maps (column name -> value)
  final List<dynamic> daten = jsonDecode(response.body);

  for (final zeile in daten) {
    final map = zeile as Map<String, dynamic>;
    print(map.values.join(' | '));
  }

  print('${daten.length} Datensätze');
}
