part of 'add_product_cubit.dart';

@immutable
sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductFailer extends AddProductState {
  final String message;
  AddProductFailer({required this.message});
}

final class AddProductSuccess extends AddProductState {}
