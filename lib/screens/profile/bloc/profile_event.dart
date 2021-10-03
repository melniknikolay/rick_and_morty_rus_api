part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  ///событие инициализации
  const factory ProfileEvent.initial() = _InitialProfileEvent;
}
