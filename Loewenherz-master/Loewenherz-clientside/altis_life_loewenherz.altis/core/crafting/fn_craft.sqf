/*
	File: fn_craft.sqf
	Author: Barney

	Description:
	Crafts the selected Item/Vehicle


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

disableSerialization;


private ["_dialog","_craften_listbox","_benoetigt_listobx","_combo_kategorien","_craft_BTN","_need","_was_kategorie","_was_item","_what","_crafting_item","_sleepdelay","_item","_itemText","_anzahl","_benoetigte_anzahl","_upp","_ui","_progress","_pgText","_cP","_car","_weaponholder"];
if(isnull(findDisplay 1584)) exitWith {hint "Fehler: Kein Dialog? Wasch da losch!"};
if(LHM_CRAFTING) exitWith {hint "Man kann nur eine Sache zur Zeit craften!";};
LHM_CRAFTING = true;
_dialog = findDisplay 1584;

_craften_listbox = _dialog displayCtrl 1500;
_benoetigt_listobx = _dialog displayCtrl 1501;
_combo_kategorien = _dialog displayCtrl 2100;
_craft_BTN = _dialog displayCtrl 2400;
_need = false;

_was_kategorie = lbcursel _combo_kategorien;
_was_item = lbCurSel _craften_listbox;


if(_was_kategorie == -1) then {
	_was_kategorie = 0;
};

if(_was_item == -1) exitWith {hint "Du hast kein Item/Fahrzeug ausgewählt"; LHM_CRAFTING = false;};


_what = [_was_kategorie,_was_item] call lhm_fnc_crafting_config;  // CONfig NEEDED!
_crafting_item = _what select 0;
_sleepdelay = _what select 2;


{
	_item = [(_x select 0),0] call lhm_fnc_varhandle;
	_itemText = [_item] call lhm_fnc_vartostr;
	_anzahl = missionNamespace getVariable [_item,0];
	_benoetigte_anzahl = (_x select 1);
	if((_anzahl - _benoetigte_anzahl) < 0) then {
		_need = true;
	};


} foreach (_what select 1);


if(_need) exitWith {hint "Dir fehlen zum craften noch Dinge!"; LHM_CRAFTING = false;};



if(_crafting_item iskindof "Car") then {
	_upp = format["Crafting: %1",getText(configFile >> "CfgVehicles" >> _crafting_item >> "displayName")];
} else {
	_upp = format["Crafting: %1",getText(configFile >> "CfgWeapons" >> _crafting_item >> "displayName")];
};

5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};

For "_i" from 0 to 1 step 0 do
{

	sleep _sleepdelay;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3  (%1%2)...",round(_cP * 100),"%",_upp];
	// Animation Fix Test
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		 player action ["SwitchWeapon", player, player, 100];
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	 };
	 // Animation Fix Test
	if(_cP >= 1) exitWith {};

	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];

if(!alive player) exitWith {LHM_CRAFTING = false;};


{
	_item = [(_x select 0),0] call lhm_fnc_varhandle;
	_itemText = [_item] call lhm_fnc_vartostr;
	_benoetigte_anzahl = (_x select 1);
	_anzahl = missionNamespace getVariable [_item,0];
	missionNamespace setVariable [_item,(_anzahl - _benoetigte_anzahl)];

} foreach (_what select 1);

if(_crafting_item iskindof "Car") then {
	_car = _crafting_item createVehicle position player;
	clearWeaponCargoGlobal _car;
	clearMagazineCargoGlobal _car;
	clearItemCargoGlobal _car;
} else {

	_weaponholder = createVehicle ["groundWeaponHolder", position player, [], 0.5, "CAN_COLLIDE"];
	_weaponholder addWeaponCargoGlobal [_crafting_item,1];
};
LHM_CRAFTING = false;












