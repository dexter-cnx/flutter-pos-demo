// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dining_session_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDiningSessionModelCollection on Isar {
  IsarCollection<DiningSessionModel> get diningSessionModels =>
      this.collection();
}

const DiningSessionModelSchema = CollectionSchema(
  name: r'DiningSessionModel',
  id: -6075295640434881393,
  properties: {
    r'adultCount': PropertySchema(
      id: 0,
      name: r'adultCount',
      type: IsarType.long,
    ),
    r'buffetAdultPrice': PropertySchema(
      id: 1,
      name: r'buffetAdultPrice',
      type: IsarType.double,
    ),
    r'buffetChildPrice': PropertySchema(
      id: 2,
      name: r'buffetChildPrice',
      type: IsarType.double,
    ),
    r'buffetTierId': PropertySchema(
      id: 3,
      name: r'buffetTierId',
      type: IsarType.long,
    ),
    r'buffetTierName': PropertySchema(
      id: 4,
      name: r'buffetTierName',
      type: IsarType.string,
    ),
    r'childCount': PropertySchema(
      id: 5,
      name: r'childCount',
      type: IsarType.long,
    ),
    r'elderlyCount': PropertySchema(
      id: 6,
      name: r'elderlyCount',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 7,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'headcount': PropertySchema(
      id: 8,
      name: r'headcount',
      type: IsarType.long,
    ),
    r'isOpen': PropertySchema(
      id: 9,
      name: r'isOpen',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 10,
      name: r'items',
      type: IsarType.objectList,
      target: r'OrderItemModel',
    ),
    r'startTime': PropertySchema(
      id: 11,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'subtotal': PropertySchema(
      id: 12,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'tableId': PropertySchema(
      id: 13,
      name: r'tableId',
      type: IsarType.long,
    ),
    r'tableName': PropertySchema(
      id: 14,
      name: r'tableName',
      type: IsarType.string,
    ),
    r'taxAmount': PropertySchema(
      id: 15,
      name: r'taxAmount',
      type: IsarType.double,
    ),
    r'timeLimitMinutes': PropertySchema(
      id: 16,
      name: r'timeLimitMinutes',
      type: IsarType.long,
    ),
    r'total': PropertySchema(
      id: 17,
      name: r'total',
      type: IsarType.double,
    )
  },
  estimateSize: _diningSessionModelEstimateSize,
  serialize: _diningSessionModelSerialize,
  deserialize: _diningSessionModelDeserialize,
  deserializeProp: _diningSessionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'tableId': IndexSchema(
      id: 519297262500120396,
      name: r'tableId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tableId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isOpen': IndexSchema(
      id: -7174700296139425417,
      name: r'isOpen',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isOpen',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'startTime': IndexSchema(
      id: -3870335341264752872,
      name: r'startTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'OrderItemModel': OrderItemModelSchema},
  getId: _diningSessionModelGetId,
  getLinks: _diningSessionModelGetLinks,
  attach: _diningSessionModelAttach,
  version: '3.1.0+1',
);

int _diningSessionModelEstimateSize(
  DiningSessionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.buffetTierName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.items.length * 3;
  {
    final offsets = allOffsets[OrderItemModel]!;
    for (var i = 0; i < object.items.length; i++) {
      final value = object.items[i];
      bytesCount +=
          OrderItemModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.tableName.length * 3;
  return bytesCount;
}

void _diningSessionModelSerialize(
  DiningSessionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.adultCount);
  writer.writeDouble(offsets[1], object.buffetAdultPrice);
  writer.writeDouble(offsets[2], object.buffetChildPrice);
  writer.writeLong(offsets[3], object.buffetTierId);
  writer.writeString(offsets[4], object.buffetTierName);
  writer.writeLong(offsets[5], object.childCount);
  writer.writeLong(offsets[6], object.elderlyCount);
  writer.writeDateTime(offsets[7], object.endTime);
  writer.writeLong(offsets[8], object.headcount);
  writer.writeBool(offsets[9], object.isOpen);
  writer.writeObjectList<OrderItemModel>(
    offsets[10],
    allOffsets,
    OrderItemModelSchema.serialize,
    object.items,
  );
  writer.writeDateTime(offsets[11], object.startTime);
  writer.writeDouble(offsets[12], object.subtotal);
  writer.writeLong(offsets[13], object.tableId);
  writer.writeString(offsets[14], object.tableName);
  writer.writeDouble(offsets[15], object.taxAmount);
  writer.writeLong(offsets[16], object.timeLimitMinutes);
  writer.writeDouble(offsets[17], object.total);
}

DiningSessionModel _diningSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiningSessionModel();
  object.adultCount = reader.readLong(offsets[0]);
  object.buffetAdultPrice = reader.readDouble(offsets[1]);
  object.buffetChildPrice = reader.readDouble(offsets[2]);
  object.buffetTierId = reader.readLongOrNull(offsets[3]);
  object.buffetTierName = reader.readStringOrNull(offsets[4]);
  object.childCount = reader.readLong(offsets[5]);
  object.elderlyCount = reader.readLong(offsets[6]);
  object.endTime = reader.readDateTimeOrNull(offsets[7]);
  object.headcount = reader.readLong(offsets[8]);
  object.id = id;
  object.isOpen = reader.readBool(offsets[9]);
  object.items = reader.readObjectList<OrderItemModel>(
        offsets[10],
        OrderItemModelSchema.deserialize,
        allOffsets,
        OrderItemModel(),
      ) ??
      [];
  object.startTime = reader.readDateTime(offsets[11]);
  object.subtotal = reader.readDouble(offsets[12]);
  object.tableId = reader.readLong(offsets[13]);
  object.tableName = reader.readString(offsets[14]);
  object.taxAmount = reader.readDouble(offsets[15]);
  object.timeLimitMinutes = reader.readLongOrNull(offsets[16]);
  object.total = reader.readDouble(offsets[17]);
  return object;
}

P _diningSessionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readObjectList<OrderItemModel>(
            offset,
            OrderItemModelSchema.deserialize,
            allOffsets,
            OrderItemModel(),
          ) ??
          []) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readLongOrNull(offset)) as P;
    case 17:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _diningSessionModelGetId(DiningSessionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _diningSessionModelGetLinks(
    DiningSessionModel object) {
  return [];
}

void _diningSessionModelAttach(
    IsarCollection<dynamic> col, Id id, DiningSessionModel object) {
  object.id = id;
}

extension DiningSessionModelQueryWhereSort
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QWhere> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhere>
      anyTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tableId'),
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhere>
      anyIsOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isOpen'),
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhere>
      anyStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startTime'),
      );
    });
  }
}

extension DiningSessionModelQueryWhere
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QWhereClause> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      tableIdEqualTo(int tableId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tableId',
        value: [tableId],
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      tableIdNotEqualTo(int tableId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [tableId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tableId',
              lower: [],
              upper: [tableId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      tableIdGreaterThan(
    int tableId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tableId',
        lower: [tableId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      tableIdLessThan(
    int tableId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tableId',
        lower: [],
        upper: [tableId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      tableIdBetween(
    int lowerTableId,
    int upperTableId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tableId',
        lower: [lowerTableId],
        includeLower: includeLower,
        upper: [upperTableId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      isOpenEqualTo(bool isOpen) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isOpen',
        value: [isOpen],
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      isOpenNotEqualTo(bool isOpen) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOpen',
              lower: [],
              upper: [isOpen],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOpen',
              lower: [isOpen],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOpen',
              lower: [isOpen],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isOpen',
              lower: [],
              upper: [isOpen],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      startTimeEqualTo(DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'startTime',
        value: [startTime],
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      startTimeNotEqualTo(DateTime startTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [startTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'startTime',
              lower: [],
              upper: [startTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      startTimeGreaterThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [startTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      startTimeLessThan(
    DateTime startTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [],
        upper: [startTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterWhereClause>
      startTimeBetween(
    DateTime lowerStartTime,
    DateTime upperStartTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'startTime',
        lower: [lowerStartTime],
        includeLower: includeLower,
        upper: [upperStartTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DiningSessionModelQueryFilter
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QFilterCondition> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      adultCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adultCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      adultCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adultCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      adultCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adultCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      adultCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adultCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetAdultPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buffetAdultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetAdultPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buffetAdultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetAdultPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buffetAdultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetAdultPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buffetAdultPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetChildPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buffetChildPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetChildPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buffetChildPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetChildPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buffetChildPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetChildPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buffetChildPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buffetTierId',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buffetTierId',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buffetTierId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buffetTierId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buffetTierId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buffetTierId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'buffetTierName',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'buffetTierName',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buffetTierName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buffetTierName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buffetTierName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buffetTierName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      buffetTierNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buffetTierName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      childCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'childCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      childCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'childCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      childCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'childCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      childCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'childCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      elderlyCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elderlyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      elderlyCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elderlyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      elderlyCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elderlyCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      elderlyCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elderlyCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      headcountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'headcount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      headcountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'headcount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      headcountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'headcount',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      headcountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'headcount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      isOpenEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      startTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      subtotalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      subtotalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      subtotalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtotal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      subtotalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtotal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableId',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tableName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tableName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tableName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      tableNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tableName',
        value: '',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      taxAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      taxAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      taxAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      taxAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeLimitMinutes',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeLimitMinutes',
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeLimitMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeLimitMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeLimitMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      timeLimitMinutesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeLimitMinutes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      totalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      totalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      totalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      totalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DiningSessionModelQueryObject
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QFilterCondition> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterFilterCondition>
      itemsElement(FilterQuery<OrderItemModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension DiningSessionModelQueryLinks
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QFilterCondition> {}

extension DiningSessionModelQuerySortBy
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QSortBy> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByAdultCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByAdultCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetAdultPrice', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetAdultPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetAdultPrice', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetChildPrice', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetChildPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetChildPrice', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetTierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierId', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetTierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierId', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetTierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierName', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByBuffetTierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierName', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByChildCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByChildCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByElderlyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByElderlyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByHeadcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headcount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByHeadcountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headcount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByIsOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOpen', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByIsOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOpen', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTimeLimitMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension DiningSessionModelQuerySortThenBy
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QSortThenBy> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByAdultCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByAdultCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetAdultPrice', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetAdultPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetAdultPrice', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetChildPrice', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetChildPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetChildPrice', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetTierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierId', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetTierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierId', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetTierName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierName', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByBuffetTierNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buffetTierName', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByChildCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByChildCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByElderlyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyCount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByElderlyCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyCount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByHeadcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headcount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByHeadcountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'headcount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByIsOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOpen', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByIsOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOpen', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenBySubtotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subtotal', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTableName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTableNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableName', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTaxAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxAmount', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTimeLimitMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.desc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QAfterSortBy>
      thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension DiningSessionModelQueryWhereDistinct
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct> {
  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByAdultCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adultCount');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByBuffetAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buffetAdultPrice');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByBuffetChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buffetChildPrice');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByBuffetTierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buffetTierId');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByBuffetTierName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buffetTierName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByChildCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'childCount');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByElderlyCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elderlyCount');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByHeadcount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'headcount');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByIsOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOpen');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctBySubtotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtotal');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableId');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByTableName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByTaxAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxAmount');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeLimitMinutes');
    });
  }

  QueryBuilder<DiningSessionModel, DiningSessionModel, QDistinct>
      distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension DiningSessionModelQueryProperty
    on QueryBuilder<DiningSessionModel, DiningSessionModel, QQueryProperty> {
  QueryBuilder<DiningSessionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DiningSessionModel, int, QQueryOperations> adultCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adultCount');
    });
  }

  QueryBuilder<DiningSessionModel, double, QQueryOperations>
      buffetAdultPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buffetAdultPrice');
    });
  }

  QueryBuilder<DiningSessionModel, double, QQueryOperations>
      buffetChildPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buffetChildPrice');
    });
  }

  QueryBuilder<DiningSessionModel, int?, QQueryOperations>
      buffetTierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buffetTierId');
    });
  }

  QueryBuilder<DiningSessionModel, String?, QQueryOperations>
      buffetTierNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buffetTierName');
    });
  }

  QueryBuilder<DiningSessionModel, int, QQueryOperations> childCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'childCount');
    });
  }

  QueryBuilder<DiningSessionModel, int, QQueryOperations>
      elderlyCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elderlyCount');
    });
  }

  QueryBuilder<DiningSessionModel, DateTime?, QQueryOperations>
      endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<DiningSessionModel, int, QQueryOperations> headcountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'headcount');
    });
  }

  QueryBuilder<DiningSessionModel, bool, QQueryOperations> isOpenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOpen');
    });
  }

  QueryBuilder<DiningSessionModel, List<OrderItemModel>, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<DiningSessionModel, DateTime, QQueryOperations>
      startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }

  QueryBuilder<DiningSessionModel, double, QQueryOperations>
      subtotalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtotal');
    });
  }

  QueryBuilder<DiningSessionModel, int, QQueryOperations> tableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableId');
    });
  }

  QueryBuilder<DiningSessionModel, String, QQueryOperations>
      tableNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableName');
    });
  }

  QueryBuilder<DiningSessionModel, double, QQueryOperations>
      taxAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxAmount');
    });
  }

  QueryBuilder<DiningSessionModel, int?, QQueryOperations>
      timeLimitMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeLimitMinutes');
    });
  }

  QueryBuilder<DiningSessionModel, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
