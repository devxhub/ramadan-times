// ignore_for_file: non_constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseRepository {
  static Database? db;
  final databaseName = 'teacher5.db';
  final databaseVersion = 1;

  // StudentDBRepository() {
  //   init();
  // }
  DatabaseRepository.privateConstructor();

  static final DatabaseRepository instance =
  DatabaseRepository.privateConstructor();

  Future<Database?> get database async {
    if (db != null) {
      return db;
    } else {
      db = await init();
      return db;
    }
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    print(databasesPath);

    db = await openDatabase(
      // Set the path to the database.
        path.join(databasesPath, databaseName),
        version: databaseVersion, onCreate: (Database newDb, int version) {
      newDb.execute('''

      CREATE TABLE students(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              batchId INTEGER,
              name TEXT,
              cls TEXT,
              collage TEXT,
              mobile TEXT,
              fatherName TEXT,
              motherName TEXT,
              startDate TEXT,
              endDate TEXT,
              roll INTEGER,
              FOREIGN KEY (batchId) REFERENCES batch (batchId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION     
            )
    ''');

      newDb.execute('''

      CREATE TABLE attendances(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              attendanceTime text,
              attendanceDate text,
              batchId INTEGER,
              studentId INTEGER,
              isAttended BIT(1),
              FOREIGN KEY (studentId) REFERENCES student (studentId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
              FOREIGN KEY (batchId) REFERENCES batch (batchID)       
               ON DELETE NO ACTION ON UPDATE NO ACTION  
            )
    ''');
      newDb.execute('''

      CREATE TABLE parentInfos(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              studentId INTEGER,
              name text,
              mobile text,
              relation text,
              address text,
              email text,
              FOREIGN KEY (studentId) REFERENCES student (studentId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
            )
    ''');
      print("parentInfo created");
      newDb.execute('''

      CREATE TABLE payments(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              studentId INTEGER,
              batchId INTEGER,
              method TEXT,
              amount INTEGER,
              paymentDateTime TEXT,
              isPaid BIT(1),           
              FOREIGN KEY (studentId) REFERENCES student (studentId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
              FOREIGN KEY (batchId) REFERENCES batch (batchId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION         
            )
    ''');
      newDb.execute('''

      CREATE TABLE batches(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              teacherId INTEGER,
              name TEXT,
              cls TEXT,
              collage TEXT,
              startTime TEXT,
              endTime TEXT,
              batchTime datetime,
              batchLocation TEXT
            )
    ''');
      newDb.execute('''

      CREATE TABLE activeDays(
              id INTEGER PRIMARY KEY, 
              batchId INTEGER, 
              dayNumber INTEGER, 
              FOREIGN KEY(batchId) REFERENCES batch (id),
              UNIQUE(batchId,dayNumber)
            )
    ''');
    });
    print("db_created");
    return db;
  }
}

// abstract class Source {
//   Future<List<int>> fetchTopIds();
//   Future<List<int>> fetchBestIds();
//   Future<Student> fetchItems(int id);
// }

// abstract class Cache {
//   Future<int> addItems(Student item);
//   Future<int> clear();
// }





// Future _create(Database db, int version) async {
//     await db.execute("""
//             CREATE TABLE C (
//               id INTEGER PRIMARY KEY,
//               A_id INTEGER NOT NULL,
//               B_id INTEGER NOT NULL,
//               FOREIGN KEY (A_id) REFERENCES A (id)
//                 ON DELETE NO ACTION ON UPDATE NO ACTION,
//               FOREIGN KEY (B_id) REFERENCES B (id)
//                 ON DELETE NO ACTION ON UPDATE NO ACTION
//             )""");
//   }


// Future _onCreate(Database db, int version) async {
// // SQL code to create User table
// await db.execute('''
//     CREATE TABLE user (
//       id INTEGER PRIMARY KEY,
//       username TEXT NOT NULL UNIQUE,
//      )''');
// // SQL code to create Blog table
// await db.execute('''
//     CREATE TABLE blog (
//       id INTEGER PRIMARY KEY,
//       user_id INTEGER NOT NULL,
//       title TEXT NOT NULL,
//       body TEXT NOT NULL,
//       FOREIGN KEY (user_id) REFERENCES user (id)
//        ON DELETE NO ACTION ON UPDATE NO ACTION
//      )''');
// }

//  Warning: Always use whereArgs to pass arguments to a where statement. This helps safeguard against SQL injection attacks.

// Do not use string interpolation, such as where: "id = ${dog.id}"!



// A good place to enable foreign keys is in onConfigure:

// _onConfigure(Database db) async {
//   // Add support for cascade delete
//   await db.execute("PRAGMA foreign_keys = ON");
// }

// var db = await openDatabase(path, onConfigure: _onConfigure);


// Things to Remember
// All tables should have a column (or set of columns) designated as a primary key.
// If you are concerned about duplicate values in a non-key column, you can define a unique
// index on the column to ensure integrity.
// Use as simple a key as possible, with values that do not need to be updated.



// openDatabase(path, onCreate:_createDb, onUpgrade: onUpgrade,version:_DB_VERSION);
// ...
// ...

//     _onUpgrade( Database db, int oldVersion, int newVersion ) async {

//     Batch batch = db.batch();

//     // drop first

//     batch.execute("DROP TABLE IF EXISTS $_TABLE_3 ;");

//     batch.execute("DROP TABLE IF EXISTS $_TABLE_2 ;");
//     batch.execute("DROP TABLE IF EXISTS $_TABLE_1 ;");
//     // then create again
//     batch.execute("CREATE TABLE $TABLE_1 ...... ");
//     batch.execute("CREATE TABLE $TABLE_2 ...... ");
//     batch.execute("CREATE TABLE $TABLE_3 ...... ");
//     List<dynamic> result = await batch.commit();

// }