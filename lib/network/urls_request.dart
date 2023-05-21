import 'package:dio/dio.dart';
import 'package:flutter_assistant_package/data/model/auth_type_model.dart';
import 'package:flutter_assistant_package/data/model/badge_model.dart';
import 'package:flutter_assistant_package/data/model/card_model.dart';
import 'package:flutter_assistant_package/data/model/cms_model.dart';
import 'package:flutter_assistant_package/data/model/comment_model.dart';
import 'package:flutter_assistant_package/data/model/coupon_model.dart';
import 'package:flutter_assistant_package/data/model/gift_model.dart';
import 'package:flutter_assistant_package/data/model/otp_model.dart';
import 'package:flutter_assistant_package/data/model/product/product_chapters_model.dart';
import 'package:flutter_assistant_package/data/model/product/product_search_model.dart';
import 'package:flutter_assistant_package/data/model/product/product_sort_model.dart';
import 'package:flutter_assistant_package/data/model/register_model.dart';
import 'package:flutter_assistant_package/data/model/survey_model.dart';
import 'package:flutter_assistant_package/data/model/terms_model.dart';
import 'package:flutter_assistant_package/data/model/user_me_model.dart';

import 'package:retrofit/retrofit.dart';

part 'urls_request.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("auth/methods")
  Future<HttpResponse<AuthTypeModel>> authType();

  @GET("user/me")
  Future<HttpResponse<UserMeModel>> userMe();

  @POST("auth/login")
  Future<HttpResponse<RegisterModel>> login(@Body() Map<String, dynamic> map);

  @POST("auth/register")
  Future<HttpResponse<RegisterModel>> register(@Body() Map<String, dynamic> map);

  @POST("auth/verify-otp")
  Future<HttpResponse<OTPModel>> verifyOTP(@Body() Map<String, dynamic> map);

  @GET("lms/product/{product:id}/items")
  Future<HttpResponse<ProductSearchModel>> getProductItems(@Path("product:id") String productID);

  @GET("lms/product/search")
  Future<HttpResponse<ProductSearchModel>> searchProducts();

  @GET("lms/product/{product:id}/chapters")
  Future<HttpResponse<ProductchaptersModel>> getProductsChapter(@Path("product:id") String productID);

  @GET("lms/product/super-types")
  Future<HttpResponse<ProductSearchModel>> getProductSuperTypes();

  @GET("lms/product/{product:id}/sort")
  Future<HttpResponse<ProductSortModel>> sortProductItems(@Path("product:id") String productID);

  @GET("lms/product/search-chapters")
  Future<HttpResponse<ProductSearchModel>> searchThroughAllChapters();

  @GET("cms/{id}")
  Future<HttpResponse<CMSModel>> getCms(@Path('id') idOrSlug, @Query('with') List<Map<String, dynamic>> byWith);

  @GET("cms")
  Future<HttpResponse<CMSModel>> listCms(
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('per_page') int perPage,
    @Query('order_by') String orderBy,
  );

  @GET("cms")
  Future<HttpResponse<CMSModel>> searchCms(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );

  @PUT("cms/{postId}/signal")
  Future<HttpResponse<CMSModel>> signalCms(
    @Path('postId') int postId,
    @Query('type') String type,
    @Query('value') String myValue,
  );

  @GET("comment")
  Future<HttpResponse<CommentModel>> getComments(
    @Query('entity_type') String type,
    @Query('entity_id') int id,
    @Query('per_page') int perPage,
  );

  @GET("badge/{id}")
  Future<HttpResponse<BadgeModel>> getBadge(@Path('id') idOrSlug, @Query('with') List<Map<String, dynamic>> byWith);

  @GET("badge")
  Future<HttpResponse<BadgeModel>> listBadge(
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('per_page') int perPage,
    @Query('order_by') String orderBy,
  );

  @GET("badge")
  Future<HttpResponse<BadgeModel>> searchBadge(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );

  @GET("gift/{id}")
  Future<HttpResponse<GiftModel>> getGift(@Path('id') idOrSlug, @Query('with') List<Map<String, dynamic>> byWith);

  @GET("gift")
  Future<HttpResponse<GiftModel>> listGift(
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('per_page') int perPage,
    @Query('order_by') String orderBy,
  );

  @GET("gift")
  Future<HttpResponse<GiftModel>> searchGift(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );

  @GET("coupon/{id}")
  Future<HttpResponse<CouponModel>> getCoupon(@Path('id') idOrSlug, @Query('with') List<Map<String, dynamic>> byWith);

  @GET("coupon")
  Future<HttpResponse<CouponModel>> listCoupon(
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('per_page') int perPage,
    @Query('order_by') String orderBy,
  );

  @GET("coupon")
  Future<HttpResponse<CouponModel>> searchCoupon(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("term/")
  Future<HttpResponse<TermsModel>> getTerm(
    @Query('with') List<Map<String, dynamic>> byWith,
  );
  @GET("term/")
  Future<HttpResponse<TermsModel>> termList(
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('order_by') String orderBy,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("term/")
  Future<HttpResponse<TermsModel>> termSearch(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("survey/")
  Future<HttpResponse<SurveyModel>> getSurvey(
    @Query('with') List<Map<String, dynamic>> byWith,
  );
  @GET("survey/")
  Future<HttpResponse<SurveyModel>> surveyList(
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('order_by') String orderBy,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("survey/")
  Future<HttpResponse<SurveyModel>> searchSurvey(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("enrollment/")
  Future<HttpResponse<CouponModel>> getEnrollment(
    @Query('with') List<Map<String, dynamic>> byWith,
  );
  @GET("enrollment/")
  Future<HttpResponse<CouponModel>> enrollmentList(
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('order_by') String orderBy,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("enrollment/")
  Future<HttpResponse<CouponModel>> enrollmentSearch(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("cart/")
  Future<HttpResponse<CardModel>> getCart(
    @Query('with') List<Map<String, dynamic>> byWith,
  );
  @GET("cart/")
  Future<HttpResponse<CardModel>> cartList(
    @Query('filter') List<Map<String, dynamic>> keyValues,
    @Query('order_by') String orderBy,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
  @GET("cart/")
  Future<HttpResponse<CardModel>> cartSearch(
    @Query('s') String keyword,
    @Query('columns') List<Map<String, dynamic>> columns,
    @Query('with') List<Map<String, dynamic>> byWith,
    @Query('per_page') int perPage,
  );
}
