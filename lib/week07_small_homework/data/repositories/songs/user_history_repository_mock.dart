import 'package:challenges/week07_small_homework/data/repositories/songs/user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository {
  final List<String> _historyIds = [];

  @override
  List<String> fetchHistorySongIds() {
    return _historyIds;
  }

  @override
  void addSongId(String songId) {
    _historyIds.remove(songId); 
    _historyIds.insert(0, songId); 
  }
}