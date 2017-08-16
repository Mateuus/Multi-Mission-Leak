/*
	Changes state of stations.
*/
private["_shop","_robber","_action","_state"];
_shop = param [0,ObjNull,[ObjNull]];
_robber = param [1,ObjNull,[ObjNull]];
_action = param [2];
_state = param [3,-1,[0]];
if(isNull _shop) exitWith {};

switch (_state) do {
	case -1: {
		_shop removeAction _action;
	};
	case 0: {
		_action = _shop addAction["Hold Up Gas Station",life_fnc_thadeprathed];
	};
};
