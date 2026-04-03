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
    r'endTime': PropertySchema(
      id: 0,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'headcount': PropertySchema(
      id: 1,
      name: r'headcount',
      type: IsarType.long,
    ),
    r'isOpen': PropertySchema(
      id: 2,
      name: r'isOpen',
      type: IsarType.bool,
    ),
    r'items': PropertySchema(
      id: 3,
      name: r'items',
      type: IsarType.objectList,
      target: r'OrderItemModel',
    ),
    r'startTime': PropertySchema(
      id: 4,
      name: r'startTime',
      type: IsarType.dateTime,
    ),
    r'subtotal': PropertySchema(
      id: 5,
      name: r'subtotal',
      type: IsarType.double,
    ),
    r'tableId': PropertySchema(
      id: 6,
      name: r'tableId',
      type: IsarType.long,
    ),
    r'tableName': PropertySchema(
      id: 7,
      name: r'tableName',
      type: IsarType.string,
    ),
    r'taxAmount': PropertySchema(
      id: 8,
      name: r'taxAmount',
      type: IsarType.double,
    ),
    r'total': PropertySchema(
      id: 9,
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
  writer.writeDateTime(offsets[0], object.endTime);
  writer.writeLong(offsets[1], object.headcount);
  writer.writeBool(offsets[2], object.isOpen);
  writer.writeObjectList<OrderItemModel>(
    offsets[3],
    allOffsets,
    OrderItemModelSchema.serialize,
    object.items,
  );
  writer.writeDateTime(offsets[4], object.startTime);
  writer.writeDouble(offsets[5], object.subtotal);
  writer.writeLong(offsets[6], object.tableId);
  writer.writeString(offsets[7], object.tableName);
  writer.writeDouble(offsets[8], object.taxAmount);
  writer.writeDouble(offsets[9], object.total);
}

DiningSessionModel _diningSessionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiningSessionModel();
  object.endTime = reader.readDateTimeOrNull(offsets[0]);
  object.headcount = reader.readLong(offsets[1]);
  object.id = id;
  object.isOpen = reader.readBool(offsets[2]);
  object.items = reader.readObjectList<OrderItemModel>(
        offsets[3],
        OrderItemModelSchema.deserialize,
        allOffsets,
        OrderItemModel(),
      ) ??
      [];
  object.startTime = reader.readDateTime(offsets[4]);
  object.subtotal = reader.readDouble(offsets[5]);
  object.tableId = reader.readLong(offsets[6]);
  object.tableName = reader.readString(offsets[7]);
  object.taxAmount = reader.readDouble(offsets[8]);
  object.total = reader.readDouble(offsets[9]);
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
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readObjectList<OrderItemModel>(
            offset,
            OrderItemModelSchema.deserialize,
            allOffsets,
            OrderItemModel(),
          ) ??
          []) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
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

  QueryBuilder<DiningSessionModel, double, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}
