/*
	File: fn_schutzSirene.sqf
*/	
if (life_schutz) exitWith {hint "Du hast die Sirene vor kurzem erst benutzt!"};	
private["_source"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
if(playerSide == west) then
{
	[player,"schutzsirene"] call life_fnc_globalSound;	
	life_schutz = true;
    
    [] spawn {
		uiSleep 900;
		life_schutz = false;
    };
} else {
	hint "Du kannst die Zivilschutzsirene nicht benutzen.";	
};