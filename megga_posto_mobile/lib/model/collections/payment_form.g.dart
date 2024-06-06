// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_form.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPaymentFormCollection on Isar {
  IsarCollection<PaymentForm> get paymentForms => this.collection();
}

const PaymentFormSchema = CollectionSchema(
  name: r'PaymentForm',
  id: 7088208526089160708,
  properties: {
    r'codigo': PropertySchema(
      id: 0,
      name: r'codigo',
      type: IsarType.long,
    ),
    r'descricao': PropertySchema(
      id: 1,
      name: r'descricao',
      type: IsarType.string,
    ),
    r'tipoAvista': PropertySchema(
      id: 2,
      name: r'tipoAvista',
      type: IsarType.string,
    ),
    r'tipoDocto': PropertySchema(
      id: 3,
      name: r'tipoDocto',
      type: IsarType.string,
    )
  },
  estimateSize: _paymentFormEstimateSize,
  serialize: _paymentFormSerialize,
  deserialize: _paymentFormDeserialize,
  deserializeProp: _paymentFormDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _paymentFormGetId,
  getLinks: _paymentFormGetLinks,
  attach: _paymentFormAttach,
  version: '3.1.0+1',
);

int _paymentFormEstimateSize(
  PaymentForm object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.descricao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipoAvista;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipoDocto;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _paymentFormSerialize(
  PaymentForm object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.codigo);
  writer.writeString(offsets[1], object.descricao);
  writer.writeString(offsets[2], object.tipoAvista);
  writer.writeString(offsets[3], object.tipoDocto);
}

PaymentForm _paymentFormDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PaymentForm(
    codigo: reader.readLongOrNull(offsets[0]),
    descricao: reader.readStringOrNull(offsets[1]),
    tipoAvista: reader.readStringOrNull(offsets[2]),
    tipoDocto: reader.readStringOrNull(offsets[3]),
  );
  object.id = id;
  return object;
}

P _paymentFormDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _paymentFormGetId(PaymentForm object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _paymentFormGetLinks(PaymentForm object) {
  return [];
}

void _paymentFormAttach(
    IsarCollection<dynamic> col, Id id, PaymentForm object) {
  object.id = id;
}

extension PaymentFormQueryWhereSort
    on QueryBuilder<PaymentForm, PaymentForm, QWhere> {
  QueryBuilder<PaymentForm, PaymentForm, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PaymentFormQueryWhere
    on QueryBuilder<PaymentForm, PaymentForm, QWhereClause> {
  QueryBuilder<PaymentForm, PaymentForm, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PaymentForm, PaymentForm, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterWhereClause> idBetween(
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

extension PaymentFormQueryFilter
    on QueryBuilder<PaymentForm, PaymentForm, QFilterCondition> {
  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> codigoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'codigo',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      codigoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'codigo',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> codigoEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codigo',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      codigoGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codigo',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> codigoLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codigo',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> codigoBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codigo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'descricao',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipoAvista',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipoAvista',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoAvista',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoAvista',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoAvista',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoAvista',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoAvistaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoAvista',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipoDocto',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipoDocto',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoDocto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoDocto',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoDocto',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoDocto',
        value: '',
      ));
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterFilterCondition>
      tipoDoctoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoDocto',
        value: '',
      ));
    });
  }
}

extension PaymentFormQueryObject
    on QueryBuilder<PaymentForm, PaymentForm, QFilterCondition> {}

extension PaymentFormQueryLinks
    on QueryBuilder<PaymentForm, PaymentForm, QFilterCondition> {}

extension PaymentFormQuerySortBy
    on QueryBuilder<PaymentForm, PaymentForm, QSortBy> {
  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByTipoAvista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAvista', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByTipoAvistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAvista', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByTipoDocto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocto', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> sortByTipoDoctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocto', Sort.desc);
    });
  }
}

extension PaymentFormQuerySortThenBy
    on QueryBuilder<PaymentForm, PaymentForm, QSortThenBy> {
  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByCodigoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codigo', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByDescricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByDescricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descricao', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByTipoAvista() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAvista', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByTipoAvistaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoAvista', Sort.desc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByTipoDocto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocto', Sort.asc);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QAfterSortBy> thenByTipoDoctoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoDocto', Sort.desc);
    });
  }
}

extension PaymentFormQueryWhereDistinct
    on QueryBuilder<PaymentForm, PaymentForm, QDistinct> {
  QueryBuilder<PaymentForm, PaymentForm, QDistinct> distinctByCodigo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codigo');
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QDistinct> distinctByDescricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descricao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QDistinct> distinctByTipoAvista(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoAvista', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PaymentForm, PaymentForm, QDistinct> distinctByTipoDocto(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoDocto', caseSensitive: caseSensitive);
    });
  }
}

extension PaymentFormQueryProperty
    on QueryBuilder<PaymentForm, PaymentForm, QQueryProperty> {
  QueryBuilder<PaymentForm, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PaymentForm, int?, QQueryOperations> codigoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codigo');
    });
  }

  QueryBuilder<PaymentForm, String?, QQueryOperations> descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descricao');
    });
  }

  QueryBuilder<PaymentForm, String?, QQueryOperations> tipoAvistaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoAvista');
    });
  }

  QueryBuilder<PaymentForm, String?, QQueryOperations> tipoDoctoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoDocto');
    });
  }
}
