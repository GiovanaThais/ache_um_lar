// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppState {
  final bool isDarkMode;

  AppState({required this.isDarkMode});

  factory AppState.empty() => AppState(isDarkMode: false);

  AppState copyWith({
    bool? isDarkMode,
  }) {
    return AppState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
