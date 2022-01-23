import 'package:covid19_with_bloc/model/covid19_model.dart';
import 'package:http/http.dart' as http;

class Covid19Network {
  final String url = 'https://disease.sh/v3/covid-19/countries';

  Future<List<Covid19>> getCovid19() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = covid19FromJson(response.body);
      //debugPrint('${result.length}');
      return result;
    } else {
      throw Exception('Failed To Load..😔');
    }
  }
}
