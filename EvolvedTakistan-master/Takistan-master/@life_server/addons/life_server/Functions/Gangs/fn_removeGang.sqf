/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_group","_groupID"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {};

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

waitUntil{!DB_Async_Active};
[format["gangRemove:%1",_groupID],2] call DB_fnc_asyncCall;

[[_group],"life_fnc_gangDisbanded",(units _group),false] call life_fnc_MP;
sleep 5;
deleteGroup _group;