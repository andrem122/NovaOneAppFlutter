import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
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

    // Extract the month and year inetgers of the data into a list
    List<int> monthIntegers = chartMonthlyData
        .map((ChartMonthlyData chartData) => chartData.datetime.month)
        .toList();
    List<int> yearIntegers = chartMonthlyData
        .map((ChartMonthlyData chartData) => chartData.datetime.year)
        .toList();

    // Add zeros to the missing months of data if there is not 12 points of data
    if (chartMonthlyData.length < 12) {
      // Loop through the months of year as integers and see if each month
      // is included in the data. If not, create a data point for it of zero.
      for (int month = 1; month < 12; month++) {
        // If the month is NOT in the data set, add it
        if (!monthIntegers.contains(month)) {
          final now = DateTime.now();
          final monthDateTime = DateTime(now.year, month);
          final DateFormat formatter = DateFormat(
              'MMM'); // Gives a format of the three letter version of the month. Ex: Jul
          final monthString = formatter.format(monthDateTime);

          /// TODO: Figure out how to add in 12 months of data with a zero for a month/year if there is no data
          final chartData = ChartMonthlyData(
              month: monthString, year: now.year.toString(), count: 0);
          chartMonthlyData.add(chartData);
        }
      }
    }
    // Sort chart data
    chartMonthlyData.sort((a, b) => a.datetime.compareTo(b.datetime));
    chartMonthlyData.forEach((element) {
      print(
          'MONTH: ${element.month}, YEAR: ${element.year}, COUNT: ${element.count}');
    });
    return chartMonthlyData;
  }
}
