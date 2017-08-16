/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_mode = _this select 0;

switch(_mode) do {

	case 0: {
		_dialog = findDisplay 2700;
		_list = _dialog displayCtrl 2701;
		_plist = _dialog displayCtrl 2702;
		
		_vehicle = _list lbData (lbCurSel _list);
		_vehicle = life_vehicles select parseNumber(_vehicle);

		_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

		_unit = _plist lbData (lbCurSel _plist);
		_unit = call compile format["%1", _unit];

		if(isNull _unit OR isNil "_unit") exitWith {hint "Keinen Spieler ausgewählt!"}; 

		_uid = getPlayerUID _unit;
		_owners = _vehicle getVariable "vehicle_info_owners";
		_index = [_uid,_owners] call SOA_fnc_index;
		if(_index == -1) then 
		{
			_owners pushBack [_uid,_unit getVariable["realname",name _unit]];
			_vehicle setVariable["vehicle_info_owners",_owners,true];
		};

		hint format["Du hast die Schlüssel zu deinem %1 vergeben.",_name];
		[_vehicle,_unit,profileName] remoteExecCall ["SOA_fnc_clientGetKey",_unit];
	};

	case 1: {
		_dialog = findDisplay 2700;
		_list = _dialog displayCtrl 2705;
		_plist = _dialog displayCtrl 2702;

		_sel = lbCurSel _list;
		_vehicle = _list lbData _sel;
		_vehicle = life_vehicles select parseNumber(_vehicle);

		_sel = lbCurSel _plist;
		_unit = _plist lbData _sel;
		_unit = call compile format["%1", _unit];
		
		if(isNull _unit OR isNil "_unit") exitWith {hint "Keinen Spieler ausgewählt!"}; 

		_uid = getPlayerUID _unit;
		_owners = _vehicle getVariable "vehicle_info_owners";
		_index = [_uid,_owners] call SOA_fnc_index;
		if(_index == -1) then 
		{
			_owners pushBack [_uid,_unit getVariable["realname",name _unit]];
			_vehicle setVariable["vehicle_info_owners",_owners,true];
		};

		hint "Du hast die Schlüssel zu deiner Immobilie vergeben.";
		[_vehicle,_unit,profileName] remoteExecCall ["SOA_fnc_clientGetKey",_unit];
	};
};