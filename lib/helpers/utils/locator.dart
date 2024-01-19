import 'package:kel7/repositories/user_repository.dart';
import 'package:kel7/helpers/utils/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

/// Setup service locator.
void setupLocator() {
  locator.registerSingleton(NavigationService());
  locator.registerSingleton(UserRepository());
}
