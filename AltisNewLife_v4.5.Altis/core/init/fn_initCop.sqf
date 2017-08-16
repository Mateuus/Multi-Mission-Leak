#include <macro.h>
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	uiSleep 30;
};
if((str(player) in ["cop_1"])) then {
	if (GETC(life_coplevel) < 10) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};
if((str(player) in ["cop_2","cop_3"])) then {
	if (GETC(life_coplevel) < 7) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};
if(!(str(player) in ["cop_99"])) then {
	if((GETC(life_coplevel) == 0) && (GETC(bitch_level) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		uiSleep 35;
	};
};
player SVAR["rank",(GETC(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)}; 
//player SVAR["coplevel", GETC(life_coplevel), true];
//player SVAR["adminlevel", GETC(bitch_level), true];
illegalmarkers = ["weed_1","cocaine_1","heroin_1","opium_1","opium_p_2","ephedrineSpot","metylamineSpot","carReseller_1","Meth","Uranium1","Uranium2","Uranium3","Uranium4","Uranium5","T_a","Dealer_1","Dealer_2","Dealer_3","Dealer_4","organ","slave_trader_center","cocaine_p","heroin_p","Weed_p","opium_p_1","marche_noir","gun_3","ville_reb"];
{_x setMarkerAlphaLocal 0} forEach illegalmarkers;