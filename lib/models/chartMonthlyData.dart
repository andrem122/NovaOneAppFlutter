class ChartMonthlyData {
  final String month;
  final String year;
  final int count;

  const ChartMonthlyData(
      {required this.month, required this.year, required this.count});

  factory ChartMonthlyData.fromJson({required Map<String, dynamic> json}) {
    return ChartMonthlyData(
      month: json['month'],
      year: json['year'],
      count: json['count'],
    );
  }
}
