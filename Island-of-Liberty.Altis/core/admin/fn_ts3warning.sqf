#include "..\..\script_macros.hpp"

if(FETCH_CONST(life_adminlevel) > 0) exitWith {closeDialog 0;};
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

switch (life_adminwarning) do
{
	case 0:
	{
		hint "Guten Tag, ein Admin bittet Sie darum sich auf Teamspeak3 einzufinden. IP: ts.island-of-liberty.com Channel: Warte Support Altis Life. Dies ist Ihre erste Warnung!";
		titleText ["Guten Tag, ein Admin bittet Sie darum sich auf Teamspeak3 einzufinden.\nIP: ts.island-of-liberty.com.\nBetreten Sie dort den Channel 'Warte Support Altis Life'.\nDies ist Ihre erste Warnung!", "PLAIN"];
		life_adminwarning = life_adminwarning + 1;
	};
	case 1:
	{
		hint "Finden Sie sich sofort auf Teamspeak3 ein. IP: ts.island-of-liberty.com. Betreten Sie dort den Channel 'Warte Support Altis Life'. Dies ist Ihre letzte Warnung.";
		titleText ["Finden Sie sich sofort auf Teamspeak3 ein.\nIP: ts.island-of-liberty.com.\nBetreten Sie dort den Channel 'Warte Support Altis Life'.\nDies ist Ihre letzte Warnung.", "PLAIN"];
		life_adminwarning = life_adminwarning + 1;
	};
	case 2:
	{
		titleText ["SIE WURDEN GEWARNT.\nFinden Sie sich UNVERZUEGLICH auf Teamspeak3 ein.\nIP:ts.island-of-liberty.com.\nBetreten Sie dort den Channel 'Warte Support Altis Life'.\nSie werden nun aus dem Spiel entfernt.", "BLACK", 20];
		life_adminwarning = life_adminwarning + 1;
	
		[] call SOCK_fnc_updateRequest;
		sleep 30;
		endMission "Tja Pech";
	};
};