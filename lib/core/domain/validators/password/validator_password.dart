import 'package:test_app/core/domain/validators/base/Validator.dart';
import 'package:test_app/core/domain/validators/base/invalid_data_exception.dart';

class PasswordValidator implements Validator<String>
{
  @override
  void assertValid(String data) {
    if(data.isEmpty) throw InvalidDataException(dataKey: 'password', message: 'Password cannot be empty');
  }

}
