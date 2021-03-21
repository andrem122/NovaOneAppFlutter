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

  static Uri get novaOneApiUrl =>
      Uri.https(novaOneApiAuthority, novaOneApiBasePath);
  static Uri get novaOneApiUrlLogin =>
      Uri.https(novaOneApiAuthority, novaOneApiPathLogin);

  static Map<String, String> apiHeaders = {
    'Referer': NovaOneUrl.novaOneWebsiteUrl.toString(),
    'Content-Type': 'application/x-www-form-urlencoded',
  };
}
