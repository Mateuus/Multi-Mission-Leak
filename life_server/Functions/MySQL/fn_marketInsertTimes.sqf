/*
	File: fn_marketInsertTimes.sqf
	Author: Jannis "Cr41s3"
        Edited by: Lukas "Alduin86"

	Description:
	Inserts how often the item has been sold
*/

private["_shortname","_amount","_query"];

_shortname = (_this select 0);
_amount = (_this select 1);

_query = format["UPDATE resources SET selltimes=selltimes+'1%' WHERE resource='%2'",_amount,_shortname];
diag_log format["Query: %1",_query];
waitUntil{sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;