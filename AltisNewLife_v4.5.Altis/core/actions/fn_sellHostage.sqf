#include <macro.h>
private["_unit","_rate"];
_rate = 15000;
_unit = cursorTarget;
if(isNull _unit) exitWith {hint "null Target"};
if((_unit GVAR ["enslaved",false])) exitWith { hint "Votre victime a récemment été asservis, vous devez attendre un peu avant de l'asservir à nouveau"};
if((player GVAR ["slaver",false])) exitWith { hint "Vous avez déjà asservi quelqu'un, vous devez attendre un peu !"};
if(side _unit == independent) exitWith {hint "Les medecins ne peuvent pas etre vendu comme esclave"};
if(life_slaver) exitWith {hint "Vous avez déjà asservi quelqu'un, vous devez attendre un peu !"}; 
if((player distance (getMarkerPos "slave_trader_center") < 15)) then
{
	[[steamid,player GVAR["realname",name player],"920"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	detach _unit;
	[[_unit,false],"life_fnc_sellHostageAction",_unit,false] spawn life_fnc_MP;
};
argent_liquide = argent_liquide + _rate;
hint "Vous avez vendu un esclave pour 15000€";
life_slaver = true;
player SVAR["slaver",true,true];
uiSleep (4 * 60);
life_slaver = false;
player SVAR["slaver",false,true];
hint "Vous pouvez asservir le monde a nouveau...";