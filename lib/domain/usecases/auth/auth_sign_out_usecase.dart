import 'package:penta_core/penta_core.dart';
import 'package:penta_story/domain/repositories/auth/auth_repository.dart';
import 'package:penta_story/injection.dart';

final class AuthSignOutUsecase implements IUseCase<void> {
  @override
  Future<ResponseModel<void>> execute() async {
    return Injection.I.read<AuthRepository>().signOut();
  }
}
