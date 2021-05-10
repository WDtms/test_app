import 'package:json_annotation/json_annotation.dart';

part 'bitcoin_dto.g.dart';

@JsonSerializable()
class BitcoinDTO {
  @JsonKey(name: 'lastPrice')
  final String lastPrice;

  BitcoinDTO(this.lastPrice);

  factory BitcoinDTO.fromJson(Map<String, dynamic> json) => _$BitcoinDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BitcoinDTOToJson(this);
}