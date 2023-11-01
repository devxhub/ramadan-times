import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

import '../models/timing/timing.dart';

class DBHelp {
  // static Database? db;
  // final databaseName = 'teacher5.db';
  // final databaseVersion = 1;

  DBHelp._privateConstructor();
  static final DBHelp instance = DBHelp._privateConstructor();

  // Only allow a single open connection to the database
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  static Future<Database> initDB() async {
    var dbPath = await getDatabasesPath(); //veriable declar
    String path = join(dbPath, "ramadantimes.db"); //initialize path

    return openDatabase(path, version: 1, onCreate: _onCreate); //opendatabase
  }

  static Future _onCreate(Database db, int version) async {

    db.execute('''

      CREATE TABLE timingTable(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              code INTEGER,
              status TEXT, 
              datumTableId INTEGER ,            
              FOREIGN KEY (datumTableId) REFERENCES datumTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
            )
    ''');//timingTable end
    db.execute('''
      CREATE TABLE datumTable(
              
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              timingsId INTEGER ,
              dateId INTEGER,
              metaId INTEGER,       
              FOREIGN KEY (timingsId) REFERENCES timingsTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION
               
                FOREIGN KEY (dateId) REFERENCES dateTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION
               
                FOREIGN KEY (metaId) REFERENCES metaTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
            )
    '''); //datumTable end of timingTable
    db.execute('''
      CREATE TABLE timingsTable(
              
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              fajr TEXT ,
              sunrise TEXT,
              dhuhr TEXT,       
              asr TEXT,       
              sunset TEXT,       
              maghrib TEXT,       
              isha TEXT,       
              imsak TEXT,       
              midnight TEXT       
             
            )
    '''); //timings end of datumTable
    db.execute('''
      CREATE TABLE dateTable(
              
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              readable TEXT ,
              timestamp TEXT,
              gregorianId INTEGER,      
              hijriId INTEGER,  
              
              FOREIGN KEY (gregorianId) REFERENCES gregorianTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
               
               FOREIGN KEY (hijriId) REFERENCES timingsTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION     
             
            )
    '''); //dateTable end of datumTable

    db.execute('''
      CREATE TABLE gregorianTable(
           
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              date TEXT ,
              format TEXT,
              day TEXT,      
              weekdayId INTEGER,  
              monthId INTEGER,  
              year TEXT, 
              designationId INTEGER,
              
              FOREIGN KEY (weekdayId) REFERENCES weekdayTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
               
               FOREIGN KEY (monthId) REFERENCES monthTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
               
                FOREIGN KEY (designationId) REFERENCES designationTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION     
             
            )
    '''); //gregorianTable end of dateTable

    db.execute('''
      CREATE TABLE weekdayTable(
         
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              en TEXT 
            
            )
    '''); //weekdayTable end of gregorianTable
    db.execute('''
      CREATE TABLE monthTable(
         
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              number INTEGER ,
              en TEXT 
            
            )
    '''); //monthTable end of gregorianTable
    db.execute('''
      CREATE TABLE designationTable(
         
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              abbreviated TEXT ,
              expanded TEXT 
            
            )
    '''); //designationTable end of gregorianTable

    db.execute('''
      CREATE TABLE hijriTable(
              
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              date TEXT ,
              format TEXT,
              day TEXT,
              year TEXT,
              holidays TEXT //list of strings
             
            )
    '''); //hijriTable end of dateTable

    db.execute('''
      CREATE TABLE metaTable(
           
              id INTEGER PRIMARY KEY AUTOINCREMENT,
               latitude FLOAT,
    longitude FLOAT,
    timezone TEXT,
    methodId INTEGER,
    latitudeAdjustmentMethod TEXT,
    midnightMode TEXT,
    school TEXT,
    offsetId INTEGER,
              
              FOREIGN KEY (methodId) REFERENCES methodTable (methodTableId)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
               
               FOREIGN KEY (offsetId) REFERENCES offsetTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
                  
             
            )
    '''); //metaTable end of dateTable
    db.execute('''
      CREATE TABLE methodTable(
           
              methodTableId INTEGER PRIMARY KEY AUTOINCREMENT,
              id INTEGER,
              name TEXT,
              paramsID INTEGER,
              
              FOREIGN KEY (paramsID) REFERENCES paramsTable (id)       
               ON DELETE NO ACTION ON UPDATE NO ACTION 
                  
             
            )
    '''); // methodTable end of metaTable
    db.execute('''
      CREATE TABLE paramsTable(
           
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              fajr INTEGER,
              isha INTEGER
                         
            )
    '''); // paramsTable end of methodTable
    db.execute('''
      CREATE TABLE offsetTable(
           
              id INTEGER PRIMARY KEY AUTOINCREMENT,

              imsak INTEGER,
              fajr INTEGER,
              sunrise INTEGER,
              dhuhr INTEGER,
              asr INTEGER,
              maghrib INTEGER,
              sunset INTEGER,
              isha INTEGER,
              midnight INTEGER
                         
            )
    '''); // paramsTable end of methodTable
  }

   Future<int> createRamadanTimes(Timing timing) async {
    Database db = await DBHelp.initDB();
    return await db.insert('timingTable', timing.toJson());
  }//insert data to timingtable

   Future<List<Timing>> readRamadanTimes() async {
    Database db = await DBHelp.initDB();

    var timing = await db.query('timingTable');

    List<Timing> timingList = timing.isNotEmpty
        ? timing.map((e) => Timing.fromJson(e)).toList()
        : [];

    return timingList;
  }//query or retrive data to timingtable

  static Future<int> updateRamadanTimes(Timing timing) async {
    Database db = await DBHelp.initDB();
    return await db.update('timingTable', timing.toJson(),
        where: 'id =?', whereArgs: [timing]);
  } //update data to timingtable

  static Future<int> deleteRamadanTimes(int id) async {
    Database db = await DBHelp.initDB();

    return await db.delete('timingTable', where: 'id =?', whereArgs: [id]);
  } //delete data to timingtable
}
