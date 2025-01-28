import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:task/data/models/user_model.dart';

class ReelModel {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  String? byteAddedOn;
  String? byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? bytePlusVideoId;
  String? language;
  String? orientation;
  int? bunnyEncodingStatus;
  String? deletedAt;
  int? videoHeight;
  int? videoWidth;
  String? location;
  int? isPrivate;
  int? isHideComment;
  String? description;
  UserModel? user;
  List<String>? resolutions;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;
  String? videoAspectRatio;
  ReelModel({
    this.id,
    this.title,
    this.url,
    this.cdnUrl,
    this.thumbCdnUrl,
    this.userId,
    this.status,
    this.slug,
    this.encodeStatus,
    this.priority,
    this.categoryId,
    this.totalViews,
    this.totalLikes,
    this.totalComments,
    this.totalShare,
    this.totalWishlist,
    this.duration,
    this.byteAddedOn,
    this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.bytePlusVideoId,
    this.language,
    this.orientation,
    this.bunnyEncodingStatus,
    this.deletedAt,
    this.videoHeight,
    this.videoWidth,
    this.location,
    this.isPrivate,
    this.isHideComment,
    this.description,
    this.user,
    this.resolutions,
    this.isLiked,
    this.isWished,
    this.isFollow,
    this.videoAspectRatio,
  });

  ReelModel copyWith({
    int? id,
    String? title,
    String? url,
    String? cdnUrl,
    String? thumbCdnUrl,
    int? userId,
    String? status,
    String? slug,
    String? encodeStatus,
    int? priority,
    int? categoryId,
    int? totalViews,
    int? totalLikes,
    int? totalComments,
    int? totalShare,
    int? totalWishlist,
    int? duration,
    String? byteAddedOn,
    String? byteUpdatedOn,
    String? bunnyStreamVideoId,
    String? bytePlusVideoId,
    String? language,
    String? orientation,
    int? bunnyEncodingStatus,
    String? deletedAt,
    int? videoHeight,
    int? videoWidth,
    String? location,
    int? isPrivate,
    int? isHideComment,
    String? description,
    UserModel? user,
    List<String>? resolutions,
    bool? isLiked,
    bool? isWished,
    bool? isFollow,
    String? videoAspectRatio,
  }) {
    return ReelModel(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      cdnUrl: cdnUrl ?? this.cdnUrl,
      thumbCdnUrl: thumbCdnUrl ?? this.thumbCdnUrl,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      slug: slug ?? this.slug,
      encodeStatus: encodeStatus ?? this.encodeStatus,
      priority: priority ?? this.priority,
      categoryId: categoryId ?? this.categoryId,
      totalViews: totalViews ?? this.totalViews,
      totalLikes: totalLikes ?? this.totalLikes,
      totalComments: totalComments ?? this.totalComments,
      totalShare: totalShare ?? this.totalShare,
      totalWishlist: totalWishlist ?? this.totalWishlist,
      duration: duration ?? this.duration,
      byteAddedOn: byteAddedOn ?? this.byteAddedOn,
      byteUpdatedOn: byteUpdatedOn ?? this.byteUpdatedOn,
      bunnyStreamVideoId: bunnyStreamVideoId ?? this.bunnyStreamVideoId,
      bytePlusVideoId: bytePlusVideoId ?? this.bytePlusVideoId,
      language: language ?? this.language,
      orientation: orientation ?? this.orientation,
      bunnyEncodingStatus: bunnyEncodingStatus ?? this.bunnyEncodingStatus,
      deletedAt: deletedAt ?? this.deletedAt,
      videoHeight: videoHeight ?? this.videoHeight,
      videoWidth: videoWidth ?? this.videoWidth,
      location: location ?? this.location,
      isPrivate: isPrivate ?? this.isPrivate,
      isHideComment: isHideComment ?? this.isHideComment,
      description: description ?? this.description,
      user: user ?? this.user,
      resolutions: resolutions ?? this.resolutions,
      isLiked: isLiked ?? this.isLiked,
      isWished: isWished ?? this.isWished,
      isFollow: isFollow ?? this.isFollow,
      videoAspectRatio: videoAspectRatio ?? this.videoAspectRatio,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (title != null) {
      result.addAll({'title': title});
    }
    if (url != null) {
      result.addAll({'url': url});
    }
    if (cdnUrl != null) {
      result.addAll({'cdnUrl': cdnUrl});
    }
    if (thumbCdnUrl != null) {
      result.addAll({'thumbCdnUrl': thumbCdnUrl});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (slug != null) {
      result.addAll({'slug': slug});
    }
    if (encodeStatus != null) {
      result.addAll({'encodeStatus': encodeStatus});
    }
    if (priority != null) {
      result.addAll({'priority': priority});
    }
    if (categoryId != null) {
      result.addAll({'categoryId': categoryId});
    }
    if (totalViews != null) {
      result.addAll({'totalViews': totalViews});
    }
    if (totalLikes != null) {
      result.addAll({'totalLikes': totalLikes});
    }
    if (totalComments != null) {
      result.addAll({'totalComments': totalComments});
    }
    if (totalShare != null) {
      result.addAll({'totalShare': totalShare});
    }
    if (totalWishlist != null) {
      result.addAll({'totalWishlist': totalWishlist});
    }
    if (duration != null) {
      result.addAll({'duration': duration});
    }
    if (byteAddedOn != null) {
      result.addAll({'byteAddedOn': byteAddedOn});
    }
    if (byteUpdatedOn != null) {
      result.addAll({'byteUpdatedOn': byteUpdatedOn});
    }
    if (bunnyStreamVideoId != null) {
      result.addAll({'bunnyStreamVideoId': bunnyStreamVideoId});
    }
    if (bytePlusVideoId != null) {
      result.addAll({'bytePlusVideoId': bytePlusVideoId});
    }
    if (language != null) {
      result.addAll({'language': language});
    }
    if (orientation != null) {
      result.addAll({'orientation': orientation});
    }
    if (bunnyEncodingStatus != null) {
      result.addAll({'bunnyEncodingStatus': bunnyEncodingStatus});
    }
    if (deletedAt != null) {
      result.addAll({'deletedAt': deletedAt});
    }
    if (videoHeight != null) {
      result.addAll({'videoHeight': videoHeight});
    }
    if (videoWidth != null) {
      result.addAll({'videoWidth': videoWidth});
    }
    if (location != null) {
      result.addAll({'location': location});
    }
    if (isPrivate != null) {
      result.addAll({'isPrivate': isPrivate});
    }
    if (isHideComment != null) {
      result.addAll({'isHideComment': isHideComment});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (user != null) {
      result.addAll({'user': user!.toMap()});
    }
    if (resolutions != null) {
      result.addAll({'resolutions': resolutions});
    }
    if (isLiked != null) {
      result.addAll({'isLiked': isLiked});
    }
    if (isWished != null) {
      result.addAll({'isWished': isWished});
    }
    if (isFollow != null) {
      result.addAll({'isFollow': isFollow});
    }
    if (videoAspectRatio != null) {
      result.addAll({'videoAspectRatio': videoAspectRatio});
    }

    return result;
  }

  factory ReelModel.fromMap(Map<String, dynamic> map) {
    return ReelModel(
      id: map['id']?.toInt(),
      title: map['title'],
      url: map['url'],
      cdnUrl: map['cdn_url'],
      thumbCdnUrl: map['thumb_cdn_url'],
      userId: map['user_id']?.toInt(),
      status: map['status'],
      slug: map['slug'],
      encodeStatus: map['encode_status'],
      priority: map['priority']?.toInt(),
      categoryId: map['category_id']?.toInt(),
      totalViews: map['total_views']?.toInt(),
      totalLikes: map['total_likes']?.toInt(),
      totalComments: map['total_comments']?.toInt(),
      totalShare: map['total_share']?.toInt(),
      totalWishlist: map['total_wishlist']?.toInt(),
      duration: map['duration']?.toInt(),
      byteAddedOn: map['byte_added_on'],
      byteUpdatedOn: map['byte_updated_on'],
      bunnyStreamVideoId: map['bunny_stream_video_id'],
      bytePlusVideoId: map['byte_plus_video_id'],
      language: map['language'],
      orientation: map['orientation'],
      bunnyEncodingStatus: map['bunny_encoding_status']?.toInt(),
      deletedAt: map['deleted_at'],
      videoHeight: map['video_height']?.toInt(),
      videoWidth: map['video_width']?.toInt(),
      location: map['location'],
      isPrivate: map['is_private']?.toInt(),
      isHideComment: map['is_hide_comment']?.toInt(),
      description: map['description'],
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      resolutions: map['resolutions'] != null
          ? List<String>.from(map['resolutions'])
          : null,
      isLiked: map['is_liked'],
      isWished: map['is_wished'],
      isFollow: map['is_follow'],
      videoAspectRatio: map['video_aspect_ratio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReelModel.fromJson(String source) =>
      ReelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ByteModel(id: $id, title: $title, url: $url, cdnUrl: $cdnUrl, thumbCdnUrl: $thumbCdnUrl, userId: $userId, status: $status, slug: $slug, encodeStatus: $encodeStatus, priority: $priority, categoryId: $categoryId, totalViews: $totalViews, totalLikes: $totalLikes, totalComments: $totalComments, totalShare: $totalShare, totalWishlist: $totalWishlist, duration: $duration, byteAddedOn: $byteAddedOn, byteUpdatedOn: $byteUpdatedOn, bunnyStreamVideoId: $bunnyStreamVideoId, bytePlusVideoId: $bytePlusVideoId, language: $language, orientation: $orientation, bunnyEncodingStatus: $bunnyEncodingStatus, deletedAt: $deletedAt, videoHeight: $videoHeight, videoWidth: $videoWidth, location: $location, isPrivate: $isPrivate, isHideComment: $isHideComment, description: $description, user: $user, resolutions: $resolutions, isLiked: $isLiked, isWished: $isWished, isFollow: $isFollow, videoAspectRatio: $videoAspectRatio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReelModel &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.cdnUrl == cdnUrl &&
        other.thumbCdnUrl == thumbCdnUrl &&
        other.userId == userId &&
        other.status == status &&
        other.slug == slug &&
        other.encodeStatus == encodeStatus &&
        other.priority == priority &&
        other.categoryId == categoryId &&
        other.totalViews == totalViews &&
        other.totalLikes == totalLikes &&
        other.totalComments == totalComments &&
        other.totalShare == totalShare &&
        other.totalWishlist == totalWishlist &&
        other.duration == duration &&
        other.byteAddedOn == byteAddedOn &&
        other.byteUpdatedOn == byteUpdatedOn &&
        other.bunnyStreamVideoId == bunnyStreamVideoId &&
        other.bytePlusVideoId == bytePlusVideoId &&
        other.language == language &&
        other.orientation == orientation &&
        other.bunnyEncodingStatus == bunnyEncodingStatus &&
        other.deletedAt == deletedAt &&
        other.videoHeight == videoHeight &&
        other.videoWidth == videoWidth &&
        other.location == location &&
        other.isPrivate == isPrivate &&
        other.isHideComment == isHideComment &&
        other.description == description &&
        other.user == user &&
        listEquals(other.resolutions, resolutions) &&
        other.isLiked == isLiked &&
        other.isWished == isWished &&
        other.isFollow == isFollow &&
        other.videoAspectRatio == videoAspectRatio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        cdnUrl.hashCode ^
        thumbCdnUrl.hashCode ^
        userId.hashCode ^
        status.hashCode ^
        slug.hashCode ^
        encodeStatus.hashCode ^
        priority.hashCode ^
        categoryId.hashCode ^
        totalViews.hashCode ^
        totalLikes.hashCode ^
        totalComments.hashCode ^
        totalShare.hashCode ^
        totalWishlist.hashCode ^
        duration.hashCode ^
        byteAddedOn.hashCode ^
        byteUpdatedOn.hashCode ^
        bunnyStreamVideoId.hashCode ^
        bytePlusVideoId.hashCode ^
        language.hashCode ^
        orientation.hashCode ^
        bunnyEncodingStatus.hashCode ^
        deletedAt.hashCode ^
        videoHeight.hashCode ^
        videoWidth.hashCode ^
        location.hashCode ^
        isPrivate.hashCode ^
        isHideComment.hashCode ^
        description.hashCode ^
        user.hashCode ^
        resolutions.hashCode ^
        isLiked.hashCode ^
        isWished.hashCode ^
        isFollow.hashCode ^
        videoAspectRatio.hashCode;
  }
}
