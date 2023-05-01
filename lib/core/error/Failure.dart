import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final String error;

  const Failure(this.error);


}

class LocalDatabaseFailure extends Failure{

  const LocalDatabaseFailure(super.error);

  @override
  // TODO: implement props
  List<Object?> get props => [super.error];







}