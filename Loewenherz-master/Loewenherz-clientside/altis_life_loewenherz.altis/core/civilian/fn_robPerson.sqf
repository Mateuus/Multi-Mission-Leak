/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = param [0,ObjNull,[ObjNull]];
if(isNull _robber) exitWith {}; //No one to return it to?

if(lhm_cash > 0) then
{
	[[lhm_cash],"lhm_fnc_robReceive",_robber,false] call lhm_fnc_mp;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
	[[1,"STR_NOTF_Robbed",true,[_robber getVariable["realname",name _robber],profileName,[lhm_cash] call lhm_fnc_numberText]],"lhm_fnc_broadcast",nil,false] call lhm_fnc_mp;
	lhm_cash = 0;
	[0] call SOCK_fnc_updatePartial;
}
	else
{
	[[2,"STR_NOTF_RobFail",true,[profileName]],"lhm_fnc_broadcast",_robber,false] call lhm_fnc_mp;
};