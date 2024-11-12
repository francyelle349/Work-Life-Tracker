import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tracker_event.dart';
part 'tracker_state.dart';

class TrackerBloc extends Bloc<TrackerEvent, TrackerState> {
  TrackerBloc() : super(TrackerInitial()) {
    on<TrackerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
