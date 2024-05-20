part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class UserLoading extends ProductState {}

final class UserLoaded extends ProductState {
  final List<ProductModel> products;
  
  UserLoaded(this.products);
}

final class UserEmpty extends ProductState {}
class UserError extends ProductState {
  final String message;

  UserError(this.message);
}