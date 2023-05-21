class ProductchaptersModel {
  ProductchaptersModel({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;

  ProductchaptersModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.stats,
    required this.chapters,
    required this.headings,
  });
  late final Stats stats;
  late final List<Chapters> chapters;
  late final List<Headings> headings;

  Data.fromJson(Map<String, dynamic> json) {
    stats = Stats.fromJson(json['stats']);
    chapters = List.from(json['chapters']).map((e) => Chapters.fromJson(e)).toList();
    headings = List.from(json['headings']).map((e) => Headings.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['stats'] = stats.toJson();
    _data['chapters'] = chapters.map((e) => e.toJson()).toList();
    _data['headings'] = headings.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Stats {
  Stats({
    required this.chaptersCount,
    required this.headingsCount,
  });
  late final int chaptersCount;
  late final int headingsCount;

  Stats.fromJson(Map<String, dynamic> json) {
    chaptersCount = json['chapters_count'];
    headingsCount = json['headings_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chapters_count'] = chaptersCount;
    _data['headings_count'] = headingsCount;
    return _data;
  }
}

class Chapters {
  Chapters({
    required this.title,
    required this.description,
    required this.order,
  });
  late final String title;
  late final String description;
  late final int order;

  Chapters.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['order'] = order;
    return _data;
  }
}

class Headings {
  Headings({
    required this.title,
    required this.description,
    required this.order,
  });
  late final String title;
  late final String description;
  late final int order;

  Headings.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['order'] = order;
    return _data;
  }
}
