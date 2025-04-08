import 'package:login_app/providers/models.dart';
import 'package:login_app/providers/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final List<Users>? users;
  final String? error;

  UserState({this.error, this.users});
}

class UserNotifier extends StateNotifier<UserState> {
  final ApiService _apiService;

  UserNotifier(this._apiService) : super(UserState());
  Future<void> getUsers() async {
    try {
      final users = await _apiService.fetchApiResponse();
      state = UserState(users: users);
    } catch (e) {
      state = UserState(error: e.toString());
    }
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ApiService());
});
