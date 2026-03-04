import 'package:challenges/week07_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenges/week07_small_homework/data/repositories/songs/user_history_repository.dart';
import 'package:challenges/week07_small_homework/model/songs/song.dart';
import 'package:challenges/week07_small_homework/ui/states/player_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository _songRepository;
  final UserHistoryRepository _userHistoryRepository;
  final PlayerState _playerState;

  final List<String> _historyIds = [];
  final List<Song> _songs = [];

  HomeViewModel({
    required songRepository,
    required playerState,
    required userHistoryRepository,
  }) : _songRepository = songRepository,
       _playerState = playerState,
       _userHistoryRepository = userHistoryRepository {
    _playerState.addListener(_onPlayerChanged);
    init();
  }

  Future<void> init() async {
    _songs.clear();
    _songs.addAll(_songRepository.fetchSongs());

    _historyIds.clear();
    _historyIds.addAll(_userHistoryRepository.fetchHistorySongIds());
    notifyListeners();
  }

  void _onPlayerChanged() {
    notifyListeners();
  }

  List<Song> get historySong {
    return _historyIds
        .map((id) => _songRepository.fetchSongById(id))
        .whereType<Song>()
        .toList();
  }

  List<Song> get recommendedSong {
    final listen = _historyIds.toSet();
    return _songs.where((s) => !listen.contains(s.id)).toList();
  }

  Song? get currentSong => _playerState.currentSong;
  bool isPlaying(Song song) => _playerState.currentSong == song;

  void play(Song song) {
    _playerState.start(song);

    _userHistoryRepository.addSongId(song.id);

    _historyIds.clear();
    _historyIds.addAll(_userHistoryRepository.fetchHistorySongIds());

    notifyListeners();
  }

  void stop() {
    _playerState.stop();
  }

  @override
  void dispose() {
    _playerState.removeListener(_onPlayerChanged);
    super.dispose();
  }
}
