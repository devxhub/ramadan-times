// import 'dart:convert';
//
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
// import 'package:path/path.dart';
//
// import '../models/masail/masail/masail.dart';
//
//
// class DBHelperMasala {
//   // static Database? db;
//   // final databaseName = 'teacher5.db';
//   // final databaseVersion = 1;
//
//   DBHelperMasala._privateConstructor();
//   static final DBHelperMasala instance = DBHelperMasala._privateConstructor();
//
//   // Only allow a single open connection to the database
//   static Database? _database;
//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await initDB();
//     return _database;
//   }
//
//   static Future<Database> initDB() async {
//     var dbPath = await getDatabasesPath(); //veriable declar
//     String path = join(dbPath, "muslimtimespro1.db"); //initialize path
//
//     return openDatabase(path, version: 1, onCreate: _onCreate); //opendatabase
//   }
//
//   static Future _onCreate(Database db, int version) async {
//
//    //timingTable end
//
//   }
//
//
//
//   Future<List<Masail>> readMAsalaData() async {
//     Database db = await DBHelperMasala.initDB();
//
//     var masala = await db.query('masalaTable');
//     print("-----------------------Masala---------------------------");
//     print(masala);
//
//     List<Masail> masalaList = masala.isNotEmpty
//         ? masalaList((e) => Masail.fromMap(e)).toList()
//         : [];
//
//     return masalaList;
//   }//query or retrive data to timingtable
//
//   static Future<int> updateMAsalaData(Masail masail) async {
//     Database db = await DBHelperMasala.initDB();
//     return await db.update('masalaTable', masail.toJson(),
//         where: 'id =?', whereArgs: [masail]);
//   } //update data to timingtable
//
//   static Future<int> deleteMAsalaData(int id) async {
//     Database db = await DBHelperMasala.initDB();
//
//     return await db.delete('masalaTable', where: 'id =?', whereArgs: [id]);
//   } //delete data to timingtable
// }
