class BaseModel<T> {
  T? data;
  void fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() => {};
}
