class Total {
  final double TotalOfTotalDue;
  final double TotalOnAccountDue;
  final double NetDue;

  Total({
    required this.TotalOfTotalDue,
    required this.TotalOnAccountDue,
    required this.NetDue,
  });
  factory Total.fromJson(Map<String, dynamic> json) {
    return Total(
      TotalOfTotalDue: json['totalOfTotalDue'],
      TotalOnAccountDue: json['totalOnAccountDue'],
      NetDue: json['netDue'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'totalOfTotalDue': TotalOfTotalDue,
      'totalOnAccountDue': TotalOnAccountDue,
      'netDue': NetDue
    };
  }
}
