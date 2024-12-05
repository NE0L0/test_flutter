import 'package:test_app/core/domain/validators/base/Validator.dart';
import 'package:test_app/core/domain/validators/base/invalid_data_exception.dart';

class UsernameValidator implements Validator<String> {
  @override
  void assertValid(String data) {
    if(data.isEmpty) throw InvalidDataException(dataKey: "username", message: "Username cannot be empty");
  }
}
