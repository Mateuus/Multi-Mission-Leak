/*
	File: fn_schutzSirene.sqf
*/	
if (life_schutz) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};	
private["_source"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
if(playerSide == west || playerSide == east) then
{
	[_source,"schutzsirene"] call life_fnc_globalSound;	
	life_schutz = true;
};
if(playerSide == civilian) then
{
	hint "Du kannst die Zivilschutzsirene nicht benutzen.";	
};
if(playerSide == independent) then
{
	hint "Du kannst die Zivilschutzsirene nicht benutzen.";	
};
sleep 900;
life_schutz = false;