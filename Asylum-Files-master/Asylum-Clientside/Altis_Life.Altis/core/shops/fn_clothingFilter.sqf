/*
	File: fn_clothingFilter.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Functionality for filtering clothing types in the menu.
*/
disableSerialization;
private["_control","_selection","_list","_filter","_qty","_price"];
_control = _this select 0;
_selection = _this select 1;
life_clothing_filter = _selection;

if(_selection == 4) then
{
	_camDistance = -4;
	while {_camDistance < -1} do
	{
		if (!lineIntersects [ATLToASL (player modelToWorld [1,_camDistance,2]), ATLToASL (player modelToWorld [0,-.15,1.3]), player]) exitWith {};
		_camDistance = _camDistance + 0.5;
	};
	life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	life_shop_cam camSetPos (player modelToWorld [1,_camDistance,2]);
	life_shop_cam camCommit 1;
}
else
{
	_camDistance = 4;
	while {_camDistance > 1} do
	{
		if (!lineIntersects [ATLToASL (player modelToWorld [1,_camDistance,2]), ATLToASL (player modelToWorld [0,0,1]), player]) exitWith {};
		_camDistance = _camDistance - 0.5;
	};
	life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	life_shop_cam camSetPos (player modelToWorld [1,_camDistance,2]);
	life_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

//Temp code, subjected to become one master config in future
_clothes = switch (life_clothing_store) do
{
	case "bruce": {[_selection] call life_fnc_clothing_bruce;};
	case "cop": {[_selection] call life_fnc_clothing_cop;};
	case "reb": {[_selection] call life_fnc_clothing_reb;};
	case "dive": {[_selection] call life_fnc_clothing_dive;};
	case "copdive": {[_selection] call life_fnc_clothing_copdive;};
	case "kart": {[_selection] call life_fnc_clothing_kart;};
	case "barber": {[_selection] call life_fnc_clothing_barber;};
	case "faces": {[_selection] call life_fnc_clothing_faces;};
};

if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
	else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = if (life_clothing_store == "faces") then { "" }
	else { getText(configFile >> (_details select 6) >> (_x select 0) >> "picture"); };
	_list lbSetData [(lbSize _list)-1,str _x];
	_price = _x select 2;
	if (life_clothing_store == "reb" && 2 in life_gangtalents) then { _price = _price * 0.95 };
	_list lbSetValue [(lbSize _list)-1,_price];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;