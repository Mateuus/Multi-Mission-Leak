/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for filtering clothing types in the menu.
*/
disableSerialization;
private["_control","_selection","_list","_filter"];
_control = _this select 0;
_selection = _this select 1;
EMonkeys_clothing_filter = _selection;

if(_selection == 4) then
{
	EMonkeys_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	EMonkeys_shop_cam camSetPos (player modelToWorld [1,-4,2]);
	EMonkeys_shop_cam camCommit 1;
}
	else
{
	EMonkeys_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	EMonkeys_shop_cam camSetPos (player modelToWorld [1,4,2]);
	EMonkeys_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

//Temp code, subjected to become one master config in future
_clothes = switch (EMonkeys_clothing_store) do
{
	case "bruce": {[_selection] call EMonkeys_fnc_clothing_bruce;};
	case "cop": {[_selection] call EMonkeys_fnc_clothing_cop;};
	case "reb": {[_selection] call EMonkeys_fnc_clothing_reb;};
	case "dive": {[_selection] call EMonkeys_fnc_clothing_dive;};
	case "kart": {[_selection] call EMonkeys_fnc_clothing_kart;};
	case "VIP": {[_selection] call EMonkeys_fnc_clothing_VIP;};
	case "feuerwehr": {[_selection] call EMonkeys_fnc_clothing_feuerwehr;};
	case "ap": {[_selection] call EMonkeys_fnc_clothing_ap;};
	case "gruppe": {[_selection] call EMonkeys_fnc_clothing_gruppe;};
};
 
if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call EMonkeys_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
		else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;