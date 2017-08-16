/* 
    File: fn_saveBounties.sqf 
 Author: Kevin Webb 
 Description: Saves the players wanted charges for that specific player. 
*/ 
private["_uid","_crimes"]; 
_uid = [_this,1,"",[""]] call BIS_fnc_param; 
_crimes = [_this,0,[],[[]]] call BIS_fnc_param; 
_query = format["UPDATE players SET bounties='%1' WHERE playerid='%2'",_crimes,_uid];  
 
_queryResult = [_query,1] call DB_fnc_asyncCall;