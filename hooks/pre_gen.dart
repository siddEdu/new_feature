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

  context.logger.write(operations.map((e) => e.name).toList().toString());
}
