import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_karo_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences preferences;

  AuthBloc({required this.preferences}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<AuthCheckRequested>(_onAuthCheckRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock authentication - in real app, this would be an API call
      await Future.delayed(const Duration(seconds: 2));

      // Save user data
      final user = UserModel(phoneNumber: event.phoneNumber);
      await preferences.setString('user', user.toJson().toString());

      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError('Login failed: $e'));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Mock registration - in real app, this would be an API call
      await Future.delayed(const Duration(seconds: 2));

      // Save user data
      final user = UserModel(phoneNumber: event.phoneNumber, name: event.name);
      await preferences.setString('user', user.toJson().toString());

      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError('Registration failed: $e'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      // Clear user data
      await preferences.remove('user');
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError('Logout failed: $e'));
    }
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final userData = preferences.getString('user');
      if (userData != null) {
        // Parse user data and emit authenticated state
        final user = UserModel.fromJson(
          Map<String, dynamic>.from(userData as Map),
        );
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }
}
