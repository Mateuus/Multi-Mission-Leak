/*
	File: fn_wantedBounty.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Checks if the person is on the bounty list and awards the cop for killing them.
*/
private["_civ","_cop","_id","_half","_result","_queryResult","_amount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_civ = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_cop = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
_half = [_this,3,false,[false]] call BIS_fnc_param;
if(isNull _civ OR isNull _cop) exitWith {};

_result = format["wantedFetchBounty:%1",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

if(count _queryResult != 0) then
{
	_amount = _queryResult select 3;
	if(_half) then
	{
		[[((_amount) / 2),_amount],"life_fnc_bountyReceive",(owner _cop),false] spawn life_fnc_MP;
	}
		else
	{
		[[_amount,_amount],"life_fnc_bountyReceive",(owner _cop),false] spawn life_fnc_MP;
	};
};