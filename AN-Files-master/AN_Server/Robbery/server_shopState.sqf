private["_shop","_robber","_action","_state"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]];
_action = param [2];
_state = param [3,-1,[0]];
if(isNull _shop) exitWith {};

switch (_state) do {
case -1: {
_shop setVariable["locked",true,true];
[_shop,_robber,_action,-1] remoteExecCall ["life_fnc_kaguxadetapr",-2];
};
case 0: {
_shop setVariable["rip",false,true];
[1800,AN_server_garageRobberyThread,[_shop,_robbery,_action],false] call AN_server_threadAdd;
};
};