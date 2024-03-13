import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_app/core/di.dart';
import 'package:tourist_app/features/auth/domain/usecase/auth_use_cases.dart';

class ResetPasswordNotifier extends Notifier<AsyncValue<bool>> {
  late final AuthUseCases _authUseCases;

  @override
  AsyncValue<bool> build() {
    _authUseCases = ref.watch(authUseCasesProvider);
    return const AsyncValue.data(false);
  }

  Future<void> resetPassword(final String email) async {
    state = const AsyncValue.loading();
    final result = await _authUseCases.resetPassword(email);

    result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (_) => const AsyncValue.data(true),
    );
  }
}
