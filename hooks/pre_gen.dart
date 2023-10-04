import 'package:mason/mason.dart';

enum CRUD_OPERATION {
  Create,
  Read,
  Update,
  Delete,
}

void run(HookContext context) {
  bool isCrudOperation = context.logger.confirm(
    "does this feature consist CRUD opwrations?",
    defaultValue: false,
  );

  if (!isCrudOperation) return;

  final operations = context.logger.chooseAny<CRUD_OPERATION>(
    "Select operations",
    choices: CRUD_OPERATION.values,
    defaultValues: CRUD_OPERATION.values,
  );

  // final token = context.logger.prompt("Please enter auth token?");
  // final username = context.logger.prompt("Please enter username?");
  // final tenant = context.logger.prompt("Please enter tenant?");
  // final baseUrl =
  //     context.logger.prompt("Please enter base url? (with last slash)");

  // final networkService = NetworkService(
  //   client: Dio(
  //     BaseOptions(
  //       baseUrl: baseUrl,
  //       headers: {
  //         "Accept": "application/json",
  //         "EPS-token": token,
  //         "EPS-uid": username,
  //         "router-path": "/inst_mobile-app",
  //         "EPS-tenant": tenant,
  //       },
  //     ),
  //   ),
  // );

  for (final operation in operations) {
    final path = context.logger.prompt("Please enter path ex. api/vi/login ?");
    context.vars.addAll({getParamKey(operation): path});
  }
}

String getParamKey(CRUD_OPERATION operation) {
  return switch (operation) {
    CRUD_OPERATION.Create => "create_path",
    CRUD_OPERATION.Read => "read_path",
    CRUD_OPERATION.Update => "update_path",
    CRUD_OPERATION.Delete => "delete_path",
  };
}
