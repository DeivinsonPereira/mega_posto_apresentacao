// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dado_empresa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDadoEmpresaCollection on Isar {
  IsarCollection<DadoEmpresa> get dadoEmpresas => this.collection();
}

const DadoEmpresaSchema = CollectionSchema(
  name: r'DadoEmpresa',
  id: -3301821521985484128,
  properties: {
    r'idUsuario': PropertySchema(
      id: 0,
      name: r'idUsuario',
      type: IsarType.long,
    ),
    r'ipEmpresa': PropertySchema(
      id: 1,
      name: r'ipEmpresa',
      type: IsarType.string,
    )
  },
  estimateSize: _dadoEmpresaEstimateSize,
  serialize: _dadoEmpresaSerialize,
  deserialize: _dadoEmpresaDeserialize,
  deserializeProp: _dadoEmpresaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dadoEmpresaGetId,
  getLinks: _dadoEmpresaGetLinks,
  attach: _dadoEmpresaAttach,
  version: '3.1.0+1',
);

int _dadoEmpresaEstimateSize(
  DadoEmpresa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ipEmpresa.length * 3;
  return bytesCount;
}

void _dadoEmpresaSerialize(
  DadoEmpresa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.idUsuario);
  writer.writeString(offsets[1], object.ipEmpresa);
}

DadoEmpresa _dadoEmpresaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DadoEmpresa(
    reader.readString(offsets[1]),
    reader.readLongOrNull(offsets[0]),
  );
  object.id = id;
  return object;
}

P _dadoEmpresaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dadoEmpresaGetId(DadoEmpresa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dadoEmpresaGetLinks(DadoEmpresa object) {
  return [];
}

void _dadoEmpresaAttach(
    IsarCollection<dynamic> col, Id id, DadoEmpresa object) {
  object.id = id;
}

extension DadoEmpresaQueryWhereSort
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QWhere> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DadoEmpresaQueryWhere
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QWhereClause> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterWhereClause> idBetween(
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

extension DadoEmpresaQueryFilter
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QFilterCondition> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idUsuario',
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idUsuario',
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idUsuario',
        value: value,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      idUsuarioBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idUsuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ipEmpresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ipEmpresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ipEmpresa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ipEmpresa',
        value: '',
      ));
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterFilterCondition>
      ipEmpresaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ipEmpresa',
        value: '',
      ));
    });
  }
}

extension DadoEmpresaQueryObject
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QFilterCondition> {}

extension DadoEmpresaQueryLinks
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QFilterCondition> {}

extension DadoEmpresaQuerySortBy
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QSortBy> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> sortByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> sortByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> sortByIpEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ipEmpresa', Sort.asc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> sortByIpEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ipEmpresa', Sort.desc);
    });
  }
}

extension DadoEmpresaQuerySortThenBy
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QSortThenBy> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.asc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenByIdUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idUsuario', Sort.desc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenByIpEmpresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ipEmpresa', Sort.asc);
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QAfterSortBy> thenByIpEmpresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ipEmpresa', Sort.desc);
    });
  }
}

extension DadoEmpresaQueryWhereDistinct
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QDistinct> {
  QueryBuilder<DadoEmpresa, DadoEmpresa, QDistinct> distinctByIdUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idUsuario');
    });
  }

  QueryBuilder<DadoEmpresa, DadoEmpresa, QDistinct> distinctByIpEmpresa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ipEmpresa', caseSensitive: caseSensitive);
    });
  }
}

extension DadoEmpresaQueryProperty
    on QueryBuilder<DadoEmpresa, DadoEmpresa, QQueryProperty> {
  QueryBuilder<DadoEmpresa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DadoEmpresa, int?, QQueryOperations> idUsuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idUsuario');
    });
  }

  QueryBuilder<DadoEmpresa, String, QQueryOperations> ipEmpresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ipEmpresa');
    });
  }
}
