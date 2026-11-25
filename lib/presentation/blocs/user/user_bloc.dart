import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

// Events
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class LoadOrders extends UserEvent {}

class AddOrder extends UserEvent {
  final Map<String, dynamic> order;

  const AddOrder(this.order);

  @override
  List<Object?> get props => [order];
}

// States
class UserState extends Equatable {
  final List<Map<String, dynamic>> orders;
  final bool isLoading;

  const UserState({this.orders = const [], this.isLoading = false});

  UserState copyWith({List<Map<String, dynamic>>? orders, bool? isLoading}) {
    return UserState(
      orders: orders ?? this.orders,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [orders, isLoading];
}

// Bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  final SharedPreferences preferences;

  UserBloc({required this.preferences}) : super(const UserState()) {
    on<LoadOrders>(_onLoadOrders);
    on<AddOrder>(_onAddOrder);
    add(LoadOrders());
  }

  Future<void> _onLoadOrders(LoadOrders event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final ordersJson = preferences.getString('orders');
      if (ordersJson != null) {
        final List<dynamic> ordersList = jsonDecode(ordersJson);
        final typedOrders =
            ordersList
                .map((order) => Map<String, dynamic>.from(order))
                .toList();
        emit(state.copyWith(orders: typedOrders, isLoading: false));
      } else {
        emit(state.copyWith(orders: [], isLoading: false));
      }
    } catch (e) {
      // Handle parsing errors gracefully
      emit(state.copyWith(orders: [], isLoading: false));
    }
  }

  Future<void> _onAddOrder(AddOrder event, Emitter<UserState> emit) async {
    final newOrders = [...state.orders, event.order];
    await preferences.setString('orders', jsonEncode(newOrders));
    emit(state.copyWith(orders: newOrders));
  }
}
