import 'package:csv/csv.dart';

class CsvData {
  List<List<dynamic>> data = [];

  Future<void> loadCsv(String csvString) async {
    data = const CsvToListConverter().convert(csvString);
  }

  String getOutput(String sheepBreed, String disease) {
    for (var row in data) {
      if (row.length >= 4 && row[1] == sheepBreed && row[2] == disease) {
        return row[3].toString();
      }
    }
    return 'No matching data found';
  }
}
