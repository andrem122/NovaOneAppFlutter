import 'package:equatable/equatable.dart';

abstract class NovaOneTableItemData extends Equatable {
  final String title;
  final String subtitle;

  const NovaOneTableItemData({required this.title, required this.subtitle});

  @override
  List<Object> get props => [title, subtitle];
}
