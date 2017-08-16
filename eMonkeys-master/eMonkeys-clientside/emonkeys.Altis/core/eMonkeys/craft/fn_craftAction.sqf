/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: DerOnkel | e-monkeys.com / avanix-gaming.de

	Description:
	Master handling for crafting an item.
*/
private["_dialog","_item","_itemInfo","_colorIndex","_oldItem","_newItem","_upp","_itemName","_ui","_progress","_pgText","_cP","_allMaterial","_matsNeed","_invSize","_handledItem","_itemFilter","_backpackOldItems","_weight","_craftingzones","_spawnPoint","_craftPoints"];

disableSerialization;
if (eM_craft) exitWith {hint "Der Vorgang ist noch nicht abgeschlossen"};
_dialog = findDisplay 666;
if((lbCurSel 669) == -1) exitWith {hint "Du musst erst etwas auswählen!";};
_item = lbData[669,(lbCurSel 669)];
_allMaterial = true;
_itemFilter = lbData[673,(lbCurSel 673)];
_weight = ([_item] call Emonkeys_fnc_itemWeight);
_craftingzones = ["crafting_spawn_1","crafting_spawn_2","crafting_tut_spawn_1"];
_spawnPoint = "";
_spawnPointready = true;
_craftPoints = getPos player nearestObject "Land_HelipadSquare_F";

_matsNeed = 0;

_config = [_itemFilter] call Emonkeys_fnc_craftCfg;
{

	if(_item == _x select 0)then
	{
		if(_itemFilter == "vehicle") then {
		
		_colorIndex = (_x select 2);
		
		};
	
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

			_str = [_matsNeed select _i] call Emonkeys_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;

			if((missionNamespace getVariable (_matsNeed select _i)) < _matsNum) exitWith {_allMaterial = false;};

		};
	};
} foreach (_config select 1);

if(!_allMaterial) exitWith {hint "Du hast noch nicht genug davon!";};

if(typeName _craftingzones == typeName []) then 
{
	{ if (player distance (getMarkerPos _x) <= 30) then {_spawnPoint = _x}; }foreach _craftingzones; //näheste Craftingzone
	
	if(count(nearestObjects[(getMarkerPos _spawnPoint),["Car","Ship","Air"],5]) > 0) exitWith {_spawnPointready = false}; //Fahrzeug auf der Craftingzone?
};

//Some checks
if((count _matsNeed) == 0) exitWith {};

if(_itemFilter == "backpack" && backpack player != "") exitWith{
		hint "Du hast bereit einen Rucksack! Pack den alten erstmal weg.";
};

if(_itemFilter == "veste" && vest player != "") exitWith{
		hint "Du hast bereits was an! Mach dich nackt und versuche es nochmal.";
};

if(_itemFilter == "uniform" && uniform player != "") exitWith{
		hint "Du hast bereits was an! Mach dich nackt und versuche es nochmal.";
};

if(_itemFilter == "head" && headgear player != "") exitWith{
		hint "Du hast bereits was an! Mach dich nackt und versuche es nochmal.";
};

if(_itemFilter == "item" && (Emonkeys_carryWeight + _weight) > Emonkeys_maxWeight) exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "weapon" && ((currentWeapon player != "" && (_item != "launch_RPG32_F")) || (_item == "launch_RPG32_F" && secondaryWeapon player != ""))) exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "magazine" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand.";
};

if(_itemFilter == "attachments" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand. ";
};

if(_itemFilter == "zubehoer" && !(player canAdd _item) || currentMagazine player != "") exitWith {
	hint "Du kannst das so nicht bauen! Vielleicht bist du schon voll, oder hast eine Waffe in der Hand. ";
};

if (_itemFilter == "vehicle" && !EMonkeys_PlayerInTutorial && (_spawnPoint == "crafting_tut_spawn_1")) exitWith {
	hint "Dies ist eine Craftingzone ausschließlich für Personen im Tutorial!";
};

if (_itemFilter == "vehicle" && ( { player distance (getMarkerPos _x) < 30 } count _craftingzones ) < 1) exitWith {
	hint "Du bist nicht in der Nähe einer Craftingzone!";
};

if (_itemFilter == "vehicle" && !_spawnPointready && !EMonkeys_PlayerInTutorial) exitWith {
	hint "Da steht schon ein Fahrzeug auf der Craftingzone!";
};

_oldItem = _matsNeed;
_newItem = _item;

if(_itemFilter == "item") then{
	_itemName = [_newItem] call Emonkeys_fnc_varToStr;
} else {
	_itemInfo = [_newItem] call Emonkeys_fnc_fetchCfgDetails;
	_itemName = _itemInfo select 1;
};

_upp = format["Stelle %1 her...",_itemName];
closeDialog 0;

//Setup our progress bar.
5 cutRsc ["Emonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "Emonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.08;
eM_craft = true;
if (EMonkeys_PlayerInTutorial) then {playSound "Tutorial9"};
["AinvPknlMstpsnonWnonDnon_medic_1",1.5] execFSM "core\fsm\moveLoop.fsm";
while{true} do
{
	if(animationState player == "AinvPknlMstpsnonWnonDnon_medic_1") then
	{
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	};
	if(_cP >= 1) exitWith {};
	if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(player != vehicle player) exitWith {};
	if(eM_interrupted) exitWith {};
	uisleep 0.195;
};
EMonkeys_ExitMoveLoop = true;
player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
_removeItemSuccess = true;
_invSize = count _oldItem;
for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {

	_handledItem = [_oldItem select _i,1] call Emonkeys_fnc_varHandle;
	if(!([false,_handledItem,_oldItem select _i+1] call Emonkeys_fnc_handleInv)) exitWith {_removeItemSuccess = false;};
};
if(!_removeItemSuccess) exitWith {5 cutText ["","PLAIN"]; eM_is_processing = false;};
[] call Emonkeys_fnc_p_updateMenu;

eM_is_processing = true;

while{true} do
{
	uisleep  0.3;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
};

if(_itemFilter == "backpack") then{
	if(backpack player == "") then{
		player addBackpack _newItem;
	}else{
		hint "Du hast bereit einen Rucksack! Pack den alten erstmal weg.";
		eM_is_processing = false;
	};
};

if(_itemFilter == "item") then{
	_handledItem = [_newItem,1] call Emonkeys_fnc_varHandle;
	[true,_handledItem,1] call Emonkeys_fnc_handleInv;
};

if(_itemFilter == "uniform") then{
	if(uniform player == "") then{
		player forceAddUniform _newItem;
	}else{
		hint "Du hast bereits was an! Mach dich nackt und versuch es nochmal.";
		eM_is_processing = false;
	};
};
if(_itemFilter == "head") then{
	if(headgear player == "") then{
		player addHeadgear _newItem;
	}else{
		hint "Du hast bereits was an! Mach dich nackt und versuch es nochmal.";
		eM_is_processing = false;
	};
};

if(_itemFilter == "veste") then{
	if(vest player == "") then{
		player addVest _newItem;
	}else{
		hint "Du hast bereits was an! Mach dich nackt und versuch es nochmal.";
		eM_is_processing = false;
	};
};

if(_itemFilter == "weapon") then{

	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(((currentWeapon player == "" && (_newItem != "launch_RPG32_F")) || (_newItem == "launch_RPG32_F" && secondaryWeapon player == ""))) then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call Emonkeys_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call Emonkeys_fnc_handleInv;
			};
			eM_is_processing = false;
		};
	};
};

if(_itemFilter == "magazine") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call Emonkeys_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call Emonkeys_fnc_handleInv;
			};
			eM_is_processing = false;
		};
	};
};

if(_itemFilter == "attachments") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call Emonkeys_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call Emonkeys_fnc_handleInv;
			};
			eM_is_processing = false;
		};
	};
};

if(_itemFilter == "zubehoer") then{
	if(player canAdd _newItem) then{
		player addItem _newItem;
	} else {
		if(currentWeapon player == "") then{
			player addWeapon _newItem;
		}else{
			5 cutText ["","PLAIN"];
			for [{_i=0},{_i<_invSize-1},{_i=_i+2}] do {
				_handledItem = [_oldItem select _i,1] call Emonkeys_fnc_varHandle;
				[true,_handledItem,_oldItem select _i+1] call Emonkeys_fnc_handleInv;
			};
			eM_is_processing = false;
		};
	};
};

if(_itemFilter == "vehicle" && EMonkeys_PlayerInTutorial) then 
{
	0 cutText ["","BLACK OUT",2];
	0 cutFadeOut 9999999;
	uisleep ((round random 3) + 3);
	["",["Einen Moment...","dein Fahrzeug wird gerade vorbereitet..."],"","#81c800",5] call EMonkeys_fnc_specialText;
	_spawnPointTutorial = [[3284.07,12486.8,0],[3269.48,12483.1,0],[3254.38,12479.8,0],[3249.6,12467,0]];
	{ if(count(nearestObjects[_x,["Car","Ship","Air"],10]) == 0) exitWith {_spawnPoint = _x}; }foreach _spawnPointTutorial;

    _vehicle = createVehicle [_newItem, _spawnPoint, [], 0, "NONE"];
	_vehicle lock 2;
	_colorIndex = [_newItem] call EMonkeys_fnc_vehicleColorCraftCfg;
	_vehicle setVectorUp (surfaceNormal _spawnPoint);
	_vehicle setDir 255.504;
	_vehicle setPos _spawnPoint;
	[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call Emonkeys_fnc_mp;
	[[_vehicle,_colorIndex],"Emonkeys_fnc_colorVehicle",true,false] call Emonkeys_fnc_mp;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle setVariable["vehicle_info_gps",[],true];
	_vehicle setVariable["vehicle_fueled",false,true];
	_vehicle setVariable["fueling",false,true];
	EMonkeys_vehic164 pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call Emonkeys_fnc_MP;
	[_vehicle] call EMonkeys_fnc_clearVehicleAmmo;
	player moveInDriver _vehicle;
	_vehicle engineOn true;

	eM_TutorialVehicle = true;
}
else
{
    _vehicle = createVehicle [_newItem, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	_vehicle setFuel 0;
	_vehicle lock 2;
	_colorIndex = [_newItem] call EMonkeys_fnc_vehicleColorCraftCfg;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] call Emonkeys_fnc_mp;
	[[_vehicle,_colorIndex],"Emonkeys_fnc_colorVehicle",true,false] call Emonkeys_fnc_mp;
	_vehicle setVariable["trunk_in_use",false,true];
	_vehicle setVariable["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
	_vehicle setVariable["vehicle_info_gps",[],true];
	_vehicle setVariable["vehicle_fueled",false,true];
	_vehicle setVariable["fueling",false,true];
	EMonkeys_vehic164 pushBack _vehicle;
	[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] call Emonkeys_fnc_MP;

	_vehicle setHitPointDamage ["HitLFWheel", 1];   _vehicle setHitPointDamage ["HitRFWheel", 1];   
	_vehicle setHitPointDamage ["HitLF2Wheel", 1];	_vehicle setHitPointDamage ["HitRF2Wheel", 1];
	_vehicle setHitPointDamage ["HitEngine", 1];	_vehicle setHitPointDamage ["HitBody", 1];
	[_vehicle] call EMonkeys_fnc_clearVehicleAmmo;
};

eM_craft = false;
5 cutText ["","PLAIN"];
titleText[format["Du hast folgendes hergestellt: %1",_itemName],"PLAIN"];
eM_leveladd = [_itemFilter,"crafting"];
eM_is_processing = false;