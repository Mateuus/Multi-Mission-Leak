/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/
private["_licenses","_civ","_name","_player"];
_civ = [_this,0,"",[""]] call BIS_fnc_param;
_licenses = [_this,1,(localize "STR_Cop_NoLicenses"),[""]] call BIS_fnc_param;
_player = [_this,2] call BIS_fnc_param;

_name = _player getVariable ["realname",name _player] ;

if(!(_name in life_bekanntschaften)) then
{
hint parseText format["hinzugefügt: %1",_name];
life_bekanntschaften set [count life_bekanntschaften,_name];
};

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2",_civ,_licenses];