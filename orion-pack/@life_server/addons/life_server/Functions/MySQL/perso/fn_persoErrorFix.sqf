params [
	["_uid","",[""]],
	["_side",sideUnknown,[sideUnknown]],
	["_player",objNull,[objNull]]
];

if(isNull _player) exitWith {}; // Error .-.

_query = switch(_side) do
{
	case west:
	{
		;
		format["DELETE FROM perso WHERE pid='%1'",_uid];
		format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	};
	case independent:
	{
		format["DELETE FROM perso WHERE pid='%1'",_uid];
		format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	};
	case civilian:
	{
		format["DELETE FROM perso WHERE pid='%1'",_uid];
		format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	};
	case east:
	{
		format["DELETE FROM perso WHERE pid='%1'",_uid];
		format["INSERT INTO perso(pid, persoCop, persoMed, persoCiv, persoEast) VALUES ('%1','""[]""','""[]""','""[]""','""[]""')",_uid];
	};
};
[_query,1] call DB_fnc_asyncCall;
[] remoteExecCall ["fvs_fnc_persoNeu",(owner (_this select 1))];