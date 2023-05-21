class CMSModel {
  bool? success;
  String? message;
  Data? data;

  CMSModel({this.success, this.message, this.data});

  CMSModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}

class DataDetail {
  int? id;
  String? slug;
  String? type;
  int? authorId;
  String? title;
  String? content;
  String? thumbnail;
  String? seo;
  String? media;
  String? meta;
  String? properties;
  String? status;
  String? note;
  String? deadline;
  String? personaIds;
  String? createdAt;
  String? publishedAt;
  String? updatedAt;
  dynamic deletedAt;
  MainCategory? mainCategory;
  int? readingTime;
  int? commentsCount;
  List<Comments>? comments;

  DataDetail(
      {this.id,
        this.slug,
        this.type,
        this.authorId,
        this.title,
        this.content,
        this.thumbnail,
        this.seo,
        this.media,
        this.meta,
        this.properties,
        this.status,
        this.note,
        this.deadline,
        this.personaIds,
        this.createdAt,
        this.publishedAt,
        this.updatedAt,
        this.deletedAt,
        this.mainCategory,
        this.readingTime,
        this.commentsCount,
        this.comments});

  DataDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    type = json['type'];
    authorId = json['author_id'];
    title = json['title'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    seo = json['seo'];
    media = json['media'];
    meta = json['meta'];
    properties = json['properties'];
    status = json['status'];
    note = json['note'];
    deadline = json['deadline'];
    personaIds = json['persona_ids'];
    createdAt = json['created_at'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    mainCategory = json['mainCategory'] != null
        ? MainCategory.fromJson(json['mainCategory'])
        : null;
    readingTime = json['readingTime'];
    commentsCount = json['commentsCount'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
  }

}

class MainCategory {
  int? id;
  String? type;
  String? slug;
  String? nameEn;
  String? nameFa;
  dynamic? relatedKeywords;
  String? content;
  dynamic? media;
  dynamic? meta;
  dynamic? parentId;
  String? module;
  dynamic? related;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  Pivot? pivot;

  MainCategory(
      {this.id,
        this.type,
        this.slug,
        this.nameEn,
        this.nameFa,
        this.relatedKeywords,
        this.content,
        this.media,
        this.meta,
        this.parentId,
        this.module,
        this.related,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.pivot});

  MainCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    slug = json['slug'];
    nameEn = json['name_en'];
    nameFa = json['name_fa'];
    relatedKeywords = json['related_keywords'];
    content = json['content'];
    media = json['media'];
    meta = json['meta'];
    parentId = json['parent_id'];
    module = json['module'];
    related = json['related'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

}

class Pivot {
  int? entityId;
  int? termId;
  String? entityType;
  int? isMain;
  String? termType;

  Pivot(
      {this.entityId,
        this.termId,
        this.entityType,
        this.isMain,
        this.termType});

  Pivot.fromJson(Map<String, dynamic> json) {
    entityId = json['entity_id'];
    termId = json['term_id'];
    entityType = json['entity_type'];
    isMain = json['is_main'];
    termType = json['term_type'];
  }
}

class Comments {
  int? id;
  int? entityId;
  String? entityType;
  int? authorId;
  String? authorEmail;
  String? authorName;
  String? content;
  String? meta;
  String? status;
  dynamic? parentId;
  String? ip;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  List<dynamic>? children;
  String? createdAtInPersian;

  Comments(
      {this.id,
        this.entityId,
        this.entityType,
        this.authorId,
        this.authorEmail,
        this.authorName,
        this.content,
        this.meta,
        this.status,
        this.parentId,
        this.ip,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.children,
        this.createdAtInPersian});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityId = json['entity_id'];
    entityType = json['entity_type'];
    authorId = json['author_id'];
    authorEmail = json['author_email'];
    authorName = json['author_name'];
    content = json['content'];
    meta = json['meta'];
    status = json['status'];
    parentId = json['parent_id'];
    ip = json['ip'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    // if (json['children'] != null) {
    //   children = <Null>[];
    //   json['children'].forEach((v) {
    //     children!.add(dynamic.fromJson(v));
    //   });
    // }
    createdAtInPersian = json['created_at_in_persian'];
  }

}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
}
