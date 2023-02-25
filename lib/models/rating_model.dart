class RatingModel {
  final String rate;
  final int count;

 const RatingModel({
    required this.rate,
    required this.count,
  });

 

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'].toString(),
      count: json['count'] ,
    );
  }



}
