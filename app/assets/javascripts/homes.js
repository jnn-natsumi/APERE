// views/homes/sample.html.erb
unction getAddress(){

  //入力した緯度・経度を取得します。
  var idoInput = document.getElementById('idoInput').value;
  var keidoInput = document.getElementById('keidoInput').value;

  //緯度・経度をLatLngクラスに変換します。
  var latLngInput = new google.maps.LatLng(idoInput, keidoInput);

  //Google Maps APIのジオコーダを使います。
  var geocoder = new google.maps.Geocoder();

  //ジオコーダのgeocodeを実行します。
  //第１引数のリクエストパラメータにlatLngプロパティを設定します。
  //第２引数はコールバック関数です。取得結果を処理します。
  geocoder.geocode(
    {
      latLng: latLngInput
    },
    function(results, status) {

      var address = "";

      if (status == google.maps.GeocoderStatus.OK) {
      //取得が成功した場合

        //住所を取得します。
        address = results[0].formatted_address;

      } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
        alert("住所が見つかりませんでした。");
      } else if (status == google.maps.GeocoderStatus.ERROR) {
        alert("サーバ接続に失敗しました。");
      } else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
        alert("リクエストが無効でした。");
      } else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
        alert("リクエストの制限回数を超えました。");
      } else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
        alert("サービスが使えない状態でした。");
      } else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
        alert("原因不明のエラーが発生しました。");
      }

      //住所の結果表示をします。
      document.getElementById('addressOutput').value = address;
    });

}


// views/homes/top.html.erb
      var mapInstance; //この変数はmap.js.erbでも使うのでタイプミスに注意
      var mk1, mk2, distance;
      const perKm = 1.60934;
      function initMap(){
        mapInstance = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 35.681236, lng: 139.767125},
        zoom: 6
        });
        // クリックイベントを追加
        mapInstance.addListener('click', function(e) {
          getClickLatLng(e.latLng, mapInstance);
        });
      }
      function getClickLatLng(lat_lng, map) {
          // // 座標を表示
          // document.getElementById('lat').textContent = lat_lng.lat();
          // document.getElementById('lng').textContent = lat_lng.lng();
          // マーカーを設置
          // ２箇所以上ピンたてできないようにif文で分岐
          if (mk1 && mk2) {
            return;
          }
          var marker = new google.maps.Marker({
            position: lat_lng,
            map: map
          });
          if (!mk1) {
            mk1 = marker;
          } else
          if (mk1 && !mk2) {
            mk2 = marker;
            distance = haversine_distance();
            document.getElementById('distance').textContent = ( parseFloat(distance) * perKm );
            middle_point = middle_distance();
            console.log(middle_point)
            getAddress()
          }
          // 座標の中心をずらす
          // http://syncer.jp/google-maps-javascript-api-matome/map/method/panTo/
          map.panTo(lat_lng);
      }
      function haversine_distance() {
          var R = 3958.8;
          var rlat1 = mk1.position.lat() * (Math.PI/180);
          var rlat2 = mk2.position.lat() * (Math.PI/180);
          var difflat = rlat2-rlat1;
          var difflon = (mk2.position.lng()-mk1.position.lng())
                      * (Math.PI/180);
          var d = 2 * R
          * Math.asin(Math.sqrt(Math.sin(difflat/2)*Math.sin(difflat/2)
          +Math.cos(rlat1)*Math.cos(rlat2)
          *Math.sin(difflon/2)*Math.sin(difflon/2)));
          return d;
        }
        function middle_distance(){
          $('#middle_lat').val((mk1.position.lat() + mk2.position.lat()) / 2)
        $('#middle_lng').val((mk1.position.lng() + mk2.position.lng()) / 2)
        // return [middle_lat, middle_lng]
        return {"lat": middle_lat, "lng": middle_lng};
        }




        function getAddress(){

        //入力した緯度・経度を取得します。
        var middle_lat = document.getElementById('middle_lat').value;
        var middle_lng = document.getElementById('middle_lng').value;

        //緯度・経度をLatLngクラスに変換します。
        var latLngInput = new google.maps.LatLng(middle_lat, middle_lng);

        //Google Maps APIのジオコーダを使います。
        var geocoder = new google.maps.Geocoder();

        //ジオコーダのgeocodeを実行します。
        //第１引数のリクエストパラメータにlatLngプロパティを設定します。
        //第２引数はコールバック関数です。取得結果を処理します。
        geocoder.geocode(
          {
            latLng: latLngInput
          },
          function(results, status) {

            var address = "";

            if (status == google.maps.GeocoderStatus.OK) {
            //取得が成功した場合

              //住所を取得します。
              address = results[0].formatted_address;

            } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
              alert("住所が見つかりませんでした。");
            } else if (status == google.maps.GeocoderStatus.ERROR) {
              alert("サーバ接続に失敗しました。");
            } else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
              alert("リクエストが無効でした。");
            } else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
              alert("リクエストの制限回数を超えました。");
            } else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
              alert("サービスが使えない状態でした。");
            } else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
              alert("原因不明のエラーが発生しました。");
            }

            //住所の結果表示をします。
            document.getElementById('addressOutput').textContent = address;
          });

        }