import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "RamadanTimes.db";
  static final _databaseVersion = 1;

  static final table = 'prayer_times';

  static final columnId = '_id';
  static final columnDate = 'date';
  static final columnFajr = 'fajr';
  static final columnDhuhr = 'dhuhr';
  static final columnAsr = 'asr';
  static final columnMaghrib = 'maghrib';
  static final columnIsha = 'isha';

  // Make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Open the database
  _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnDate TEXT NOT NULL,
            $columnFajr TEXT NOT NULL,
            $columnDhuhr TEXT NOT NULL,
            $columnAsr TEXT NOT NULL,
            $columnMaghrib TEXT NOT NULL,
            $columnIsha TEXT NOT NULL
          )
          ''');
  }

  // Insert prayer times data
  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  // Query all prayer times data
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  // Clear all data from the table
  Future<int> deleteAll() async {
    Database? db = await instance.database;
    return await db!.delete(table);
  }

  // Save JSON data to the database
  Future<void> saveJsonData(String jsonData) async {
    final data = json.decode(jsonData);
    final List<Map<String, dynamic>> prayerTimesData = data['data']
        .map<Map<String, dynamic>>((item) => {
      columnDate: item['date']['readable'],
      columnFajr: item['timings']['Fajr'],
      columnDhuhr: item['timings']['Dhuhr'],
      columnAsr: item['timings']['Asr'],
      columnMaghrib: item['timings']['Maghrib'],
      columnIsha: item['timings']['Isha'],
    })
        .toList();

    // Clear existing data
    await deleteAll();

    // Save new data
    for (var rowData in prayerTimesData) {
      await insert(rowData);
    }
  }



}