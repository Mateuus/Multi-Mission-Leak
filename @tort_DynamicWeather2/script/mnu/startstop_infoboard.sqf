if (tort_infoboard_permanent == 0) then {
   tort_infoboard_permanent = 1;
   tort_infoboard_handle = [] execVM "\@tort_dynamicweather2\script\modules\tort_Infoboard.sqf";
} else {
   terminate tort_infoboard_handle;
   tort_infoboard_permanent = 0;
   hint "";
};