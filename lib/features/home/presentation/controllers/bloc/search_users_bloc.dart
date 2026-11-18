import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la8iny/features/home/data/repositories/home_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../auth/data/models/user_model.dart';
import '../../../../chat/data/models/chat_room.dart';

part 'search_users_event.dart';
part 'search_users_state.dart';

class SearchUsersBloc extends Bloc<SearchUsersEvent, SearchUsersState> {
  SearchUsersBloc({required this._homeRepository})
    : super(const SearchUsersState()) {
    on<SearchUsersEvent>(
      _onSearchUsersEvent,
      transformer: (events, mapper) => events
          .debounceTime(const Duration(milliseconds: 300))
          .switchMap(mapper),
    );
  }

  final HomeRepository _homeRepository;

  Future<void> _onSearchUsersEvent(
    SearchUsersEvent event,
    Emitter<SearchUsersState> emit,
  ) async {
    emit(state.copyWith(status: SearchUsersStatus.loading));

    try {
      final users = await _homeRepository.searchUsers(event.query);
      emit(state.copyWith(status: SearchUsersStatus.loaded, users: users));
    } catch (e) {
      emit(
        state.copyWith(
          status: SearchUsersStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
