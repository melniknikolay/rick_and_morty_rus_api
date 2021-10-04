part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  ///состояние с данными
  const factory ProfileState.data({
    ///параметры
    required final List<Episode> chaptersList,
    required final Character character,
  }) = _DataProfileState;

  ///состояние инициализации
  const factory ProfileState.initial() = _InitialProfileState;

  ///состояние отображения этапа загрузки
  const factory ProfileState.loading() = _LoadingProfileState;
}
