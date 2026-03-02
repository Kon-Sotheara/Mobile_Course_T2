import 'package:challenges/week06_repo_small_homework/data/repositories/settings/app_settings_repository.dart';
import 'package:challenges/week06_repo_small_homework/model/settings/app_settings.dart';

class AppSettingRepositoryMock extends AppSettingsRepository {
  @override
  Future<AppSettings> load() async {
    return AppSettings(themeColor: ThemeColor.pink);
  }

  @override
  Future<void> save(AppSettings settings) {
    throw UnimplementedError();
  }
}
