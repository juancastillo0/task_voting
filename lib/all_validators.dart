import 'package:valida/valida.dart';
import 'package:task_voting/src/tasks/task_model.dart';

// ignore: avoid_classes_with_only_static_members
class Validators {
  static const typeMap = <Type, Validator>{
    Task: validatorTask,
  };

  static const validatorTask = Validator(validateTask);

  static Validator<T, Validation<T, Object>>? validator<T>() {
    final validator = typeMap[T];
    return validator as Validator<T, Validation<T, Object>>?;
  }

  static Validation<T, Object>? validate<T>(T value) {
    final validator = typeMap[T];
    return validator?.validate(value) as Validation<T, Object>?;
  }
}
