import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../core/errors/errors.dart';
import '../../../core/network/Exception.dart';
import '../../../core/utils/Constances.dart';
import '../../domain/usecases/Field_UseCase.dart';
import '../../domain/usecases/group_UseCase.dart';
import '../../domain/usecases/level_UseCase.dart';
import '../../domain/usecases/section_UseCase.dart';
import '../../domain/usecases/time_tableUseCase.dart';
import '../model/department_model.dart';
import '../model/faculty_model.dart';
import '../model/field_model.dart';
import '../model/group_model.dart';
import '../model/level_model.dart';
import '../model/section_model.dart';
import '../model/time_table_model.dart';

abstract class BaseRemoteData {
  Future<List<FacultyModel>> getFaculties();
  Future<List<DepartmentModel>> getDepartments(String id);
  Future<List<FieldModel>> getField(FieldParametres parametres);
  Future<List<SectionModel>> getSection(SectionParametres parametres);
  Future<List<GroupModel>> getGroup(GroupParametres parametres);
  Future<List<LevelModel>> getLevel(LevelParametres parametres);
  Future<List<List<String>>> getTimeTable(TimeTableParametres parametres);
}

class RemoteData implements BaseRemoteData {
  @override
  Future<List<FacultyModel>> getFaculties() async {
    var dio = Dio();
    final response =
        await dio.get('${AppConstances.EndPoint}/faculty?${AppConstances.Key}');
    List responseJson = json.decode(response.data);
    //print(responseJson);
    if (response.statusCode == 200) {
      return List<FacultyModel>.from((responseJson as List).map(
        (e) => FacultyModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<DepartmentModel>> getDepartments(String id) async {
    var dio = Dio();
    final response = await dio
        .get('${AppConstances.EndPoint}${AppConstances.apiDepartment(id)}');
    List responseJson = json.decode(response.data);
    print(responseJson);
    if (response.statusCode == 200) {
      return List<DepartmentModel>.from((responseJson as List).map(
        (e) => DepartmentModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<FieldModel>> getField(FieldParametres parametres) async {
    var dio = Dio();
    final response = await dio.get(
        '${AppConstances.EndPoint}${AppConstances.apiField(id: parametres.department_id, semestre: parametres.semestre)}');
    List responseJson = json.decode(response.data);
    // print(responseJson);
    if (response.statusCode == 200) {
      return List<FieldModel>.from((responseJson as List).map(
        (e) => FieldModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<GroupModel>> getGroup(GroupParametres parametres) async {
    var dio = Dio();
    final response = await dio.get(
        '${AppConstances.EndPoint}${AppConstances.apiGroup(id: parametres.section_id, semestre: parametres.semestre)}');
    List responseJson = json.decode(response.data);
    print(
        "--- - - ------- - -- - - - - -- Group - - -- - - - - - -- - - - --   - - ");
    print(responseJson);
    print(
        "--- - - ------- - -- - - - - -- Group - - -- - - - - - -- - - - --   - - ");
    if (response.statusCode == 200) {
      return List<GroupModel>.from((responseJson as List).map(
        (e) => GroupModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<LevelModel>> getLevel(LevelParametres parametres) async {
    var dio = Dio();
    final response = await dio.get(
        '${AppConstances.EndPoint}${AppConstances.apiLevel(id: parametres.id_field, semestre: parametres.semestre)}');
    List responseJson = json.decode(response.data);
    print(
        "--- - - ------- - -- - - - - -- Level - - -- - - - - - -- - - - --   - - ");
    print(responseJson);
    print(
        "--- - - ------- - -- - - - - -- Level - - -- - - - - - -- - - - --   - - ");
    if (response.statusCode == 200) {
      return List<LevelModel>.from((responseJson as List).map(
        (e) => LevelModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<SectionModel>> getSection(SectionParametres parametres) async {
    var dio = Dio();
    final response = await dio.get(
        '${AppConstances.EndPoint}${AppConstances.apiSection(id: parametres.id_field, semestre: parametres.semestre)}');
    List responseJson = json.decode(response.data);
    print(
        "--- - - ------- - -- - - - - -- Section - - -- - - - - - -- - - - --   - - ");
    print(responseJson);
    print(
        "--- - - ------- - -- - - - - -- Section - - -- - - - - - -- - - - --   - - ");
    if (response.statusCode == 200) {
      return List<SectionModel>.from((responseJson as List).map(
        (e) => SectionModel.fromJson(e),
      ));
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }

  @override
  Future<List<List<String>>> getTimeTable(TimeTableParametres p) async {
    var dio = Dio();
    final response = await dio.get(
        '${AppConstances.EndPoint}${AppConstances.apiTable(id_sec: p.id_sec, semestre: p.semestre, id_group: p.id_group)}');

    List responseJson = json.decode(response.data);
    if (response.statusCode == 200) {
      /*List<List<String>> listOfLists = responseJson.map((list) {
    return List<String>.from(list.map((element) => TimeTable));
  }).toList();*/
      TimeTableModel t = TimeTableModel.fromJson(responseJson);
      return t.listOfLists;
    } else
      return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
    return throw HandleErrors(errorExecption: ErrorExecption.fromJson({}));
  }
}
