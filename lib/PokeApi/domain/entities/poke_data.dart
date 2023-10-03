// ignore_for_file: public_member_api_docs, sort_constructors_first

class PokeData {
  List<String> name;
  List<String> path;
  String nextPage;
  String previousPage;
  PokeData({
    required this.name,
    required this.path,
    required this.nextPage,
    required this.previousPage,
  });
}
