#include "..\..\macros.hpp"
/*
	File: fn_vehInvSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the vehicle for illegal items.
*/
private ["_vehicle","_owners","_vehicleInfo","_list","_cpRate","_cP","_title","_displayName","_titleText","_ui","_invs","_inv","_isIllegalItem","_value","_Tax"];
_vehicle = cursorObject;
_Tax = ((100 - CopTaxValue) / 100);
_list = ["Air","Ship","LandVehicle"];
_owners = _vehicle getVariable "vehicle_info_owners";
if (isNull _vehicle || {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};
_vehicleInfo = _vehicle getVariable ["Trunk",[]];

if (count _vehicleInfo isEqualTo 0) exitWith {hint "Dieses Fahrzeug ist leer."};
DWEV_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Durchsuche das Fahrzeug....";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_cpRate = 0.0075;

while {true} do
{
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(player distance _vehicle > 13) exitWith {};
};

5 cutText ["","PLAIN"];
if(player distance _vehicle > 13) exitWith {DWEV_action_inUse = false; titleText["Du hast dich zuweit vom Fahrzeug entfernt.","PLAIN"]};
if(!alive player) exitWith {DWEV_action_inUse = false;};
DWEV_action_inUse = false;

_invs = [];
_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	
	_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
	if (_isIllegalItem isEqualTo 1 ) then
	{
		_vIndex = [_var,(sell_array)] call DWF_fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * (((sell_array) select _vIndex) select 1));
		};
	};
	//Illegal items
	if (_val > 0) then
	{
		_isIllegalItem = M_CONFIG(getNumber,"VirtualItems",_var,"illegal");
		if (_isIllegalItem isEqualTo 1 ) then
		{
			_invs pushBack [_var,_val];
			[false,_var,_val] call DWEV_fnc_handlelnv;
		};
	};
} foreach (_vehicleInfo select 0);

_inv = "";

if((count _invs > 0) && (_value >= 10000)) then
{
	{
		_displayName = M_CONFIG(getText,"VirtualItems",(_x select 0),"displayName");
		_inv = _inv + format ["%1 %2<br/>",(_x select 1),(_displayName)];
	} foreach _invs;
	
	format["Ein Fahrzeug wurde durchsucht und hatte illegale Gegenstände im Wert von %1€ geladen.",[_value] call DWEV_fnc_numberText] remoteExec ["systemChat",-2];
	format["Du hast %1€ für die Beschlagnahmung bekommen, der rest ging in die Staatskasse.",[(_value * _Tax)] call DWEV_fnc_numberText] remoteExec ["systemChat",player];
	
	dwf_cash = dwf_cash + (_value * _Tax);
	[player,(_value * (1 - _Tax)),"Fahrzeug Durchsuchung"] remoteExec ["DWF_fnc_addToStateBank",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	_vehicle setVariable["Trunk",[],true];
	[_vehicle] remoteExec ["DB_fnc_saveVehTrunk",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
}
	else
{
	_inv = "Keine illegalen Gegenstände im Fahrzeug gefunden.";
};
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Illegale Gegenstände</t></t><br/>%2<br/><br/><br/><br/>"	,(_owners select 0) select 1,_inv];