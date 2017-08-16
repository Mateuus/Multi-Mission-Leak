#include "..\..\script_macros.hpp"
/*

	Author Shinji
	Öffnet die News Paper des Servers man kann diese Editieren...

*/


///////Vorerst dürfen dass nur Administratoren.. muss mir noch was einfallen xD

//if(__GETC__(life_adminlevel) < 1) exitWith {};
if(license_civ_presse) then
{

hint parseText format ["Willkommen in der Redaktion <t size='1.25' font='TahomaB' color='#8112B9'>%1</t> .",profilename];

_ok = createDialog "mp_news_paper_new";
disableSerialization;
waitUntil {!isNull (findDisplay 8190)};
_display = findDisplay 8190;
waitUntil { !dialog };

}
else
{hint "Du bist keine Presse";};