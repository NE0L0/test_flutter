import 'package:test_app/core/data/data_sources/remote/sessions/sessions_data_source.dart';
import 'package:test_app/main.dart';

void initDataSourcesDI() {
  getIt.registerSingleton(SessionsDataSourceMocked());
}
