// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_plan_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFloorPlanModelCollection on Isar {
  IsarCollection<FloorPlanModel> get floorPlanModels => this.collection();
}

const FloorPlanModelSchema = CollectionSchema(
  name: r'FloorPlanModel',
  id: 780953947676003076,
  properties: {
    r'bgColorHex': PropertySchema(
      id: 0,
      name: r'bgColorHex',
      type: IsarType.string,
    ),
    r'canvasHeight': PropertySchema(
      id: 1,
      name: r'canvasHeight',
      type: IsarType.double,
    ),
    r'canvasWidth': PropertySchema(
      id: 2,
      name: r'canvasWidth',
      type: IsarType.double,
    ),
    r'isDefault': PropertySchema(
      id: 3,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'sortOrder': PropertySchema(
      id: 5,
      name: r'sortOrder',
      type: IsarType.long,
    )
  },
  estimateSize: _floorPlanModelEstimateSize,
  serialize: _floorPlanModelSerialize,
  deserialize: _floorPlanModelDeserialize,
  deserializeProp: _floorPlanModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _floorPlanModelGetId,
  getLinks: _floorPlanModelGetLinks,
  attach: _floorPlanModelAttach,
  version: '3.1.0+1',
);

int _floorPlanModelEstimateSize(
  FloorPlanModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bgColorHex.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _floorPlanModelSerialize(
  FloorPlanModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bgColorHex);
  writer.writeDouble(offsets[1], object.canvasHeight);
  writer.writeDouble(offsets[2], object.canvasWidth);
  writer.writeBool(offsets[3], object.isDefault);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.sortOrder);
}

FloorPlanModel _floorPlanModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FloorPlanModel();
  object.bgColorHex = reader.readString(offsets[0]);
  object.canvasHeight = reader.readDouble(offsets[1]);
  object.canvasWidth = reader.readDouble(offsets[2]);
  object.id = id;
  object.isDefault = reader.readBool(offsets[3]);
  object.name = reader.readString(offsets[4]);
  object.sortOrder = reader.readLong(offsets[5]);
  return object;
}

P _floorPlanModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _floorPlanModelGetId(FloorPlanModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _floorPlanModelGetLinks(FloorPlanModel object) {
  return [];
}

void _floorPlanModelAttach(
    IsarCollection<dynamic> col, Id id, FloorPlanModel object) {
  object.id = id;
}

extension FloorPlanModelByIndex on IsarCollection<FloorPlanModel> {
  Future<FloorPlanModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  FloorPlanModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<FloorPlanModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<FloorPlanModel?> getAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'name', values);
  }

  Future<int> deleteAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'name', values);
  }

  int deleteAllByNameSync(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'name', values);
  }

  Future<Id> putByName(FloorPlanModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(FloorPlanModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<FloorPlanModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<FloorPlanModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension FloorPlanModelQueryWhereSort
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QWhere> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FloorPlanModelQueryWhere
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QWhereClause> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterWhereClause>
      nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FloorPlanModelQueryFilter
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QFilterCondition> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bgColorHex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bgColorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bgColorHex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bgColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      bgColorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bgColorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasHeightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canvasHeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasHeightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canvasHeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasHeightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canvasHeight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasHeightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canvasHeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasWidthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'canvasWidth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasWidthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'canvasWidth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasWidthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'canvasWidth',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      canvasWidthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'canvasWidth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
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

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
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

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      sortOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      sortOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      sortOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterFilterCondition>
      sortOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FloorPlanModelQueryObject
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QFilterCondition> {}

extension FloorPlanModelQueryLinks
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QFilterCondition> {}

extension FloorPlanModelQuerySortBy
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QSortBy> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByBgColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bgColorHex', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByBgColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bgColorHex', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByCanvasHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasHeight', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByCanvasHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasHeight', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByCanvasWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasWidth', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByCanvasWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasWidth', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }
}

extension FloorPlanModelQuerySortThenBy
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QSortThenBy> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByBgColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bgColorHex', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByBgColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bgColorHex', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByCanvasHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasHeight', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByCanvasHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasHeight', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByCanvasWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasWidth', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByCanvasWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canvasWidth', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy> thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QAfterSortBy>
      thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }
}

extension FloorPlanModelQueryWhereDistinct
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct> {
  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct> distinctByBgColorHex(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bgColorHex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct>
      distinctByCanvasHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canvasHeight');
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct>
      distinctByCanvasWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canvasWidth');
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FloorPlanModel, FloorPlanModel, QDistinct>
      distinctBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder');
    });
  }
}

extension FloorPlanModelQueryProperty
    on QueryBuilder<FloorPlanModel, FloorPlanModel, QQueryProperty> {
  QueryBuilder<FloorPlanModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FloorPlanModel, String, QQueryOperations> bgColorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bgColorHex');
    });
  }

  QueryBuilder<FloorPlanModel, double, QQueryOperations>
      canvasHeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canvasHeight');
    });
  }

  QueryBuilder<FloorPlanModel, double, QQueryOperations> canvasWidthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canvasWidth');
    });
  }

  QueryBuilder<FloorPlanModel, bool, QQueryOperations> isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<FloorPlanModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FloorPlanModel, int, QQueryOperations> sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }
}
