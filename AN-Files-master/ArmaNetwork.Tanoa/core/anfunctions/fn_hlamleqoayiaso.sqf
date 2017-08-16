/*
	File: fn_pardon.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pardons the selected player.
*/
private["_display","_list","_data","_player","_target","_amount","_name"];
disableSerialization;
if((lbCurSel 1500) isEqualTo -1) exitWith {hintSilent "You must select a Contract";};
_display = findDisplay 50001;
_data = lbData[1500,(lbCurSel 1500)];
_data = call compile format["%1",_data];
if(isNil "_data") exitWith {};
if(an_bank < 200000) exitWith {hintSilent "You do not have enough money to put a down payment";};
if((player getVariable ["contractAccepted",""]) isEqualTo "") exitWith {hintSilent "You've already accepted a contract.";};
_unit = _data select 5;
if ((!alive _unit) OR {damage _unit >= 1}) exitWith {hintSilent "The player is dead. Try accepting this contract again in a few minutes.";};
_player = _data select 0;
_target = _data select 1;
_name = _data select 2;
_amount = _data select 3;
_gangName = _data select 4;
if(_target isEqualTo (getPlayerUID player)) exitWith {hintSilent "You can't select yourself as a contract!";};
if((group player getVariable ["gangName",""]) isEqualTo _gangName) exitWith {hintSilent "You can't accept a contract on a gang member!";};
hintSilent parseText format["You've accepted a contract and have been deducted a down payment. Check your map for his/her last known location, complete it before somebody else does! Your target is:<br/><br/><t color='#FF0000'>%1</t>", _name];
player setVariable["contractAccepted",_target,true];
_marker = createMarkerLocal ["mrkHitmanTarget", visiblePosition _unit];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "Mil_dot";
_marker setMarkerTextLocal format["%1", _name];
[200000,1,1] call life_fnc_sewawruk;
[2,"A Hitman has accepted your contract!"] remoteExecCall ["life_fnc_brusathusek",_unit];
