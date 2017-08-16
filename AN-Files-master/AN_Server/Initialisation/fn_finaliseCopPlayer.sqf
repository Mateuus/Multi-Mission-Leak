



params [
["_name","",[""]],
["_uid","",[""]],
["_owner",objNull,[objNull]]
];

try
{
if (_name isEqualTo "" OR _uid isEqualTo "") then 
{
throw "Player Fetch Error: Info is Null";
};

if (isNull _owner) exitWith {};
format ["Player %1 (UID %2) Fetching Cop Data",_name,_uid] call AN_server_log; 
private _ownerID = owner _owner;
private _firstArray = [];
private _secondArray = [];
private _queryTime = diag_tickTime;
private _queryResult = [format["QueryRequest+West:%1",_uid],2] call DB_fnc_asyncCall;

_firstArray pushBack (_queryResult select 0); 
private _tmp = [(_queryResult select 2)] call DB_fnc_numberSafe;
private _tmp1 = [(_queryResult select 3)] call DB_fnc_numberSafe;
_firstArray pushBack _tmp; 
_firstArray pushBack _tmp1; 
_firstArray pushBack (_queryResult select 4); 
_firstArray pushBack (_queryResult select 5); 

private _copLevel = (_queryResult select 6);
if (_copLevel isEqualTo 0) then 
{
format ["Player %1 (UID %2) TSO: Not Whitelisted",_name,_uid] call AN_server_log; 
throw "TSO: Not Whitelisted";
};
_secondArray pushBack _copLevel; 
_secondArray pushBack (_queryResult select 7); 
_secondArray pushBack (_queryResult select 8); 
_secondArray pushBack (_queryResult select 9); 
_secondArray pushBack (_queryResult select 10); 

private _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
if (_new isEqualType "") then 
{
_new = call compile _new;
};
_secondArray pushBack _new; 

private _blacklisted = ([_queryResult select 12,1] call DB_fnc_bool);
if (_blacklisted) then 
{
throw "TSO: Blacklisted";
};
format ["Player %1 (UID %2) Received Cop Data - Time: %3",_name,_uid,(diag_tickTime - _queryTime)] call AN_server_log;
[_firstArray,_secondArray] remoteExecCall ["life_fnc_secru",_ownerID]; 
}
catch
{
[_exception] remoteExecCall ["life_fnc_wraruswuth",(owner _owner)];
};