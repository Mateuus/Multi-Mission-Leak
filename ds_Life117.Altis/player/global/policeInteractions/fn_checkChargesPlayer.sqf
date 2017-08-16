/*
	File: fn_checkChargesPlayer.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Retrieves information about a players wanted level to make it easier for police jailing criminals
*/
private["_nearHQ","_unit","_cop","_uid","_crimeList","_player","_rebel","_rebelVeh","_bankRobber"];

_cop = _this select 0;
_uid = getPlayerUID player;
_player = name player;
_crimeList = [];
_bankRobber = false;
if((DSL_rebel)||(DSL_rebelAdv))then{_rebel = true;}else{_rebel = false;};
if(DSL_rebelVeh)then{_rebelVeh = true;}else{_rebelVeh = false;};
_nearHQ = false;

if((player distance (getMarkerPos "police_hq_1") < 100)||(player distance (getMarkerPos "cop_spawn_5") < 100)||(player distance (getMarkerPos "cop_spawn_3") < 100)||(player distance (getMarkerPos "police_hq_2") < 100))then
	{
	_nearHQ = true;
	};
_mcu = (nearestobjects [getPos player,["LandVehicle"], 50]) select 0;
if(!isNull _mcu)then
	{
	_nearHQ = true;
	};	
	
if(_nearHQ)exitWith
	{
	hint "You are being scanned for Identification, because your at a police HQ any false ID you may have will not work";
	systemChat "You are being scanned for Identification, because your at a police HQ any false ID you may have will not work";
	[[DS_wanted_stats,_crimeList,_player,_rebel,_rebelVeh,_bankRobber],"DS_cop_checkChargesPlayerReturn",_cop,false] spawn DS_fnc_MP;
	};

if((DS_realEstateArray select 15) == 0)then
	{
	hint "You are being scanned for your crime record, because your ID barcode is not hacked your criminal history will be shown to this officer shortly";
	systemChat "You are being scanned for crime record, because your ID barcode is not hacked your criminal history will be shown to this officer shortly";
	[[DS_wanted_stats,_crimeList,_player,_rebel,_rebelVeh,_bankRobber],"DS_cop_checkChargesPlayerReturn",_cop,false] spawn DS_fnc_MP;
	}
	else
	{
	_randomNames = ["Jason","Jason","Aaron","Adam","Bryce","Cody","Damian","Eddy","Frank","Garth","Hank","Isaac","Joey","Kieran","Lloyd","Matt","Neil","Ozzy","Peter","Quinton","Rory"];
	_random = _randomNames select (DS_realEstateArray select 15);
	hint format ["You are being scanned for criminal history, the name %1 is being returned with a clean track record",_random];
	systemchat format ["You are being scanned for criminal history, the name %1 is being returned with a clean track record",_random];
	[[[0],_crimeList,_random,false,false,false],"DS_cop_checkChargesPlayerReturn",_cop,false] spawn DS_fnc_MP;
	};

