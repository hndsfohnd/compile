$(function() {
 
  //セレクトボックスが切り替わったら発動
  $('#estimate_country').change(function() {
 
    //選択したvalue値を変数に格納
    var val = $(this).val();
    if (val == "CA")
    $("#visa__info").text("カナダ入国にはeTAの取得が必要です。詳しくはこちら");
    else if (val == "DE" || val == "FR" || val == "ES" || val == "CH"|| val == "NL"|| val == "FI"|| val == "SE"|| val == "PT"|| val == "IT") {
      $("#visa__info").text("シェンゲン加盟国入国(ドイツ・フランス・スペイン・イタリア・スイス・オランダ等)にはパスポートの残存が90日以上必要です");
       }
       else if (val == "US") {
        $("#visa__info").text("米国入国（ハワイ含）にはESTAの取得が必要です。詳しくはこちら");
         }
         else if (val == "CN") {
          $("#visa__info").text("中国入国にはパスポートの残存が6ヶ月以上あることが望ましいです。");
           }
           else if (val == "HK") {
            $("#visa__info").text("香港入国にはパスポートの残存が1ヶ月以上＋滞在日数必要です。");
             }
             else if (val == "KR") {
              $("#visa__info").text("韓国入国にはパスポートの残存が90日数必要です。");
               }
               else if (val == "MM") {
                $("#visa__info").text("ミャンマー入国にはビザ（査証）もしくはe-VISAが必要です。詳しくはこちら");
                 }
                 else if (val == "TH") {
                  $("#visa__info").text("タイ入国にはパスポートの残存が90日以上必要です");
                   }
                   else if (val == "TW") {
                    $("#visa__info").text("台湾入国にはパスポーIN残存が90日以上必要です");
                     }
                     else if (val == "VN") {
                      $("#visa__info").text("ベトナム入国にはパスポートの残存が6ヶ月以上必要です。また前回ベトナム出国時から30日以上期間が空いている必要がございます");
                       }
                       else if (val == "IN") {
                        $("#visa__info").text("インド入国にはビザ（査証）もしくはe-VISA、もしくはアライバルビザが必要です");
                         }
                         else if (val == "AU") {
                          $("#visa__info").text("オーストラリア入国にはETASが必要です");
                           }

  });
});