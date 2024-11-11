import 'package:hive_flutter/hive_flutter.dart';

part 'selected_adapter.g.dart';

@HiveType(typeId: 1)
class SelectedBranchDB {
  @HiveField(0)
  String selctedBranchName;

  @HiveField(1)
  int? id;

  SelectedBranchDB({
    required this.selctedBranchName,
    this.id,
  });

  factory SelectedBranchDB.fromJson(Map<String, dynamic> json) {
    return SelectedBranchDB(
      selctedBranchName: json['selctedBranchName'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selctedBranchName'] = selctedBranchName;
    data['id'] = id;
    return data;
  }
}
