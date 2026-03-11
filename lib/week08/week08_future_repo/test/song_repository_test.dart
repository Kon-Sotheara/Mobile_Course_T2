import 'package:challenges/week08/week08_future_repo/data/repositories/songs/song_repository_mock.dart';
import 'package:challenges/week08/week08_future_repo/model/songs/song.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  SongRepositoryMock songRepositoryMock = SongRepositoryMock();

  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // - Using async/await with try/catch.

  // songRepositoryMock
  //     .fetchSongById("s22")
  //     .then((value) {
  //       print("fetched song ${value?.title}");
  //     })
  //     .catchError((error) {
  //       print("this song id is not found, $error");
  //     });

  try {
    Song? value = await songRepositoryMock.fetchSongById("s11");
    print("fetched song ${value?.title}");
  } catch (error) {
    print("this song id is not found, $error");
  }
}
