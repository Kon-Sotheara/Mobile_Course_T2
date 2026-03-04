
abstract class UserHistoryRepository {
  List<String> fetchHistorySongIds();
  void addSongId(String songId);
}