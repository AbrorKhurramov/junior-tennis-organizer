import 'package:hive/hive.dart';
import 'package:junior_tennis_organizer/core/constants/constants.dart';

import '../../domain/data_source/local_data_source.dart';

class LocalDataSourceImpl with LocalDataSource {
  @override
  Future<void> hasUser(bool value) async {
    final box = Hive.box(Constants.credentialsBox);
    await box.put(Constants.hasUser, value);
  }
}
