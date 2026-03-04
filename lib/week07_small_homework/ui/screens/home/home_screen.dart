import 'package:challenges/week07_small_homework/data/repositories/songs/song_repository.dart';
import 'package:challenges/week07_small_homework/data/repositories/songs/user_history_repository.dart';
import 'package:challenges/week07_small_homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:challenges/week07_small_homework/ui/screens/home/widgets/home_content.dart';
import 'package:challenges/week07_small_homework/ui/states/player_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (context) {
        final repo = context.read<SongRepository>();
        final player = context.read<PlayerState>();
        final historyRepo = context.read<UserHistoryRepository>();
        final vm = HomeViewModel(
          songRepository: repo,
          playerState: player,
          userHistoryRepository: historyRepo
        );
        return vm;
      },
      child: HomeContent(),
    );
  }
}
