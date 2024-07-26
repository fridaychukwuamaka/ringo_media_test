import 'package:freezed_annotation/freezed_annotation.dart';
part 'calender_page_state.freezed.dart';

@freezed
class CalenderPageState with _$CalenderPageState {
  const factory CalenderPageState({
    required DateTime? focusDate,
    @Default(0) int timeLineIndex,
  }) = _CalenderPageState;
}
