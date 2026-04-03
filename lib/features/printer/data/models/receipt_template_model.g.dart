// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReceiptTemplateModelCollection on Isar {
  IsarCollection<ReceiptTemplateModel> get receiptTemplateModels =>
      this.collection();
}

const ReceiptTemplateModelSchema = CollectionSchema(
  name: r'ReceiptTemplateModel',
  id: 4546998498645432677,
  properties: {
    r'fontFamily': PropertySchema(
      id: 0,
      name: r'fontFamily',
      type: IsarType.string,
    ),
    r'fontSize': PropertySchema(
      id: 1,
      name: r'fontSize',
      type: IsarType.long,
    ),
    r'footerText': PropertySchema(
      id: 2,
      name: r'footerText',
      type: IsarType.string,
    ),
    r'footerText2': PropertySchema(
      id: 3,
      name: r'footerText2',
      type: IsarType.string,
    ),
    r'isDefault': PropertySchema(
      id: 4,
      name: r'isDefault',
      type: IsarType.bool,
    ),
    r'logoPath': PropertySchema(
      id: 5,
      name: r'logoPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'paperWidth': PropertySchema(
      id: 7,
      name: r'paperWidth',
      type: IsarType.long,
    ),
    r'showCustomerInfo': PropertySchema(
      id: 8,
      name: r'showCustomerInfo',
      type: IsarType.bool,
    ),
    r'showItemSku': PropertySchema(
      id: 9,
      name: r'showItemSku',
      type: IsarType.bool,
    ),
    r'showPaymentMethod': PropertySchema(
      id: 10,
      name: r'showPaymentMethod',
      type: IsarType.bool,
    ),
    r'showQrCode': PropertySchema(
      id: 11,
      name: r'showQrCode',
      type: IsarType.bool,
    ),
    r'showTableInfo': PropertySchema(
      id: 12,
      name: r'showTableInfo',
      type: IsarType.bool,
    ),
    r'showTaxBreakdown': PropertySchema(
      id: 13,
      name: r'showTaxBreakdown',
      type: IsarType.bool,
    ),
    r'storeAddress': PropertySchema(
      id: 14,
      name: r'storeAddress',
      type: IsarType.string,
    ),
    r'storeName': PropertySchema(
      id: 15,
      name: r'storeName',
      type: IsarType.string,
    ),
    r'storePhone': PropertySchema(
      id: 16,
      name: r'storePhone',
      type: IsarType.string,
    ),
    r'taxId': PropertySchema(
      id: 17,
      name: r'taxId',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 18,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _receiptTemplateModelEstimateSize,
  serialize: _receiptTemplateModelSerialize,
  deserialize: _receiptTemplateModelDeserialize,
  deserializeProp: _receiptTemplateModelDeserializeProp,
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
  getId: _receiptTemplateModelGetId,
  getLinks: _receiptTemplateModelGetLinks,
  attach: _receiptTemplateModelAttach,
  version: '3.1.0+1',
);

int _receiptTemplateModelEstimateSize(
  ReceiptTemplateModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.fontFamily.length * 3;
  {
    final value = object.footerText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.footerText2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.storeAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storeName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.storePhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _receiptTemplateModelSerialize(
  ReceiptTemplateModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fontFamily);
  writer.writeLong(offsets[1], object.fontSize);
  writer.writeString(offsets[2], object.footerText);
  writer.writeString(offsets[3], object.footerText2);
  writer.writeBool(offsets[4], object.isDefault);
  writer.writeString(offsets[5], object.logoPath);
  writer.writeString(offsets[6], object.name);
  writer.writeLong(offsets[7], object.paperWidth);
  writer.writeBool(offsets[8], object.showCustomerInfo);
  writer.writeBool(offsets[9], object.showItemSku);
  writer.writeBool(offsets[10], object.showPaymentMethod);
  writer.writeBool(offsets[11], object.showQrCode);
  writer.writeBool(offsets[12], object.showTableInfo);
  writer.writeBool(offsets[13], object.showTaxBreakdown);
  writer.writeString(offsets[14], object.storeAddress);
  writer.writeString(offsets[15], object.storeName);
  writer.writeString(offsets[16], object.storePhone);
  writer.writeString(offsets[17], object.taxId);
  writer.writeString(offsets[18], object.type);
}

ReceiptTemplateModel _receiptTemplateModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReceiptTemplateModel();
  object.fontFamily = reader.readString(offsets[0]);
  object.fontSize = reader.readLong(offsets[1]);
  object.footerText = reader.readStringOrNull(offsets[2]);
  object.footerText2 = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.isDefault = reader.readBool(offsets[4]);
  object.logoPath = reader.readStringOrNull(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.paperWidth = reader.readLong(offsets[7]);
  object.showCustomerInfo = reader.readBool(offsets[8]);
  object.showItemSku = reader.readBool(offsets[9]);
  object.showPaymentMethod = reader.readBool(offsets[10]);
  object.showQrCode = reader.readBool(offsets[11]);
  object.showTableInfo = reader.readBool(offsets[12]);
  object.showTaxBreakdown = reader.readBool(offsets[13]);
  object.storeAddress = reader.readStringOrNull(offsets[14]);
  object.storeName = reader.readStringOrNull(offsets[15]);
  object.storePhone = reader.readStringOrNull(offsets[16]);
  object.taxId = reader.readStringOrNull(offsets[17]);
  object.type = reader.readString(offsets[18]);
  return object;
}

P _receiptTemplateModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _receiptTemplateModelGetId(ReceiptTemplateModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _receiptTemplateModelGetLinks(
    ReceiptTemplateModel object) {
  return [];
}

void _receiptTemplateModelAttach(
    IsarCollection<dynamic> col, Id id, ReceiptTemplateModel object) {
  object.id = id;
}

extension ReceiptTemplateModelByIndex on IsarCollection<ReceiptTemplateModel> {
  Future<ReceiptTemplateModel?> getByName(String name) {
    return getByIndex(r'name', [name]);
  }

  ReceiptTemplateModel? getByNameSync(String name) {
    return getByIndexSync(r'name', [name]);
  }

  Future<bool> deleteByName(String name) {
    return deleteByIndex(r'name', [name]);
  }

  bool deleteByNameSync(String name) {
    return deleteByIndexSync(r'name', [name]);
  }

  Future<List<ReceiptTemplateModel?>> getAllByName(List<String> nameValues) {
    final values = nameValues.map((e) => [e]).toList();
    return getAllByIndex(r'name', values);
  }

  List<ReceiptTemplateModel?> getAllByNameSync(List<String> nameValues) {
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

  Future<Id> putByName(ReceiptTemplateModel object) {
    return putByIndex(r'name', object);
  }

  Id putByNameSync(ReceiptTemplateModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'name', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByName(List<ReceiptTemplateModel> objects) {
    return putAllByIndex(r'name', objects);
  }

  List<Id> putAllByNameSync(List<ReceiptTemplateModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name', objects, saveLinks: saveLinks);
  }
}

extension ReceiptTemplateModelQueryWhereSort
    on QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QWhere> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReceiptTemplateModelQueryWhere
    on QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QWhereClause> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
      nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterWhereClause>
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

extension ReceiptTemplateModelQueryFilter on QueryBuilder<ReceiptTemplateModel,
    ReceiptTemplateModel, QFilterCondition> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontFamily',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      fontFamilyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fontFamily',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      fontFamilyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fontFamily',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontFamilyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fontFamily',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontSizeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontSizeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontSizeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> fontSizeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'footerText',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'footerText',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'footerText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      footerTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'footerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      footerTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'footerText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerText',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'footerText',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'footerText2',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'footerText2',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'footerText2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      footerText2Contains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'footerText2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      footerText2Matches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'footerText2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'footerText2',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> footerText2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'footerText2',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> isDefaultEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDefault',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      logoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      logoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> logoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> paperWidthEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paperWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> paperWidthGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paperWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> paperWidthLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paperWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> paperWidthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paperWidth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showCustomerInfoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showCustomerInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showItemSkuEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showItemSku',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showPaymentMethodEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showPaymentMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showQrCodeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showQrCode',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showTableInfoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showTableInfo',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> showTaxBreakdownEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showTaxBreakdown',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeAddress',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeAddress',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storeAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storeAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storeName',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storeName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'storePhone',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'storePhone',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'storePhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storePhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'storePhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      storePhoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'storePhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'storePhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> storePhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'storePhone',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxId',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxId',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      taxIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      taxIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> taxIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxId',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel,
      QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension ReceiptTemplateModelQueryObject on QueryBuilder<ReceiptTemplateModel,
    ReceiptTemplateModel, QFilterCondition> {}

extension ReceiptTemplateModelQueryLinks on QueryBuilder<ReceiptTemplateModel,
    ReceiptTemplateModel, QFilterCondition> {}

extension ReceiptTemplateModelQuerySortBy
    on QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QSortBy> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFooterText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFooterTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFooterText2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText2', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByFooterText2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText2', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByPaperWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidth', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByPaperWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidth', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowCustomerInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCustomerInfo', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowCustomerInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCustomerInfo', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowItemSku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showItemSku', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowItemSkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showItemSku', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPaymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPaymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQrCode', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQrCode', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowTableInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTableInfo', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowTableInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTableInfo', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowTaxBreakdown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTaxBreakdown', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByShowTaxBreakdownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTaxBreakdown', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStoreAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeAddress', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStoreAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeAddress', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStorePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storePhone', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByStorePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storePhone', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByTaxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByTaxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ReceiptTemplateModelQuerySortThenBy
    on QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QSortThenBy> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontFamily', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFontSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontSize', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFooterText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFooterTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFooterText2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText2', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByFooterText2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'footerText2', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByIsDefaultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDefault', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByPaperWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidth', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByPaperWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paperWidth', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowCustomerInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCustomerInfo', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowCustomerInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showCustomerInfo', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowItemSku() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showItemSku', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowItemSkuDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showItemSku', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPaymentMethod', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowPaymentMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showPaymentMethod', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQrCode', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showQrCode', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowTableInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTableInfo', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowTableInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTableInfo', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowTaxBreakdown() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTaxBreakdown', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByShowTaxBreakdownDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showTaxBreakdown', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStoreAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeAddress', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStoreAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeAddress', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStoreName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStoreNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStorePhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storePhone', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByStorePhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storePhone', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByTaxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByTaxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.desc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QAfterSortBy>
      thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ReceiptTemplateModelQueryWhereDistinct
    on QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct> {
  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByFontFamily({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontFamily', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByFontSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontSize');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByFooterText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footerText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByFooterText2({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'footerText2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByIsDefault() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDefault');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByLogoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByPaperWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paperWidth');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowCustomerInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showCustomerInfo');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowItemSku() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showItemSku');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowPaymentMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showPaymentMethod');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showQrCode');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowTableInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showTableInfo');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByShowTaxBreakdown() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showTaxBreakdown');
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByStoreAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByStoreName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByStorePhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storePhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByTaxId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptTemplateModel, ReceiptTemplateModel, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension ReceiptTemplateModelQueryProperty on QueryBuilder<
    ReceiptTemplateModel, ReceiptTemplateModel, QQueryProperty> {
  QueryBuilder<ReceiptTemplateModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String, QQueryOperations>
      fontFamilyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontFamily');
    });
  }

  QueryBuilder<ReceiptTemplateModel, int, QQueryOperations> fontSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontSize');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      footerTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footerText');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      footerText2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'footerText2');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      isDefaultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDefault');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      logoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoPath');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ReceiptTemplateModel, int, QQueryOperations>
      paperWidthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paperWidth');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showCustomerInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showCustomerInfo');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showItemSkuProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showItemSku');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showPaymentMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showPaymentMethod');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showQrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showQrCode');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showTableInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showTableInfo');
    });
  }

  QueryBuilder<ReceiptTemplateModel, bool, QQueryOperations>
      showTaxBreakdownProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showTaxBreakdown');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      storeAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeAddress');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      storeNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeName');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      storePhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storePhone');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String?, QQueryOperations>
      taxIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxId');
    });
  }

  QueryBuilder<ReceiptTemplateModel, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
