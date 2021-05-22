import 'dart:convert';
import 'package:http/http.dart';
import 'package:novaone/api/api.dart';
import 'package:novaone/auth/auth.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/novaOneUrl.dart';

class ChartDataApiClient extends BaseApiClient {
  ChartDataApiClient({required Client client, required UserStore userStore})
      : super(client: client, userStore: userStore);

  /// Gets the user object from the API by sending a [email] and [password]
  /// to the NovOne Api
  ///
  /// Returns an [ApiMessageException] object if the request fails
  /// and a [User] object if the request was successful
  Future<List<ChartMonthlyData>> getMonthyChartData() async {
    // Need to get password seperatley because it is encrypted when
    // sent as data from the API
    final String password = await userStore.getPassword();
    final User user = await userStore.getUser();

    Map<String, String> parameters = {
      'email': user.email,
      'password': password,
      'customerUserId': '${user.id}',
    };

    final response = await postToNovaOneApi(
        uri: NovaOneUrl.novaOneApiChartMonthlyData,
        parameters: parameters,
        errorMessage: 'Could not fetch chart monthly data');

    final List<dynamic> jsonList = jsonDecode(response.body);
    List<ChartMonthlyData> chartMonthlyData = jsonList
        .map((chartData) => ChartMonthlyData.fromJson(json: chartData))
        .toList();

    // Add zeros to the missing months of data if there is not 12 points of data
    chartMonthlyData.sort();
    if (chartMonthlyData.length < 12) {
      chartMonthlyData.forEach((ChartMonthlyData chartData) {
        print(
            'Month: ${chartData.month}, Year: ${chartData.year} Count: ${chartData.count}');
      });
    }

    return chartMonthlyData;
  }
}
