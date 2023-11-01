import 'dart:convert';

import 'package:ramadantimes/src/models/calendar_model/calendar_model.dart';
import 'package:ramadantimes/src/models/weather/weather_model_final.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/masail/masail/masail.dart';
import '../models/timing/timeofmonth.dart';
import '../models/timing/timing.dart';


class DBHelp1 {
  // static Database? db;
  // final databaseName = 'teacher5.db';
  // final databaseVersion = 1;

  DBHelp1._privateConstructor();
  static final DBHelp1 instance = DBHelp1._privateConstructor();

  // Only allow a single open connection to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath(); //veriable declar
    String path = join(dbPath, "ramadantimes1.db"); //initialize path

    return openDatabase(path, version: 1, onCreate: _onCreate); //opendatabase
  }

  static Future _onCreate(Database db, int version) async {

    await db.execute('''

      CREATE TABLE timingTable(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code INTEGER,
              status TEXT, 
              datum TEXT            
             
            )
    ''');//timingTable end

    await db.execute('''

      CREATE TABLE masalaTables(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              results TEXT,
              meta TEXT,
              links TEXT                     
            )
    ''');//masala table create end
    await db.execute('''

      CREATE TABLE calendarTables(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code INTEGER,
              status TEXT,
              data TEXT                     
            )
    ''');//calendar table create end
    await db.execute('''

      CREATE TABLE weatherTables(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              temp TEXT,
              feels_like TEXT,
              temp_min TEXT,
              temp_max TEXT,
              pressure TEXT,
              humidity TEXT,
              sea_level TEXT,
              grnd_level TEXT       
            )
    ''');//weather table create end

  }

  Future<void> createRamadanTimes(List<Timing> timing) async {
    Database db = await DBHelp1.initDB();
    db.delete('timingTable');//delete previous data
    for(var data in timing){
      await db.insert('timingTable', data.toMap());
    }

  }//insert data to timingtable

  Future<void> createMAsalaData(Masail masail) async {

    Database dbMasala = await DBHelp1.initDB();
    dbMasala.delete('masalaTables');//delete previous data
    await dbMasala.insert('masalaTables', masail.toMap());
  }//insert data to masalaTables

  Future<void> createCalendar(TimeOfMonth timeOfMonth) async {
    Database db = await DBHelp1.initDB();
    db.delete('calendarTables');//delete previous data

      await db.insert('calendarTables', timeOfMonth.toMap());
  }//insert data to timingtable
  
  Future<void> createWeather(Main weatherModelTemp) async {
    Database db = await DBHelp1.initDB();
    db.delete('weatherTables');//delete previous data

      await db.insert('weatherTables', weatherModelTemp.toMap());
  }//insert data to weathertable


  Future<List<Main>> readWeatherlList() async {
    Database dbWeather = await DBHelp1.initDB();

    var weatherList = await dbWeather.query('weatherTables');
    print("-----------------------weatherTables---------------------------");
    print(weatherList);
    List<Main> weatherListHere = weatherList.isNotEmpty
        ? weatherList.map((e) => Main.fromMap(e)).toList()
        : [];

    return weatherListHere;

  }//query or retrive data to weatherTables

  
  Future<List<Masail>> readMasailList() async {
    Database dbMasala = await DBHelp1.initDB();

    var mapsMasalaList = await dbMasala.query('masalaTables');
    print("-----------------------Masala---------------------------");
    print(mapsMasalaList);
    List<Masail> mapsMasalaListHere = mapsMasalaList.isNotEmpty
        ? mapsMasalaList.map((e) => Masail.fromMap(e)).toList()
        : [];
    return mapsMasalaListHere;

  }//query or retrive data to masalaTables


  Future<List<TimeOfMonth>> readCalendar() async {
    Database dbMasala = await DBHelp1.initDB();

    var calendarRowList = await dbMasala.query('calendarTables');
    // print("-----------------------Calendar---------------------------");
    // print(mapsCalendarList);
    List<TimeOfMonth> calenderList = calendarRowList.isNotEmpty ? calendarRowList.map((e) => TimeOfMonth.fromMap(e)).toList():[];
    return calenderList;

  }//query or retrive data to masalaTables


  Future<List<Timing>> readRamadanTimes() async {
    Database db = await DBHelp1.initDB();

    var timing = await db.query('timingTable');


    List<Timing> timingList = timing.isNotEmpty
        ? timing.map((e) => Timing.fromMap(e)).toList()
        : [];

    return timingList;
  }//query or retrive data to timingtable

  static Future<int> updateRamadanTimes(Timing timing) async {
    Database db = await DBHelp1.initDB();
    return await db.update('timingTable', timing.toJson(),
        where: 'id =?', whereArgs: [timing]);
  } //update data to timingtable

  static Future<int> deleteRamadanTimes(int id) async {
    Database db = await DBHelp1.initDB();

    return await db.delete('timingTable', where: 'id =?', whereArgs: [id]);
  } //delete data to timingtable
}