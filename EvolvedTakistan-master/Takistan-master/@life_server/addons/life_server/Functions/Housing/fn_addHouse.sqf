/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;

waitUntil{!DB_Async_Active};
_query = format["housingAddHouse:%1:%2:%3:%4:%5",_uid,_housePos,[[],0],[],1];
_queryResult = [_query,2] call DB_fnc_asyncCall;
systemChat format["House ID assigned: %1",_queryResult select 0];
_house setVariable["house_id",(_queryResult select 0),true];