// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_object_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLayoutObjectModelCollection on Isar {
  IsarCollection<LayoutObjectModel> get layoutObjectModels => this.collection();
}

const LayoutObjectModelSchema = CollectionSchema(
  name: r'LayoutObjectModel',
  id: 486101962332975285,
  properties: {
    r'colorHex': PropertySchema(
      id: 0,
      name: r'colorHex',
      type: IsarType.string,
    ),
    r'floorPlanId': PropertySchema(
      id: 1,
      name: r'floorPlanId',
      type: IsarType.long,
    ),
    r'height': PropertySchema(
      id: 2,
      name: r'height',
      type: IsarType.double,
    ),
    r'icon': PropertySchema(
      id: 3,
      name: r'icon',
      type: IsarType.string,
    ),
    r'isLocked': PropertySchema(
      id: 4,
      name: r'isLocked',
      type: IsarType.bool,
    ),
    r'label': PropertySchema(
      id: 5,
      name: r'label',
      type: IsarType.string,
    ),
    r'objectType': PropertySchema(
      id: 6,
      name: r'objectType',
      type: IsarType.string,
    ),
    r'rotation': PropertySchema(
      id: 7,
      name: r'rotation',
      type: IsarType.double,
    ),
    r'tableId': PropertySchema(
      id: 8,
      name: r'tableId',
      type: IsarType.long,
    ),
    r'width': PropertySchema(
      id: 9,
      name: r'width',
      type: IsarType.double,
    ),
    r'x': PropertySchema(
      id: 10,
      name: r'x',
      type: IsarType.double,
    ),
    r'y': PropertySchema(
      id: 11,
      name: r'y',
      type: IsarType.double,
    ),
    r'zIndex': PropertySchema(
      id: 12,
      name: r'zIndex',
      type: IsarType.long,
    )
  },
  estimateSize: _layoutObjectModelEstimateSize,
  serialize: _layoutObjectModelSerialize,
  deserialize: _layoutObjectModelDeserialize,
  deserializeProp: _layoutObjectModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'floorPlanId': IndexSchema(
      id: -6581513118032701344,
      name: r'floorPlanId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'floorPlanId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _layoutObjectModelGetId,
  getLinks: _layoutObjectModelGetLinks,
  attach: _layoutObjectModelAttach,
  version: '3.1.0+1',
);

int _layoutObjectModelEstimateSize(
  LayoutObjectModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.colorHex;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.icon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.objectType.length * 3;
  return bytesCount;
}

void _layoutObjectModelSerialize(
  LayoutObjectModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.colorHex);
  writer.writeLong(offsets[1], object.floorPlanId);
  writer.writeDouble(offsets[2], object.height);
  writer.writeString(offsets[3], object.icon);
  writer.writeBool(offsets[4], object.isLocked);
  writer.writeString(offsets[5], object.label);
  writer.writeString(offsets[6], object.objectType);
  writer.writeDouble(offsets[7], object.rotation);
  writer.writeLong(offsets[8], object.tableId);
  writer.writeDouble(offsets[9], object.width);
  writer.writeDouble(offsets[10], object.x);
  writer.writeDouble(offsets[11], object.y);
  writer.writeLong(offsets[12], object.zIndex);
}

LayoutObjectModel _layoutObjectModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LayoutObjectModel();
  object.colorHex = reader.readStringOrNull(offsets[0]);
  object.floorPlanId = reader.readLong(offsets[1]);
  object.height = reader.readDouble(offsets[2]);
  object.icon = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isLocked = reader.readBool(offsets[4]);
  object.label = reader.readStringOrNull(offsets[5]);
  object.objectType = reader.readString(offsets[6]);
  object.rotation = reader.readDouble(offsets[7]);
  object.tableId = reader.readLongOrNull(offsets[8]);
  object.width = reader.readDouble(offsets[9]);
  object.x = reader.readDouble(offsets[10]);
  object.y = reader.readDouble(offsets[11]);
  object.zIndex = reader.readLong(offsets[12]);
  return object;
}

P _layoutObjectModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _layoutObjectModelGetId(LayoutObjectModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _layoutObjectModelGetLinks(
    LayoutObjectModel object) {
  return [];
}

void _layoutObjectModelAttach(
    IsarCollection<dynamic> col, Id id, LayoutObjectModel object) {
  object.id = id;
}

extension LayoutObjectModelQueryWhereSort
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QWhere> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhere>
      anyFloorPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'floorPlanId'),
      );
    });
  }
}

extension LayoutObjectModelQueryWhere
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QWhereClause> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      floorPlanIdEqualTo(int floorPlanId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'floorPlanId',
        value: [floorPlanId],
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      floorPlanIdNotEqualTo(int floorPlanId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorPlanId',
              lower: [],
              upper: [floorPlanId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorPlanId',
              lower: [floorPlanId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorPlanId',
              lower: [floorPlanId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'floorPlanId',
              lower: [],
              upper: [floorPlanId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      floorPlanIdGreaterThan(
    int floorPlanId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'floorPlanId',
        lower: [floorPlanId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      floorPlanIdLessThan(
    int floorPlanId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'floorPlanId',
        lower: [],
        upper: [floorPlanId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterWhereClause>
      floorPlanIdBetween(
    int lowerFloorPlanId,
    int upperFloorPlanId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'floorPlanId',
        lower: [lowerFloorPlanId],
        includeLower: includeLower,
        upper: [upperFloorPlanId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LayoutObjectModelQueryFilter
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QFilterCondition> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorHex',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorHex',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorHex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorHex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      colorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      floorPlanIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      floorPlanIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      floorPlanIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorPlanId',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      floorPlanIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorPlanId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      heightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      heightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      heightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      heightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      isLockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLocked',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'objectType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'objectType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'objectType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'objectType',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      objectTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'objectType',
        value: '',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      rotationEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rotation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      rotationGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rotation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      rotationLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rotation',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      rotationBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rotation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tableId',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tableId',
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tableId',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdGreaterThan(
    int? value, {
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdLessThan(
    int? value, {
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      tableIdBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      widthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      widthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      widthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'width',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      widthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'width',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      xEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      xGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      xLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'x',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      xBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'x',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      yEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      yGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      yLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'y',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      yBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'y',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      zIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'zIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      zIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'zIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      zIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'zIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterFilterCondition>
      zIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'zIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension LayoutObjectModelQueryObject
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QFilterCondition> {}

extension LayoutObjectModelQueryLinks
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QFilterCondition> {}

extension LayoutObjectModelQuerySortBy
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QSortBy> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByFloorPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorPlanId', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByFloorPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorPlanId', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByIsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocked', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByIsLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocked', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectType', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectType', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByRotation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByRotationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy> sortByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy> sortByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByZIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zIndex', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      sortByZIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zIndex', Sort.desc);
    });
  }
}

extension LayoutObjectModelQuerySortThenBy
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QSortThenBy> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByFloorPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorPlanId', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByFloorPlanIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorPlanId', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'icon', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByIsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocked', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByIsLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLocked', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByObjectType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectType', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByObjectTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectType', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByRotation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByRotationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rotation', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByTableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tableId', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'width', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy> thenByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByXDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'x', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy> thenByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByYDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'y', Sort.desc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByZIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zIndex', Sort.asc);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QAfterSortBy>
      thenByZIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'zIndex', Sort.desc);
    });
  }
}

extension LayoutObjectModelQueryWhereDistinct
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct> {
  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByColorHex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorHex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByFloorPlanId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorPlanId');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct> distinctByIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'icon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByIsLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLocked');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByObjectType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'objectType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByRotation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rotation');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByTableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tableId');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'width');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct> distinctByX() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'x');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct> distinctByY() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'y');
    });
  }

  QueryBuilder<LayoutObjectModel, LayoutObjectModel, QDistinct>
      distinctByZIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'zIndex');
    });
  }
}

extension LayoutObjectModelQueryProperty
    on QueryBuilder<LayoutObjectModel, LayoutObjectModel, QQueryProperty> {
  QueryBuilder<LayoutObjectModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LayoutObjectModel, String?, QQueryOperations>
      colorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorHex');
    });
  }

  QueryBuilder<LayoutObjectModel, int, QQueryOperations> floorPlanIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorPlanId');
    });
  }

  QueryBuilder<LayoutObjectModel, double, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<LayoutObjectModel, String?, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<LayoutObjectModel, bool, QQueryOperations> isLockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLocked');
    });
  }

  QueryBuilder<LayoutObjectModel, String?, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<LayoutObjectModel, String, QQueryOperations>
      objectTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'objectType');
    });
  }

  QueryBuilder<LayoutObjectModel, double, QQueryOperations> rotationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rotation');
    });
  }

  QueryBuilder<LayoutObjectModel, int?, QQueryOperations> tableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tableId');
    });
  }

  QueryBuilder<LayoutObjectModel, double, QQueryOperations> widthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'width');
    });
  }

  QueryBuilder<LayoutObjectModel, double, QQueryOperations> xProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'x');
    });
  }

  QueryBuilder<LayoutObjectModel, double, QQueryOperations> yProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'y');
    });
  }

  QueryBuilder<LayoutObjectModel, int, QQueryOperations> zIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'zIndex');
    });
  }
}
