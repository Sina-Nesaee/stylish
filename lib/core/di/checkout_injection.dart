import 'package:stylish/core/di/injection.dart';
import 'package:stylish/feathers/checkout/domain/usecases/validation_checkout_usecase.dart';
import 'package:stylish/feathers/checkout/presentation/bloc/checkout_bloc.dart';

void registerCheckoutDependency() {
  getIt.registerLazySingleton<ValidationCheckoutUsecase>(
    () => ValidationCheckoutUsecase(),
  );
  getIt.registerFactory<CheckoutBloc>(
    () => CheckoutBloc(getIt<ValidationCheckoutUsecase>()),
  );
}
