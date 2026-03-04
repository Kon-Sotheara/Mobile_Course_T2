import 'package:challenges/week07_small_homework/ui/screens/home/view_model/home_view_model.dart';
import 'package:challenges/week07_small_homework/ui/screens/library/widgets/library_content.dart';
import 'package:challenges/week07_small_homework/ui/states/settings_state.dart';
import 'package:challenges/week07_small_homework/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final settings = context.read<AppSettingsState>();
    return Container(
      color: settings.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Recently Played", style: AppTextStyles.label.copyWith(
                color: AppColors.neutral
              )),
            ),
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: vm.historySong.length,
              itemBuilder: (context, index) {
                final historySong = vm.historySong[index];
                return SongTile(
                  song: historySong,
                  isPlaying: vm.isPlaying(historySong),
                  onTap: () {
                    vm.play(historySong);
                  },
                  onStop: vm.stop,
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("RecommendSong Played", style: AppTextStyles.label.copyWith(
                color: AppColors.neutral
              )),
            ),
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.builder(
              itemCount: vm.recommendedSong.length,
              itemBuilder: (context, index) {
                final recommendedSong = vm.recommendedSong[index];
                return SongTile(
                  song: recommendedSong,
                  isPlaying: vm.isPlaying(recommendedSong),
                  onTap: () {
                    vm.play(recommendedSong);
                  },
                  onStop: vm.stop,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
