class Music {
  String title;
  String image;
  String singer;
  String url;
  Music({
    required this.title,
    required this.image,
    required this.singer,
    required this.url,
  });

}

List getMusicList(){
  return [
    Music(
      title: "Bangla Gojol 1", 
      image: "https://iso.500px.com/wp-content/uploads/2016/03/stock-photo-142984111-1500x1000.jpg", 
      singer: "Loram Ispum solta", 
      url: "https://alqurans.com/files/gojol/best/Allah_Khoma_Kore_Dao_Maf_Kore_Dao-ALQURANS.COM.mp3"
    ),
    Music(
      title: "Bangla Gojol 2", 
      image: "https://i.pinimg.com/474x/da/81/7c/da817cf5515b75e901539baa90ede297.jpg", 
      singer: "Loram Ispum solta", 
      url: "https://alqurans.com/files/gojol/best/Minha_Khalaqnakum_Wafeeha_Nuaaidikum-ALQURANS.COM.mp3"
    ),
  ];
}