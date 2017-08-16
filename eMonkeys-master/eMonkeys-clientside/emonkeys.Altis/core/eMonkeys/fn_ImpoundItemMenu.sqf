/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_ImpoundItemMenu.sqf
    
    Description: Open item Impundmenu
*/
private["_boxType","_vehicle","_display","_liste","_button","_inventory","_items","_activeButton","_illegalItems"];

_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_illegalItems = getArray(missionConfigFile >> "Cfgmaster" >> "illigalItems");

if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (typeof _vehicle in _boxType) OR (_vehicle isKindOf "LandVehicle"))) exitWith {};
if(vehicle player != player) exitWith {Hint "Du kannst keine Gegenstände im Fahrzeug beschlagnahmen"};
if(player distance _vehicle > 7) exitWith {hint "Du müssen näher an das Fahrzeug ran!"};

//Dialog Progress
disableSerialization;
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNameSpace getVariable "EMonkeys_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_text = "Durchsuche Fahrzeug";
_cP = 0.01;
_dead = false;

player playMove "AinvPknlMstpSnonWnonDr_medicUp1";
while {true} do
{
	uisleep 0.2;
	_cP = _cP + 0.02;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%2%1)...","%",(_cP * 100),_text];
	if(_cP >= 1) exitWith {};
	if((!alive player) || (player getVariable["onkill",FALSE])) exitWith {_dead = true;};
};
5 cutText ["","PLAIN"];

//Dialog ImpoundMenu
if(_dead) exitWith {};
createDialog "EMonkeys_impoundmenu_item";

_display = findDisplay 38300;
_liste = _display displayCtrl 3303;
_button = _display displayCtrl 3305;
_inventory = _vehicle getVariable "Trunk";
_items = _vehicle getVariable "Trunk" select 0;
_activeButton = false;
_button ctrlEnable false;
_button ctrlSetTooltip "Nur bei Illegalen Gegenstände möglich";

//Items einfügen
{
	_var = [_x select 0,0] call EMonkeys_fnc_varHandle;
	_name = [_var] call EMonkeys_fnc_varToStr;
	_val = _x select 1;
	_item = _x select 0;
	_illegal = false;
	{
		if(_item in _x) then {
			_illegal = true;
		
		};
	}forEach _illegalItems;
	
	if(_val > 0 && !(_illegal)) then
	{
		_liste lbAdd format["%1x - %2",_val,_name];
		_liste lbSetData [(lbSize _liste)-1,_x select 0];
	};
	if(_val > 0 && _illegal) then
	{
		_index = _liste lbAdd format["%1x - %2",_val,_name];
		_liste lbSetColor [_index, [1, 0, 0, 1]];
		_liste lbSetData [(lbSize _liste)-1,_x select 0];
		_activeButton = true;
	};
}forEach _items;

//Button aktivieren
if(_activeButton) then {
	
	_button ctrlEnable true;
	_button buttonSetAction "[] spawn EMonkeys_fnc_impoundItem;";
};