
// ignore_for_file: unused_import

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import '../domain/model/{{model_name.snakeCase()}}_model.dart';
import '../domain/repository/{{feature_name.snakeCase()}}_repository.dart';

class {{feature_name.pascalCase()}}Bloc{

  final {{feature_name.pascalCase()}}Repository _repository;


  {{feature_name.pascalCase()}}Bloc({required {{feature_name.pascalCase()}}Repository repository}) : _repository : repository;


  final stream = BehaviorSubject<{{model_name.pascalCase()}}>();

  ValueStream<{{model_name.pascalCase()}}> get stream {
    return stream.stream;
  }

  Future<{{model_name.pascalCase()}}> get {{model_name.camelCase()}} {
    // TODO: implement get {{model_name}}
    final data = repository.get{{model_name.pascalCase()}}();
    return data;
  }

  Future<void> add{{model_name.pascalCase()}}({{model_name.pascalCase()}} {{model_name.camelCase()}}){
     await repository.add{{model_name.pascalCase()}}({{model_name.camelCase()}});
  }

  Future<void> update{{model_name.pascalCase()}}({{model_name.pascalCase()}} {{model_name.camelCase()}}){
     await repository.update{{model_name.pascalCase()}}({{model_name.camelCase()}});
  }

  Future<void> delete{{model_name.pascalCase()}}({{model_name.pascalCase()}} {{model_name.camelCase()}}){
     await repository.update{{model_name.pascalCase()}}({{model_name.camelCase()}}.id);
  }

  void dispose() { 
    stream.close();
  }
}