import 'package:hive_flutter/hive_flutter.dart';

part 'branch_list_adapter.g.dart';

@HiveType(typeId: 2)
class BranchListDB {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  String selctedBranchName;
  @HiveField(2)
  var locality;

  BranchListDB({
    required this.id,
    required this.selctedBranchName,
    required this.locality,
  });

  factory BranchListDB.fromJson(Map<String, dynamic> json) {
    return BranchListDB(
      id: json['id'],
      selctedBranchName: json['selctedBranchName'],
      locality: json['locality'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['selctedBranchName'] = selctedBranchName;
    data['locality'] = locality;
    return data;
  }
}
