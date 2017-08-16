/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/

private ["_cop","_uid","_player","_rebel","_rebelVeh","_nearHQ","_mcu","_mcu2","_randomNames","_random"];

_cop = _this select 0;
_player = name player;
_uid = getPlayerUID player;
_rebel = if((DSL_rebel)||(DSL_rebelAdv))then{true}else{false};
_rebelVeh = if(DSL_rebelVeh)then{true}else{false};
_nearHQ = false;

if((player distance (getMarkerPos "cop_spawn_7") < 100)||(player distance (getMarkerPos "cop_spawn_4") < 100)||(player distance (getMarkerPos "police_hq_1") < 100)||(player distance (getMarkerPos "cop_spawn_6") < 100)||(player distance (getMarkerPos "cop_spawn_5") < 100)||(player distance (getMarkerPos "cop_spawn_3") < 100)||(player distance (getMarkerPos "police_hq_2") < 100))then {
	_nearHQ = true;
};

_mcu = (nearestObjects [player,["O_Truck_03_covered_F"],50]) select 0;
if(!isNil "_mcu")then {
	if(_mcu getVariable ["isMCU",false])then {
		_nearHQ = true;
	};
};

_mcu2 = (nearestObjects [player,["Ship"],50]) select 0;
if(!isNil "_mcu2")then {
	if(_mcu2 getVariable ["isMCUWater",false])then {
		_nearHQ = true;
	};
};

if(_nearHQ)exitWith {
	hint "You are being scanned for identification. Because your at a Police HQ any false ID you may have will not work";
	systemChat "You are being scanned for identification. Because your at a Police HQ any false ID you may have will not work";
	[DS_wanted_stats,_player,_uid,_rebel,_rebelVeh] remoteExec ["DS_cop_checkChargesPlayerReturn",_cop];
};

if(playerSide isEqualTo independent)exitWith {
	[[0],player,false,false] remoteExec ["DS_cop_checkChargesPlayerReturn",_cop];
};

if((DS_realEstateArray select 14) == 0)then {
	hint "You are being scanned for your crime record, because your ID barcode is not hacked your criminal history will be shown to this officer shortly";
	systemChat "You are being scanned for crime record, because your ID barcode is not hacked your criminal history will be shown to this officer shortly";
	[DS_wanted_stats,_player,_uid,_rebel,_rebelVeh] remoteExec ["DS_cop_checkChargesPlayerReturn",_cop];
} else {
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_random = _randomNames select (DS_realEstateArray select 14);
	hint format ["You are being scanned for criminal history, the name %1 is being returned with a clean track record",_random];
	systemchat format ["You are being scanned for criminal history, the name %1 is being returned with a clean track record",_random];
	[[0],_random,_uid,false,false] remoteExec ["DS_cop_checkChargesPlayerReturn",_cop];
};