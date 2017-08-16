/*
	Sending robbery-request to server
*/
private["_shop","_robber"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]];
_action = param [2];

if(isNull _shop OR isNull _robber) exitWith {};
if(side _robber != civilian) exitWith {hintSilent "You are better than that...!" };
if((west countSide playableUnits) < 4) exitWith {hintSilent "There needs to be at least 4 Officers on!"};
if(vehicle player != _robber) exitWith {hintSilent "Get out of your vehicle!" };
if(currentWeapon _robber isEqualTo "") exitWith {hintSilent "What you going to rob me with? Your one inch dick? Get the fuck out of here!! *Fires shot*";_robber setdamage 0.9;};
if(_robber distance _shop > 3) exitWith {hintSilent "You need to be within 3m of the cashier to rob him!" };
[_shop,_robber,_action] remoteExecCall ["AN_server_robShops",2];
