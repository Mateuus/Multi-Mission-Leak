#include "..\..\..\script_macros.hpp"
/*
	File: fn_Repaintcolor.sqf
	Author: MooN-Gaming
	Rewrite by Larry
*/
private["_index","_veh","_c_arr","_id","_i","_text"];
if(!isNull (findDisplay 2300)) then {
	_index = lbCurSel 2302;
	lbClear 2303;
	_veh = lbData[2302,_index];
	_c_arr = M_CONFIG(getArray,CONFIG_LIFE_VEHICLES,_veh,"textures");

	_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};

	for "_i" from 0 to (count _c_arr)-1 do {
		if((_c_arr select _i) select 1 == _id) then {
			_text = SEL(_i,0);

			lbAdd[2303,format["%1",_text]];
			lbSetValue [2303,(lbSize 2303)-1,_i];
		};
	};

	lbSetCurSel [2303,0];
	if((lbSize 2303)-1 != -1) then {
		ctrlShow[2303,true];
		ctrlShow[2305,true];
	} else {
		ctrlShow[2303,false];
		ctrlShow[2305,false];
	};
};