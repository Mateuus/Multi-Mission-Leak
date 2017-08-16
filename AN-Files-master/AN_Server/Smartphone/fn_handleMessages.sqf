


private["_to"];

params [
["_target",ObjNull,[ObjNull]],
["_msg","",[""]],
["_player",ObjNull,[ObjNull]],
["_type",-1],
["_loc","",[""]]
];

switch(_type) do
{

case 0:
{
if(isNull _target) exitWith {};
_to = call compile format["%1", _target];
[_msg,name _player,0] remoteExecCall ["life_fnc_nuphecast",_to];

private["_query","_pid","_toID"];
_pid = getPlayerUID _player;
_toID = getPlayerUID _target;
_msg = [_msg] call DB_fnc_mresString;
_fromName = name _player;
_toName = name _target;
_query = format["handleMessages:%1:%2:%3:%4:%5",_pid,_toID,_msg,_fromName,_toName];
[_query,1] call DB_fnc_asyncCall;
};

case 1:
{
[_msg,name _player,1] remoteExecCall ["life_fnc_nuphecast",west];
};

case 2:
{
[_msg,name _player,2] remoteExecCall ["life_fnc_nuphecast",independent];
};

case 3:
{
[_msg,name _player,3] remoteExecCall ["life_fnc_nuphecast",east];
};

case 4:
{
[_msg,name _player,4] remoteExecCall ["life_fnc_nuphecast",-2];
};

case 5:
{
[_msg,name _player,5] remoteExecCall ["life_fnc_nuphecast",-2];
};

case 6:
{
[_msg,name _player,6] remoteExecCall ["life_fnc_nuphecast",-2];
};

case 7:
{
[_msg,name _player,7] remoteExecCall ["life_fnc_nuphecast",-2];
};

case 8:
{
[_msg,name _player,8] remoteExecCall ["life_fnc_nuphecast",west];
};
};
