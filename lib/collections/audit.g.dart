// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetAuditCollection on Isar {
  IsarCollection<Audit> get audits => this.collection();
}

const AuditSchema = CollectionSchema(
  name: r'Audit',
  id: -7922666049281415834,
  properties: {
    r'mealId': PropertySchema(
      id: 0,
      name: r'mealId',
      type: IsarType.long,
    ),
    r'predictedLabel': PropertySchema(
      id: 1,
      name: r'predictedLabel',
      type: IsarType.string,
    ),
    r'predictionId': PropertySchema(
      id: 2,
      name: r'predictionId',
      type: IsarType.long,
    ),
    r'userAcceptedLabel': PropertySchema(
      id: 3,
      name: r'userAcceptedLabel',
      type: IsarType.string,
    )
  },
  estimateSize: _auditEstimateSize,
  serialize: _auditSerialize,
  deserialize: _auditDeserialize,
  deserializeProp: _auditDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _auditGetId,
  getLinks: _auditGetLinks,
  attach: _auditAttach,
  version: '3.0.5',
);

int _auditEstimateSize(
  Audit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.predictedLabel.length * 3;
  bytesCount += 3 + object.userAcceptedLabel.length * 3;
  return bytesCount;
}

void _auditSerialize(
  Audit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.mealId);
  writer.writeString(offsets[1], object.predictedLabel);
  writer.writeLong(offsets[2], object.predictionId);
  writer.writeString(offsets[3], object.userAcceptedLabel);
}

Audit _auditDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Audit(
    mealId: reader.readLong(offsets[0]),
    predictedLabel: reader.readString(offsets[1]),
    predictionId: reader.readLong(offsets[2]),
    userAcceptedLabel: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _auditDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _auditGetId(Audit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _auditGetLinks(Audit object) {
  return [];
}

void _auditAttach(IsarCollection<dynamic> col, Id id, Audit object) {
  object.id = id;
}

extension AuditQueryWhereSort on QueryBuilder<Audit, Audit, QWhere> {
  QueryBuilder<Audit, Audit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AuditQueryWhere on QueryBuilder<Audit, Audit, QWhereClause> {
  QueryBuilder<Audit, Audit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Audit, Audit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Audit, Audit, QAfterWhereClause> idBetween(
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

extension AuditQueryFilter on QueryBuilder<Audit, Audit, QFilterCondition> {
  QueryBuilder<Audit, Audit, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Audit, Audit, QAfterFilterCondition> mealIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mealId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> mealIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mealId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> mealIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mealId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> mealIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mealId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'predictedLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'predictedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'predictedLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'predictedLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictedLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'predictedLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictionIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'predictionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'predictionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictionIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'predictionId',
        value: value,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> predictionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'predictionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      userAcceptedLabelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userAcceptedLabel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userAcceptedLabel',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userAcceptedLabel',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition> userAcceptedLabelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAcceptedLabel',
        value: '',
      ));
    });
  }

  QueryBuilder<Audit, Audit, QAfterFilterCondition>
      userAcceptedLabelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userAcceptedLabel',
        value: '',
      ));
    });
  }
}

extension AuditQueryObject on QueryBuilder<Audit, Audit, QFilterCondition> {}

extension AuditQueryLinks on QueryBuilder<Audit, Audit, QFilterCondition> {}

extension AuditQuerySortBy on QueryBuilder<Audit, Audit, QSortBy> {
  QueryBuilder<Audit, Audit, QAfterSortBy> sortByMealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByMealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByPredictedLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictedLabel', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByPredictedLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictedLabel', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByPredictionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictionId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByPredictionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictionId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByUserAcceptedLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAcceptedLabel', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> sortByUserAcceptedLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAcceptedLabel', Sort.desc);
    });
  }
}

extension AuditQuerySortThenBy on QueryBuilder<Audit, Audit, QSortThenBy> {
  QueryBuilder<Audit, Audit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByMealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByMealIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mealId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByPredictedLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictedLabel', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByPredictedLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictedLabel', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByPredictionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictionId', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByPredictionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'predictionId', Sort.desc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByUserAcceptedLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAcceptedLabel', Sort.asc);
    });
  }

  QueryBuilder<Audit, Audit, QAfterSortBy> thenByUserAcceptedLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAcceptedLabel', Sort.desc);
    });
  }
}

extension AuditQueryWhereDistinct on QueryBuilder<Audit, Audit, QDistinct> {
  QueryBuilder<Audit, Audit, QDistinct> distinctByMealId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mealId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByPredictedLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'predictedLabel',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByPredictionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'predictionId');
    });
  }

  QueryBuilder<Audit, Audit, QDistinct> distinctByUserAcceptedLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAcceptedLabel',
          caseSensitive: caseSensitive);
    });
  }
}

extension AuditQueryProperty on QueryBuilder<Audit, Audit, QQueryProperty> {
  QueryBuilder<Audit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Audit, int, QQueryOperations> mealIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mealId');
    });
  }

  QueryBuilder<Audit, String, QQueryOperations> predictedLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'predictedLabel');
    });
  }

  QueryBuilder<Audit, int, QQueryOperations> predictionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'predictionId');
    });
  }

  QueryBuilder<Audit, String, QQueryOperations> userAcceptedLabelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAcceptedLabel');
    });
  }
}
