private["_distance","_txtTmp","_text","_detachid","_attachType","_position","_building","_location","_isOk","_sleeptime","_worldspace","_arguments","_buildingclass","_buildingworldspace","_buildingGetDir","_buildingDirection","_dir","_heightoffset","_heightbuilding","_heightplayer"];

closeDialog 0;

_arguments = _this select 0;
_location = getPosATL player;
//_placing_Obj = nil;
_objecttocreate = _arguments;
//admindetachids = [];
_roundlocation = [round(_location select 0),round(_location select 1)];

for "_i" from 0 to 5 do {
	_distance = round (player distance _location);
	_txtTmp = format ["Object spawns in %1s - Distance: %2m", (5 - _i),_distance];
	[_txtTmp, -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

sleep 1;
};

_building = createVehicle [_objecttocreate, _location, [], 0, "CAN_COLLIDE"];
waitUntil {!isNil "_building"};
_building allowDamage false;

_building setpos _location;
player reveal _building;


[_building] execVM (lhm_adminPath + "onKeyScripts\attachObj.sqf");
/*
_posiplayer = getPosATL player;
_posibuilding = getPosATL _building;
_posiplayerx = _posiplayer select 0;
_posiplayery = _posiplayer select 1;
_posiplayerz = _posiplayer select 2;
_posibuildingx = _posibuilding select 0;
_posibuildingy = _posibuilding select 1;
_posibuildingz = _posibuilding select 2;
_distance = player distance _building;
_offsetx = [(_posibuildingx - _posiplayerx),(_posibuildingy - _posiplayery),0];
["choose an Position and place the Object!", -1, 1.2, 5, 0, 0, 11123] spawn BIS_fnc_dynamicText;

Placing_Obj = _building;
_attachType = typeOf Placing_Obj;

_text = getText (configFile >> "CfgVehicles" >> _attachType >> "displayName");
_detachid = player addaction ['<img image="addons\admin_menu\icons\detach.paa"/> <t color="#FF00FF">' + "Place " + str(_text) + '</t>', "addons\lhm_admin\moveobjects\detachObj.sqf", Placing_Obj, 98, false, true, "", ""];
admindetachids pushBack _detachid;

_building attachTo [player];
while {!isnil "Placing_Obj"} do {
	detach _building;
	_heightbuilding = getTerrainHeightASL (position _building);
	_heightplayer = getTerrainHeightASL (position player);
	_heightoffset = _heightbuilding - _heightplayer;
	_dir = direction player;
	_building setdir _dir;
	_building setPosATL  [getPosATL _building select 0,getPosATL _building select 1,0];
	_building attachTo [player];
sleep 0.5;
};

detach _building;

sleep 1;

_location = getPos _building;
_dir = getDir _building;
_pos = getPos _building;
_pos set [2,0];
_building setpos _pos;

_detachObjectworldspace = [_dir,_location];

player removeaction _detachid;
*/
[["admin",(format["%1 with UID %2 builds a non persistant Object - %3 Pos: %4",name player,getPlayerUID player,typeOf _building,_pos])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;