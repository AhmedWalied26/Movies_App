import 'Torrents.dart';

/// id : 78131
/// url : "https://yts.gg/movies/turning-point-2022"
/// imdb_code : "tt14641364"
/// title : "Turning Point"
/// title_english : "Turning Point"
/// title_long : "Turning Point (2022)"
/// slug : "turning-point-2022"
/// year : 2022
/// rating : 6
/// runtime : 0
/// genres : ["Thriller"]
/// summary : "A home invasion goes awry when the owner returns showing signs of an unprecedented illness. As he gradually morphs into something monstrous, the intruders desperately plot their escape."
/// description_full : "A home invasion goes awry when the owner returns showing signs of an unprecedented illness. As he gradually morphs into something monstrous, the intruders desperately plot their escape."
/// synopsis : "A home invasion goes awry when the owner returns showing signs of an unprecedented illness. As he gradually morphs into something monstrous, the intruders desperately plot their escape."
/// yt_trailer_code : "eBrsx6l7Tpk"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.gg/assets/images/movies/turning_point_2022/background.jpg"
/// background_image_original : "https://yts.gg/assets/images/movies/turning_point_2022/background.jpg"
/// small_cover_image : "https://yts.gg/assets/images/movies/turning_point_2022/small-cover.jpg"
/// medium_cover_image : "https://yts.gg/assets/images/movies/turning_point_2022/medium-cover.jpg"
/// large_cover_image : "https://yts.gg/assets/images/movies/turning_point_2022/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.gg/torrent/download/10B65F13BD925CB8E6E186B8E046FB716B357BBF","hash":"10B65F13BD925CB8E6E186B8E046FB716B357BBF","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"804.53 MB","size_bytes":843610849,"date_uploaded":"2026-08-25 11:09:13","date_uploaded_unix":1787648953},{"url":"https://yts.gg/torrent/download/F081BA2CB1937E8333EDCF77B8616307C8FD5FEA","hash":"F081BA2CB1937E8333EDCF77B8616307C8FD5FEA","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":0,"peers":0,"size":"1.61 GB","size_bytes":1728724337,"date_uploaded":"2026-08-25 12:01:39","date_uploaded_unix":1787652099}]
/// date_uploaded : "2026-08-25 11:09:13"
/// date_uploaded_unix : 1787648953

class Movies {
  Movies({
      this.id, 
      this.url, 
      this.imdbCode, 
      this.title, 
      this.titleEnglish, 
      this.titleLong, 
      this.slug, 
      this.year, 
      this.rating, 
      this.runtime, 
      this.genres, 
      this.summary, 
      this.descriptionFull, 
      this.synopsis, 
      this.ytTrailerCode, 
      this.language, 
      this.mpaRating, 
      this.backgroundImage, 
      this.backgroundImageOriginal, 
      this.smallCoverImage, 
      this.mediumCoverImage, 
      this.largeCoverImage, 
      this.state, 
      this.torrents, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  Movies.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = (json['rating'] as num ? )?.toDouble();
    runtime = json['runtime'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    synopsis = json['synopsis'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'] ?? json['large_cover_image'] ?? json['background_image'] ;
    largeCoverImage = json['large_cover_image'];
    state = json['state'];
    if (json['torrents'] != null) {
      torrents = [];
      json['torrents'].forEach((v) {
        torrents?.add(Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;
  String? synopsis;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  String? state;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    if (torrents != null) {
      map['torrents'] = torrents?.map((v) => v.toJson()).toList();
    }
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

}