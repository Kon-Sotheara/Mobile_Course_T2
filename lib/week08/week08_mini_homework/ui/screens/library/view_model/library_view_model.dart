import 'package:challenges/week08/week08_mini_homework/utils/async_value_state.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  List<Song>? _songs;
  AsyncValue<List<Song>> songsValue = AsyncValue.loading();

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  List<Song> get songs => _songs == null ? [] : _songs!;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  // void _init() async {
  //   // 1 - Fetch songs
  //   _songs = await songRepository.fetchSongs();

  //   // 2 - notify listeners
  //   notifyListeners();
  // }

  void _init() async {
    // 1 - Loading state
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2 - fetch song sucessful
      _songs = await songRepository.fetchSongs();
      songsValue = AsyncValue.sucess(_songs);
      notifyListeners();
    } catch (e) {
      // 3 - fetch song unsucessful
      songsValue = AsyncValue.error(e);
      notifyListeners();
    }
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
