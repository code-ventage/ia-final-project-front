enum Routes{
  numberTranslator( name: 'number_translator', routePath: '/number_translator' ),
  configurations( name: 'configurations', routePath: '/configurations' );

  final String routePath;
  final String name;
  const Routes({required this.routePath, required this.name});


}