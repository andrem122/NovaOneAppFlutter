class ChartMonthlyData implements Comparable {
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

  @override
  int compareTo(other) {
    if (this.month.codeUnitAt(0) > other.month.codeUnitAt(0)) {
      return 1;
    } else {
      return -1;
    }
  }
}
