import 'package:challenges/week07_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenges/week07_small_homework/model/songs/song.dart';
import 'package:challenges/week07_small_homework/ui/states/player_state.dart';
import 'package:flutter/material.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final PlayerState _playerState;

  List<Song> _songs = [];

  LibraryViewModel({required songRepository, required playerState})
    : _songRepository = songRepository,
      _playerState = playerState {
    _playerState.addListener(_onPlayerChanged);
    init();
  }

  void _onPlayerChanged() {
    notifyListeners();
  }

  Future<void> init() async {
    _songs = _songRepository.fetchSongs();
    notifyListeners();
  }

  List<Song> get songs => _songs;
  Song? get currentSong => _playerState.currentSong;
  bool isPlaying(Song song) => _playerState.currentSong == song;

  void play(Song song) {
    _playerState.start(song);
  }

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerChanged);
    super.dispose();
  }
}
