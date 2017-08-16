

params [
["_name","",[""]],
["_uid","",[""]],
["_owner",objNull,[objNull]]
];

try
{
if (_uid isEqualTo "") then 
{
throw "Player Error - ID Doesnt Exist";
};
if (isNull _owner) exitWith {};

private _ownerID = owner _ownerID;
private _firstArray = [];
private _secondArray = [];
private _queryTime = diag_tickTime;
format ["Player %1 (UID %2) Fetching Civ Data",_name,_uid] call AN_server_log; 
private _queryResult = [format["QueryRequest+Civilian:%1",_uid],2] call DB_fnc_asyncCall;

_firstArray pushBack (_queryResult select 0); 
private _tmp = [(_queryResult select 2)] call DB_fnc_numberSafe;
private _tmp1 = [(_queryResult select 3)] call DB_fnc_numberSafe;
_firstArray pushBack _tmp; 
_firstArray pushBack _tmp1; 
_firstArray pushBack (_queryResult select 4); 
_firstArray pushBack (_queryResult select 5); 

private _new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if (_new isEqualType "") then 
{
_new = call compile format["%1", _new];
};
_secondArray pushBack _new; 

_new = [(_queryResult select 7)] call DB_fnc_mresToArray;
if (_new isEqualType "") then 
{
_new = call compile format["%1", _new];
};
_secondArray pushBack _new;

_secondArray pushBack (_queryResult select 12);

private _new2 = [(_queryResult select 13)] call DB_fnc_mresToArray;
if ( _new2 isEqualType "") then 
{ 
_new2 = call compile format["%1",_new2];
};
_secondArray pushBack _new2;

_secondArray pushBack ([_queryResult select 8] call DB_fnc_numberSafe);
_secondArray pushBack ([_queryResult select 9] call DB_fnc_numberSafe);

private _new3 = [(_queryResult select 10)] call DB_fnc_mresToArray;
if (_new3 isEqualType "") then 
{
_new3 = call compile format["%1", _new3];
};
_secondArray pushBack _new3;

_secondArray pushBack ([_queryResult select 11] call DB_fnc_numberSafe);
_secondArray pushBack [(_queryResult select 15),(_queryResult select 16)];
_secondArray pushBack ([_queryResult select 17,1] call DB_fnc_bool);
_secondArray pushBack ([_queryResult select 14,1] call DB_fnc_bool);

private _new4 = [(_queryResult select 18)] call DB_fnc_mresToArray;
if (_new4 isEqualType "") then 
{
_new4 = call compile format["%1", _new4];
};
_secondArray pushBack _new4;
_secondArray pushBack ([_queryResult select 19,1] call DB_fnc_bool);

private _housing = missionNamespace getVariable [format ["house%1", _uid], []];

format ["Player %1 (UID %2) Received Civ Data - Time: %3",_name,_uid,(diag_tickTime - _queryTime)] call AN_server_log; 
[_firstArray, _secondArray, _housing] remoteExecCall ["life_fnc_thawu",_ownerID];
}
catch
{
diag_log _exception;
};


