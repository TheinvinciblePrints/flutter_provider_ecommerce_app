import 'package:ecommerceapp/core/services/api.dart';
import 'package:ecommerceapp/core/services/authentication_service.dart';
import 'package:ecommerceapp/core/services/connectivity_service.dart';
import 'package:ecommerceapp/core/services/form_controller.dart';
import 'package:ecommerceapp/core/services/local_storage.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
  ChangeNotifierProvider(create: (_) => FormController()),
  Provider(
    create: (_) => NavigationService(),
  ),
  Provider(
    create: (_) => Api(),
  ),
  Provider(
    create: (_) => LocalStorage(),
  ),
//  Provider(
//    create: (_) => FormController(),
//  ),
  Provider(
    create: (_) => ConnectivityService(),
  ),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<Api, AuthenticationService>(
    update: (context, api, authenticationService) =>
        AuthenticationService(api: api),
  ),
  ProxyProvider<LocalStorage, LocalStorageService>(
    update: (context, storage, storageService) =>
        LocalStorageService(storage: storage),
  ),

//  ProxyProvider3<AuthenticationService, StorageService, NavigationService,
//      AuthViewModel>(
//    update: (context, authenticationService, storageService, navigationService,
//            loginViewModel) =>
//        AuthViewModel(
//            authenticationService: authenticationService,
//            storageService: storageService,
//            navigationService: navigationService),
//  ),
];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<ConnectivityStatus>(
    create: (context) =>
        Provider.of<ConnectivityService>(context, listen: false).connection,
    lazy: false,
  ),
];
