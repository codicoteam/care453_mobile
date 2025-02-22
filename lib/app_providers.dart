import 'package:care453/providers/location_provider.dart';
import 'package:provider/provider.dart';

import 'providers/mapStyleProvider.dart';
import 'providers/user_provider_class.dart';

List<ChangeNotifierProvider> appProviders = [
  ChangeNotifierProvider(create: (_) => UserProvider()),
  ChangeNotifierProvider(create: (_) => LocationProvider()),
  ChangeNotifierProvider(create: (_) => MapStyleProvider()),
];
