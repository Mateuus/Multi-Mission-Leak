/*
	File: fn_createHideout.sqf
	Author: Blackd0g

	Description:
	create initial starting point for a gang hideout
*/

private ["_location","_objecttocreate","_text","_distance","_txtTmp","_building","_netid","_attached","_attachType","_detachid"];

closeDialog 0;

_location = getPosATL player;
_objecttocreate = "Flag_Quontrol_F";
_text = getText (configFile >> "CfgVehicles" >> _objecttocreate >> "displayName");
//admindetachids = [];

for "_i" from 0 to 5 do {
	_distance = round (player distance _location);
	_txtTmp = format ["Gang-Point spawnt in %1s - Entfernung: %2m", (5 - _i),_distance];
	[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

sleep 1;
};

_building = createVehicle [_objecttocreate, _location, [], 0, "CAN_COLLIDE"];
_building allowDamage false;

_building setpos _location;
player reveal _building;

//[_building] execVM (lhm_adminPath + "onKeyScripts\attachObj.sqf");


_netid = netid _building;

_building attachto[player,[0,5,4]];

_attached = player addaction["Detach",{detach (objectFromNetId (_this select 3)); PLACED = true; },_netid];



waitUntil {!isnil "PLACED"};

PLACED = nil;

player removeaction _attached;
/*
Placing_Obj = _building;
_attachType = typeOf Placing_Obj;

["Gang Startpunkt erstellt", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

_detachid = player addaction ['<img image="addons\admin_menu\icons\detach.paa"/> <t color="#FF00FF">' + "Detach " + str(_text) + '</t>', "addons\lhm_admin\moveobjects\detachObj.sqf", _building, 98, false, true, "", ""];
admindetachids pushBack _detachid;

_building attachTo [player];

waitUntil {isnil "Placing_Obj"};

player removeaction _detachid;
*/

[["admin",(format["%1 with UID %2 creates a Gang-Hideout Starting Point",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;