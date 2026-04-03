// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffet_tier_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBuffetTierModelCollection on Isar {
  IsarCollection<BuffetTierModel> get buffetTierModels => this.collection();
}

const BuffetTierModelSchema = CollectionSchema(
  name: r'BuffetTierModel',
  id: -403851681204522762,
  properties: {
    r'adultPrice': PropertySchema(
      id: 0,
      name: r'adultPrice',
      type: IsarType.double,
    ),
    r'childPrice': PropertySchema(
      id: 1,
      name: r'childPrice',
      type: IsarType.double,
    ),
    r'colorHex': PropertySchema(
      id: 2,
      name: r'colorHex',
      type: IsarType.string,
    ),
    r'elderlyDiscount': PropertySchema(
      id: 3,
      name: r'elderlyDiscount',
      type: IsarType.double,
    ),
    r'excludedCategoryIds': PropertySchema(
      id: 4,
      name: r'excludedCategoryIds',
      type: IsarType.stringList,
    ),
    r'isActive': PropertySchema(
      id: 5,
      name: r'isActive',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'sortOrder': PropertySchema(
      id: 7,
      name: r'sortOrder',
      type: IsarType.long,
    ),
    r'timeLimitMinutes': PropertySchema(
      id: 8,
      name: r'timeLimitMinutes',
      type: IsarType.long,
    )
  },
  estimateSize: _buffetTierModelEstimateSize,
  serialize: _buffetTierModelSerialize,
  deserialize: _buffetTierModelDeserialize,
  deserializeProp: _buffetTierModelDeserializeProp,
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
    ),
    r'sortOrder': IndexSchema(
      id: -1119549396205841918,
      name: r'sortOrder',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'sortOrder',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _buffetTierModelGetId,
  getLinks: _buffetTierModelGetLinks,
  attach: _buffetTierModelAttach,
  version: '3.1.0+1',
);

int _buffetTierModelEstimateSize(
  BuffetTierModel object,
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
  bytesCount += 3 + object.excludedCategoryIds.length * 3;
  {
    for (var i = 0; i < object.excludedCategoryIds.length; i++) {
      final value = object.excludedCategoryIds[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _buffetTierModelSerialize(
  BuffetTierModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.adultPrice);
  writer.writeDouble(offsets[1], object.childPrice);
  writer.writeString(offsets[2], object.colorHex);
  writer.writeDouble(offsets[3], object.elderlyDiscount);
  writer.writeStringList(offsets[4], object.excludedCategoryIds);
  writer.writeBool(offsets[5], object.isActive);
  writer.writeString(offsets[6], object.name);
  writer.writeLong(offsets[7], object.sortOrder);
  writer.writeLong(offsets[8], object.timeLimitMinutes);
}

BuffetTierModel _buffetTierModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BuffetTierModel();
  object.adultPrice = reader.readDouble(offsets[0]);
  object.childPrice = reader.readDouble(offsets[1]);
  object.colorHex = reader.readStringOrNull(offsets[2]);
  object.elderlyDiscount = reader.readDouble(offsets[3]);
  object.excludedCategoryIds = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.isActive = reader.readBool(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.sortOrder = reader.readLong(offsets[7]);
  object.timeLimitMinutes = reader.readLongOrNull(offsets[8]);
  return object;
}

P _buffetTierModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _buffetTierModelGetId(BuffetTierModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _buffetTierModelGetLinks(BuffetTierModel object) {
  return [];
}

void _buffetTierModelAttach(
    IsarCollection<dynamic> col, Id id, BuffetTierModel object) {
  object.id = id;
}

extension BuffetTierModelByIndex on IsarCollection<BuffetTierModel> {
  Future<BuffetTierModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  BuffetTierModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<BuffetTierModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<BuffetTierModel?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(BuffetTierModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(BuffetTierModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<BuffetTierModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<BuffetTierModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension BuffetTierModelQueryWhereSort
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QWhere> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhere> anySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'sortOrder'),
      );
    });
  }
}

extension BuffetTierModelQueryWhere
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QWhereClause> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      sortOrderEqualTo(int sortOrder) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'sortOrder',
        value: [sortOrder],
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      sortOrderNotEqualTo(int sortOrder) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOrder',
              lower: [],
              upper: [sortOrder],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOrder',
              lower: [sortOrder],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOrder',
              lower: [sortOrder],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'sortOrder',
              lower: [],
              upper: [sortOrder],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      sortOrderGreaterThan(
    int sortOrder, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOrder',
        lower: [sortOrder],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      sortOrderLessThan(
    int sortOrder, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOrder',
        lower: [],
        upper: [sortOrder],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterWhereClause>
      sortOrderBetween(
    int lowerSortOrder,
    int upperSortOrder, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'sortOrder',
        lower: [lowerSortOrder],
        includeLower: includeLower,
        upper: [upperSortOrder],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BuffetTierModelQueryFilter
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QFilterCondition> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      adultPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      adultPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      adultPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adultPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      adultPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adultPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      childPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'childPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      childPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'childPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      childPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'childPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      childPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'childPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'colorHex',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'colorHex',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'colorHex',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'colorHex',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      colorHexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'colorHex',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      elderlyDiscountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'elderlyDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      elderlyDiscountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'elderlyDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      elderlyDiscountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'elderlyDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      elderlyDiscountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'elderlyDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'excludedCategoryIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'excludedCategoryIds',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'excludedCategoryIds',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludedCategoryIds',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'excludedCategoryIds',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      excludedCategoryIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'excludedCategoryIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isActive',
        value: value,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      sortOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      timeLimitMinutesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeLimitMinutes',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      timeLimitMinutesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeLimitMinutes',
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
      timeLimitMinutesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeLimitMinutes',
        value: value,
      ));
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterFilterCondition>
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
}

extension BuffetTierModelQueryObject
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QFilterCondition> {}

extension BuffetTierModelQueryLinks
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QFilterCondition> {}

extension BuffetTierModelQuerySortBy
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QSortBy> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultPrice', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByAdultPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultPrice', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childPrice', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByChildPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childPrice', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByElderlyDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyDiscount', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByElderlyDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyDiscount', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      sortByTimeLimitMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.desc);
    });
  }
}

extension BuffetTierModelQuerySortThenBy
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QSortThenBy> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultPrice', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByAdultPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultPrice', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childPrice', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByChildPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'childPrice', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByColorHex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByColorHexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorHex', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByElderlyDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyDiscount', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByElderlyDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elderlyDiscount', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenBySortOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sortOrder', Sort.desc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.asc);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QAfterSortBy>
      thenByTimeLimitMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeLimitMinutes', Sort.desc);
    });
  }
}

extension BuffetTierModelQueryWhereDistinct
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct> {
  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByAdultPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adultPrice');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByChildPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'childPrice');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct> distinctByColorHex(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorHex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByElderlyDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elderlyDiscount');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByExcludedCategoryIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'excludedCategoryIds');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctBySortOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sortOrder');
    });
  }

  QueryBuilder<BuffetTierModel, BuffetTierModel, QDistinct>
      distinctByTimeLimitMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeLimitMinutes');
    });
  }
}

extension BuffetTierModelQueryProperty
    on QueryBuilder<BuffetTierModel, BuffetTierModel, QQueryProperty> {
  QueryBuilder<BuffetTierModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BuffetTierModel, double, QQueryOperations> adultPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adultPrice');
    });
  }

  QueryBuilder<BuffetTierModel, double, QQueryOperations> childPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'childPrice');
    });
  }

  QueryBuilder<BuffetTierModel, String?, QQueryOperations> colorHexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorHex');
    });
  }

  QueryBuilder<BuffetTierModel, double, QQueryOperations>
      elderlyDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elderlyDiscount');
    });
  }

  QueryBuilder<BuffetTierModel, List<String>, QQueryOperations>
      excludedCategoryIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'excludedCategoryIds');
    });
  }

  QueryBuilder<BuffetTierModel, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<BuffetTierModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<BuffetTierModel, int, QQueryOperations> sortOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sortOrder');
    });
  }

  QueryBuilder<BuffetTierModel, int?, QQueryOperations>
      timeLimitMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeLimitMinutes');
    });
  }
}
