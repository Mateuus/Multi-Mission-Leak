

params [
["_obj",objNull,[objNull]],
["_client",objNull,[objNull]],
["_cash",false,[true]]
];
if (isNull _obj OR {isNull _client}) exitWith {};
if !(_obj getVariable ["inUse",false]) exitWith 
{
_client = owner _client;
_obj setVariable ["inUse",true,true];
if (_cash) then 
{
_obj remoteExecCall ["life_fnc_stubazeqepest",_client];
};
};
