import '../localDB/database.dart';

class AppConstances {
  static const EndPoint = "http://num.univ-biskra.dz/psp/pspapi";
  static const Key = "appmob";
  static final connect = DBHelper();

  static String apiDepartment(String id) {
    return "/department?faculty=${id}&key=";
  }

  static String apiField({required String id, required String semestre}) {
    return "/specialty?department=${id}&semester=${semestre}&key=";
  }

  static String apiSection({required String id, required String semestre}) {
    return "/section?level_specialty=${id}&semester=${semestre}&key=";
  }

  static String apiGroup({required String id, required String semestre}) {
    return "/group?section=${id}&semester=${semestre}&key=";
  }

  static String apiLevel({required String id, required String semestre}) {
    return "/level?specialty=${id}&semester=${semestre}&key=";
  }

  static String apiTable(
      {required String id_sec,
      required String semestre,
      required String id_group}) {
    return "/timetable?section=${id_sec}&semester=${semestre}&lang=fr&group=${id_group}&key=appmob";
  }

  static String imageUrl(param0) {
    return "https://image.tmdb.org/t/p/w500${param0}";
  }
}
