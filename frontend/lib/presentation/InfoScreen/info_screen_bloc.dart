import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/welcome_screen.dart';
import 'package:get/get.dart';

class InfoScreenState extends Equatable {
  const InfoScreenState();

  @override
  List<Object?> get props => [];
}

class LoadingState extends InfoScreenState {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

abstract class InfoScreenEvent extends Equatable {
  const InfoScreenEvent();

  @override
  List<Object?> get props => [];
}

class RegistrationEvent extends InfoScreenEvent {
  final Map<String, dynamic> data;

  const RegistrationEvent({required this.data});

  @override
  List<Object?> get props => [data];
}

class InfoScreenBloc extends Bloc<InfoScreenEvent, InfoScreenState> {
  InfoScreenBloc() : super(const InfoScreenState()) {
    on<RegistrationEvent>(
        (RegistrationEvent event, Emitter<InfoScreenState> emit) async {
      //TODO: ping the server
      //navigate to the next screen
      Get.offAndToNamed(WelcomeScreen.id);
    });
  }
}
