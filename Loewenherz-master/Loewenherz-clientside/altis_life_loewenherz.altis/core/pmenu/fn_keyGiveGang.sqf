/*
	File: fn_keyGiveGang.sqf
	Author: Bryan "Tonic" Boardwine, Barney

	Description:
	Gives a copy of the key for the selected vehicle to the Gang Members.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid","_players"];
disableSerialization;


_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;

_sel = lbCurSel _list;
if(_sel == -1) exitWith {hint "No Data selected";};
_vehicle = _list lbData _sel;
_vehicle = lhm_vehicles select parseNumber(_vehicle);
_players = playableunits - [player];

_owners = _vehicle getVariable "vehicle_info_owners";
{
	if((group _x) == (group player) && alive _x) then {
		_uid = getPlayerUID _x;
		_index = [_uid,_owners] call TON_fnc_index;

		if(_index == -1) then {
			_owners pushBack [_uid,_x getVariable["realname",name _x]];
			[[_vehicle,_x,profileName], "TON_fnc_clientGetKey",[_x],false] call lhm_fnc_mp;
		};

	};

} foreach _players;

_vehicle setVariable["vehicle_info_owners",_owners,true];

hint "Du hast einen Gang Key verteilt";