if (tort_mnuMap) then {
   infoboard_on = {tort_infoboard_permanent = 1; tort_infoboard_handle = [] execVM "\@tort_dynamicweather2\script\modules\tort_Infoboard.sqf"};
   infoboard_off = {terminate tort_infoboard_handle;tort_infoboard_permanent = 0;hint "";};

   player createDiarySubject ["tort_DiaryWeatherMenu","Dynamic Weather"];
   // if (!(player diarySubjectExists "BRG_CheatMenu")) then {player createDiarySubject ["BRG_CheatMenu","Cheats!"]};
   #include "\@TORT_DYNAMICWEATHER2\script\mnu\DiaryRecord_rain.sqf"
   #include "\@TORT_DYNAMICWEATHER2\script\mnu\DiaryRecord_wind.sqf"
   #include "\@TORT_DYNAMICWEATHER2\script\mnu\DiaryRecord_fog.sqf"
   #include "\@TORT_DYNAMICWEATHER2\script\mnu\DiaryRecord_overcast.sqf"
   #include "\@TORT_DYNAMICWEATHER2\script\mnu\DiaryRecord_main.sqf"
};