/// Urls and headers used throughout the app
class NovaOneUrl {
  static const novaOneAuthority = 'www.novaonesoftware.com';
  static const novaOneForgotPasswordEmailPath = '/accounts/password_reset';
  static Uri get novaOneWebsiteUrl => Uri.https(novaOneApiAuthority, '');
  static Uri get novaOneWebsiteForgotUrl =>
      Uri.https(novaOneApiAuthority, novaOneForgotPasswordEmailPath);

  static const novaOneApiAuthority = 'graystonerealtyfl.com';
  static const novaOneApiBasePath = '/NovaOne';
  static const novaOneApiPathLogin = novaOneApiBasePath + '/login.php';
  static const novaOneApiPathChartMonthlyData =
      novaOneApiBasePath + '/chartDataMonthly.php';

  static Uri get novaOneApiUrl =>
      Uri.https(novaOneApiAuthority, novaOneApiBasePath);
  static Uri get novaOneApiUrlLogin =>
      Uri.https(novaOneApiAuthority, novaOneApiPathLogin);
  static Uri get novaOneApiChartMonthlyData =>
      Uri.https(novaOneApiAuthority, novaOneApiPathChartMonthlyData);
}
