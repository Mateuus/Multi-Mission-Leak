
#include <macro.h>
 private["_end","_pvnwgmqhelitoehpmroetkrwfcfwbmagmeljipyihriaikfjkptkgvqtwfsikmi"]; player addRating 99999999; waitUntil {!(isNull (findDisplay 46))};  if((FETCH_CONST(life_medicLevel)) < 1) exitWith { 	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission; 	sleep 35; };  _pvnwgmqhelitoehpmroetkrwfcfwbmagmeljipyihriaikfjkptkgvqtwfsikmi = ((life_adminJail > 0) OR (life_adminJail == -1));  if(_pvnwgmqhelitoehpmroetkrwfcfwbmagmeljipyihriaikfjkptkgvqtwfsikmi) then { 	[player,true,life_adminJail,true,true] call life_fnc_jail; 	[10] call SOCK_fnc_ddjmbrftntgdwpptfaoymlxkcjyscjwhklmcfylqhrqrxtxznnh; } else { 	[] call life_fnc_ahlahrugiqknetuumakyonsqyothaelchcsczkdkarivhpuegwjdsgr; 	waitUntil{!isNull (findDisplay 38500)};  	waitUntil{isNull (findDisplay 38500)};  };  [] call life_fnc_initGang; 