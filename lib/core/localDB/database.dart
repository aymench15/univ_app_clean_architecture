import 'package:equatable/equatable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../timetable/data/model/time_table_db.dart';
import '../utils/app_strings.dart';

class DBHelper extends Equatable {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _database();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> _database() async {
    String path = await getDatabasesPath();
    path = join(path, "my_db.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
      
        await db.execute('''
          CREATE TABLE ${AppStrings.table_name} (
            ${AppStrings.class_name} TEXT,
            ${AppStrings.location} TEXT,
            ${AppStrings.cours_type} TEXT,
            ${AppStrings.study_level} TEXT,
            ${AppStrings.field} TEXT,
            ${AppStrings.prof_firstName} TEXT,
            ${AppStrings.prof_lastName} TEXT,
            ${AppStrings.module_name} TEXT,
            ${AppStrings.loc} TEXT,
            ${AppStrings.uknown_fields1} TEXT,
            ${AppStrings.week_days} TEXT,
            ${AppStrings.time_slot} TEXT,
            ${AppStrings.uknown_fields2} TEXT,
            ${AppStrings.uknown_fields3} TEXT,
            ${AppStrings.uknown_fields4} TEXT,
            ${AppStrings.uknown_fields5} TEXT,
            ${AppStrings.uknown_fields6} TEXT,
            ${AppStrings.uknown_fields7} TEXT,
            ${AppStrings.sub_group} TEXT,
            ${AppStrings.online} TEXT,
            ${AppStrings.biweekly} TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE ${AppStrings.table_grp} (
          ${AppStrings.name} TEXT,
          ${AppStrings.id} TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertNameGrp(String name ,String id) async {
    final db = await _database();
    return   await db.insert(AppStrings.table_grp, {AppStrings.name: name,AppStrings.id: id});
  }

  Future<void> insertData(List<List<dynamic>> data) async {
    final db = await _database();
    await db.transaction((txn) async {
      for (final row in data) {
        await txn.insert(
          AppStrings.table_name,
          TimeTableDB(
            class_name: row[0],
            location: row[1],
            cours_type: row[2],
            study_level: row[3],
            field: row[4],
            prof_firstName: row[5],
            prof_lastName: row[6],
            module_name: row[7],
            loc: row[8],
            uknown_fields1: row[9],
            week_days: row[10],
            time_slot: row[11],
            uknown_fields2: row[12],
            uknown_fields3: row[13],
            uknown_fields4: row[14],
            uknown_fields5: row[15],
            uknown_fields6: row[16],
            uknown_fields7: row[17],
            sub_group: row[18],
            online: row[19],
            biweekly: row[20],
          ).toMap(),
        );
      }
    });
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await _database();
    final List<Map<String, dynamic>> data =
        await db.query(AppStrings.table_name);
    return data.toList();
  }

  Future<List<dynamic>> getGroupDetails() async {
    final db = await _database();
    final List<Map<String, dynamic>> data =
        await db.query(AppStrings.table_grp);
    return data;
  }

  Future<List<String>> getColumnNames(String tableName) async {
    final Database db = await openDatabase('my_database.db');
    final List<Map<String, dynamic>> columns =
        await db.rawQuery('SELECT * FROM $tableName LIMIT 0');
    return columns.first.keys.toList();
  }

  Future<void> deleteAllData() async {
    final db = await _database();
    await db.delete(AppStrings.table_name);
     await db.delete(AppStrings.table_grp);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [db];
}
