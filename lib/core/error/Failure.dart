import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{

  final String error;

  const Failure({required this.error});

}