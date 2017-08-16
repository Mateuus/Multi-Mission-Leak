private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {};
if(argent_liquide > 0) then
{
	[[argent_liquide],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["%1 a volé %3€ à %2",_robber getVariable["realname",name _robber],profileName,[argent_liquide] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	 [[player, _robber, argent_liquide, 4, compte_banque, 0],"TON_fnc_handleDBLog",false] spawn life_fnc_MP; 
	argent_liquide = 0;
	//["1"] call SOCK_fnc_syncData;
}
	else
{
	[[1,format["%1 n'a pas d'argent...",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};

[0] call SOCK_fnc_updatePartial;