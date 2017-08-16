/*
		fn_spenden.sqf
		Author: G00golplexian
		
		Description: Gives a donation to selected player.
*/

private["_donator","_donation","_player","_uid","_house"];

_donator = _this select 1;
_donation = _this select 3 select 0;
_house = _this select 3 select 1;
_player = _this select 3 select 2;
_uid = (_house getVariable "house_owner") select 0;
if(!([_uid] call life_fnc_isUIDActive)) exitWith {hint "Der Priester ist nicht mehr vor Ort. Bitte komm später wieder."};

[_donation,"der Kirche",1,false] remoteExecCall ["life_fnc_moneytransfer",_donator];
[_donation,name _donator,0,false] remoteExecCall ["life_fnc_moneytransfer",_player];