enum Routes {
  numberTranslator(name: 'number_translator', routePath: '/number_translator'),
  configurations(name: 'configurations', routePath: '/configurations'),
  gamePage(name: 'game', routePath: '/game'),
  authPage(name: 'auth', routePath: '/auth');

  final String routePath;
  final String name;
  const Routes({required this.routePath, required this.name});
}