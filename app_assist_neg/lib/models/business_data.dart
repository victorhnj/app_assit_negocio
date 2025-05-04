class BusinessData {
  final String setor;
  final String local;
  final String publico;

  BusinessData({
    required this.setor,
    required this.local,
    required this.publico,
  });

  Map<String, String> toMap() {
    return {'setor': setor, 'local': local, 'publico': publico};
  }
}
