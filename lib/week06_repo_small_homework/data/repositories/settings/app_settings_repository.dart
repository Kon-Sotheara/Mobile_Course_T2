import 'package:challenges/week06_repo_small_homework/model/settings/app_settings.dart';

abstract class AppSettingsRepository {
  Future<AppSettings> load();

  Future<void> save(AppSettings appSetting);
}
