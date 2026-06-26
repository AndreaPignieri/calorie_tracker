import 'package:path_provider/path_provider.dart';
import 'package:calorie_tracker/objectbox.g.dart';
import 'package:path/path.dart' as p;

class ObjectBoxSetup {
  static Future<Store> init() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final storePath = p.join(docsDir.path, "calorie_tracker_db");
    final store = await openStore(directory: storePath);  
    return store;
  }
}