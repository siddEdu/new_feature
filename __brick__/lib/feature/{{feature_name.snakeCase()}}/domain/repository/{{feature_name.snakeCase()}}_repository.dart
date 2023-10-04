// ignore_for_file: unused_import

import '../model/{{model_name.snakeCase()}}_model.dart';

class {{feature_name.pascalCase()}}Repository {

  Future<{{model_name.pascalCase()}}> get{{model_name.pascalCase()}}(){
    throw UnimplementedError();
  }


  Future<void> add{{model_name.pascalCase()}}({{model_name.pascalCase()}} {{model_name.camelCase()}}) async{

    final res = await locator<NetworkService>().postRequest(
      url : \"{{create_path}}\",
      data : {},
      shouldLog : true,
    );
  }


  Future<void> update{{model_name.pascalCase()}}({{model_name.pascalCase()}} {{model_name.camelCase()}}) async{

    final res = await locator<NetworkService>().postRequest(
      url : \"{{update_path}}\",
      data : {},
      shouldLog : true,
    );
  }


  Future<void> delete{{model_name.pascalCase()}}(int id) async{

    final res = await locator<NetworkService>().postRequest(
      url : \"{{update_path}}\",
      data : {},
      shouldLog : true,
    );
  }
  

}