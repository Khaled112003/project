part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class UserLoading extends ProductState {}

final class UserLoaded extends ProductState {}

final class UserEmpty extends ProductState {}
