part of 'topup_bloc.dart';

abstract class TopupState extends Equatable {
  const TopupState();
  
  @override
  List<Object> get props => [];
}

class TopupInitial extends TopupState {}

class TopupLoading extends TopupState {}

class Topupfailed extends TopupState {
  final String e;
  const Topupfailed(this.e);

  @override
  List<Object> get props => [e];
}

class TopupSuccess extends TopupState {
  final String redirectUrl;
  const TopupSuccess(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}
