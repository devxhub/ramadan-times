import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result extends Equatable {
  final int? id;
  final String? content;
  final String? title;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final int? lang;

  const Result({
    this.id,
    this.content,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.lang,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  Result copyWith({
    int? id,
    String? content,
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? lang,
  }) {
    return Result(
      id: id ?? this.id,
      content: content ?? this.content,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lang: lang ?? this.lang,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      content,
      title,
      createdAt,
      updatedAt,
      lang,
    ];
  }
}
