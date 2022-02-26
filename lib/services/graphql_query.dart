class GraphqlQuery {
  String country () {
  return """ query {
  countries {
    code
    name
    languages {
      code
      name
    }
  }
} """;
 }

String countryWithCode (String countryCode) {
  return """{
  country(code: "$countryCode") {
    name
    native
    capital
    emoji
    currency
    languages {
      code
      name
    }
  }
} """;
 }
}