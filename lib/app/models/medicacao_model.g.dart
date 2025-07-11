// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicacao_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMedicacaoModelCollection on Isar {
  IsarCollection<MedicacaoModel> get medicacaoModels => this.collection();
}

const MedicacaoModelSchema = CollectionSchema(
  name: r'MedicacaoModel',
  id: 6359443889736211034,
  properties: {
    r'dosagem': PropertySchema(
      id: 0,
      name: r'dosagem',
      type: IsarType.string,
    ),
    r'endDate': PropertySchema(
      id: 1,
      name: r'endDate',
      type: IsarType.dateTime,
    ),
    r'estaTomando': PropertySchema(
      id: 2,
      name: r'estaTomando',
      type: IsarType.bool,
    ),
    r'horariosParaTomar': PropertySchema(
      id: 3,
      name: r'horariosParaTomar',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'startDate': PropertySchema(
      id: 5,
      name: r'startDate',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(
      id: 6,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _medicacaoModelEstimateSize,
  serialize: _medicacaoModelSerialize,
  deserialize: _medicacaoModelDeserialize,
  deserializeProp: _medicacaoModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _medicacaoModelGetId,
  getLinks: _medicacaoModelGetLinks,
  attach: _medicacaoModelAttach,
  version: '3.1.0+1',
);

int _medicacaoModelEstimateSize(
  MedicacaoModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dosagem.length * 3;
  bytesCount += 3 + object.horariosParaTomar.length * 3;
  {
    for (var i = 0; i < object.horariosParaTomar.length; i++) {
      final value = object.horariosParaTomar[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _medicacaoModelSerialize(
  MedicacaoModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.dosagem);
  writer.writeDateTime(offsets[1], object.endDate);
  writer.writeBool(offsets[2], object.estaTomando);
  writer.writeStringList(offsets[3], object.horariosParaTomar);
  writer.writeString(offsets[4], object.name);
  writer.writeDateTime(offsets[5], object.startDate);
  writer.writeLong(offsets[6], object.userId);
}

MedicacaoModel _medicacaoModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MedicacaoModel();
  object.dosagem = reader.readString(offsets[0]);
  object.endDate = reader.readDateTime(offsets[1]);
  object.estaTomando = reader.readBool(offsets[2]);
  object.horariosParaTomar = reader.readStringList(offsets[3]) ?? [];
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.startDate = reader.readDateTime(offsets[5]);
  object.userId = reader.readLong(offsets[6]);
  return object;
}

P _medicacaoModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _medicacaoModelGetId(MedicacaoModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _medicacaoModelGetLinks(MedicacaoModel object) {
  return [];
}

void _medicacaoModelAttach(
    IsarCollection<dynamic> col, Id id, MedicacaoModel object) {
  object.id = id;
}

extension MedicacaoModelQueryWhereSort
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QWhere> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MedicacaoModelQueryWhere
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QWhereClause> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterWhereClause> idBetween(
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
}

extension MedicacaoModelQueryFilter
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QFilterCondition> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dosagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dosagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dosagem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dosagem',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      dosagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dosagem',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      endDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      endDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      endDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      endDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      estaTomandoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estaTomando',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horariosParaTomar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horariosParaTomar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horariosParaTomar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horariosParaTomar',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horariosParaTomar',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      horariosParaTomarLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'horariosParaTomar',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
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

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      startDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      startDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      startDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startDate',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      startDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      userIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterFilterCondition>
      userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MedicacaoModelQueryObject
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QFilterCondition> {}

extension MedicacaoModelQueryLinks
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QFilterCondition> {}

extension MedicacaoModelQuerySortBy
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QSortBy> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByDosagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosagem', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByDosagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosagem', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByEstaTomando() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaTomando', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByEstaTomandoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaTomando', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension MedicacaoModelQuerySortThenBy
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QSortThenBy> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByDosagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosagem', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByDosagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dosagem', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByEndDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endDate', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByEstaTomando() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaTomando', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByEstaTomandoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estaTomando', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startDate', Sort.desc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QAfterSortBy>
      thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension MedicacaoModelQueryWhereDistinct
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct> {
  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct> distinctByDosagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dosagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct> distinctByEndDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endDate');
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct>
      distinctByEstaTomando() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estaTomando');
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct>
      distinctByHorariosParaTomar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horariosParaTomar');
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct>
      distinctByStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startDate');
    });
  }

  QueryBuilder<MedicacaoModel, MedicacaoModel, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension MedicacaoModelQueryProperty
    on QueryBuilder<MedicacaoModel, MedicacaoModel, QQueryProperty> {
  QueryBuilder<MedicacaoModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MedicacaoModel, String, QQueryOperations> dosagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dosagem');
    });
  }

  QueryBuilder<MedicacaoModel, DateTime, QQueryOperations> endDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endDate');
    });
  }

  QueryBuilder<MedicacaoModel, bool, QQueryOperations> estaTomandoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estaTomando');
    });
  }

  QueryBuilder<MedicacaoModel, List<String>, QQueryOperations>
      horariosParaTomarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horariosParaTomar');
    });
  }

  QueryBuilder<MedicacaoModel, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MedicacaoModel, DateTime, QQueryOperations> startDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startDate');
    });
  }

  QueryBuilder<MedicacaoModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
