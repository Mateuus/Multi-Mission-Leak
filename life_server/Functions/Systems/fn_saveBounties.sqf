/*
    File: fn_savePlayerBounties.sqf
	Author: Kevin Webb
	Description: Saves the players wanted charges for that specific player.
*/
private["_uid","_crimes"];
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_crimes = [_this,0,[],[[]]] call BIS_fnc_param;
_crimes = [_crimes] call DB_fnc_mresArray;
_query = format["UPDATE players SET bounties='%1' WHERE playerid='%2'",_crimes,_uid];	
waitUntil{!DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;