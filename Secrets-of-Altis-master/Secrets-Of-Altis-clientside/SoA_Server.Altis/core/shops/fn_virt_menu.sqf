#include <macro.h>
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "med" && playerSide != independent) exitWith {hint "Du gehörst nicht zum AHW!"};
if(_shop == "jagd" && life_level < 4) exitWith {hint "Du besitzt keinen Jagdschein, keinen Waffenschein oder hast Level 4 noch nicht erreicht!"};
if(_shop == "donator" && (__GETC__(life_donator) == 0)) exitWith {hint "Du bist kein Freund von Don Ator!"};
if(_shop == "gang" && life_level < 5) exitWith {hint "Du besitzt keine Gruppierungskauflizenz oder hast Level 5 noch nicht erreicht!"};
if(_shop == "rebel" && life_level < 5) exitWith {hint "Du besitzt keine Rebellenausbildung oder hast Level 5 noch nicht erreicht!"};
if(_shop == "schneider" && life_level < 3) exitWith {hint "Du hast Level 3 noch nicht erreicht!"};
if(!(isNull objectParent player) && !(surfaceIsWater position (vehicle player))) exitWith {hint "Du kannst aus einem Fahrzeug heraus nichts kaufen bzw. verkaufen!"};

createDialog "shops_menu";

[] call life_fnc_virt_update;