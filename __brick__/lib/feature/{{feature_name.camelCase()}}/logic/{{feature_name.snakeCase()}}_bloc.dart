
import 'package:rxdart/rxdart.dart';
import '../domain/model/{{model_name.snakeCase()}}_model.dart';
import '../domain/repository/{{feature_name.snakeCase()}}_repository.dart';

class {{feature_name.pascalCase()}}Bloc{

  final  _repository = {{feature_name.pascalCase()}}Repository();

  static {{feature_name.pascalCase()}}Bloc? _instance;

  {{feature_name.pascalCase()}}Bloc._();

  factory {{feature_name.pascalCase()}}Bloc.instance() {
    _instance ??= {{feature_name.pascalCase()}}Bloc._();
    return _instance!;
  }

  final _stream = BehaviorSubject<{{model_name.pascalCase()}}>();

  ValueStream<{{model_name.pascalCase()}}> get stream {
    return _stream.stream;
  }

  Future<{{model_name.pascalCase()}}> get {{model_name.camelCase()}} {
    // TODO: implement get {{model_name}}
    final data = _repository.get{{model_name.pascalCase()}}();
    throw UnimplementedError();
  }

  void dispose() { 
    _stream.close();
  }
}