#include "..\macros.hpp"
/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/

// Ladehemmungen
DWEV_actions = [player addAction ["", {playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _this select 0]; hint "Deine Waffe hat eine Ladehemmung\n\nDrücke [R] um sie durchzuladen";}, "", 0, false, true, "DefaultAction", "DWEV_weapon_malfunktion && ((driver vehicle player) != player)"]];
// Waffe Überhitzt
DWEV_actions pushBack [player addAction ["", {playSound3D ['a3\sounds_f\weapons\Other\dry9.wss', _this select 0]; hint "Deine Waffe ist zu heiß geworden\n\nWarte einen Augeblick bis sie wieder abgekühlt ist";}, "", 0, false, true, "DefaultAction", "DWEV_weapon_overheat && ((driver vehicle player) != player)"]];
// Signalpistolen Deaktivieren wenn der Serverschutz aktiv ist
DWEV_actions pushBack [player addAction ["", {hint "Signalpistolen sind zur Zeit deaktiviert";}, "", 0, false, true, "DefaultAction", "(DWEV_SERVER_LOCK && (currentWeapon player == ""hgun_Pistol_Signal_F"") && ((driver vehicle player) != player) )"]];
// Notausstieg (Schleudersitz) in Luftfahrzeugen
DWEV_actions pushBack [player addAction ["<t color='#FF0000'>SCHLEUDERSITZ</t>",  { [[], DWEV_fnc_emergencyEject] execFSM "call.fsm" }, [], -9, false, true, "", "(vehicle player) isKindOf 'Air' && !((vehicle player) isKindOf 'ParachuteBase') && !(player getVariable[""restrained"",false])"]];
// Magic Paracute ==> Magischer Fallschirm denman imer mit sich trägt
DWEV_actions pushBack [player addAction	["<t color='#FF00FF'>Fallschirm Öffnen</t>", { [[], DWEV_fnc_openParachute] execFSM "call.fsm" }, [], 20, true, true, "", "vehicle player == player && (getPos player) select 2 > 2.5"]];
if (actionWeaponfree) then // BUR BEI AKTION WEAPONFREE
{
	DWEV_actions pushBack [player addAction ["", {hint "Aktion WeaponFree\nDu darfst diese Waffe derzeit nicht benutzen!";player action ["SwitchWeapon", player, player, 100];}, "", 0, false, true, "DefaultAction", "(!((currentWeapon player) IN WEAPONFREE_ALLOWED_WEAPON)) && ((driver vehicle player) != player)"]];
};


switch ((side player)) do
{
	case west:
    {
		//Gegenstände beschlagnahmen
		DWEV_actions pushBack [player addAction["Gegenstände beschlagnahmen",DWEV_fnc_seizeObjects,cursorTarget,0,false,false,"",'count(nearestObjects [player,["weaponholder"],3])>0']];	
		// nano EMP Little Bird
		DWEV_actions pushBack [player addAction["<t color='#FF0000'>EMP Konsole öffnen</t>",DWEV_fnc_openEmpMenu,[],8,false,false,"",'[_this] call DWEV_fnc_isEmpOperator && __GETC__(DWEV_coplevel) > 2']];
		//nagelbänder
		DWEV_actions pushBack [player addAction["<t color='#FF0000'>Nagelband aufheben</t>",DWEV_fnc_packupSpikes,"",0,false,false,"",' _spike = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spike" && !isNil {(_spike getVariable "item")}']];
	};
		
 
 	case independent:
	{
		// Waffen Deaktivieren
		DWEV_actions pushBack [player addAction ["", {hint "Du kannst nur Signalpistolen benutzen";}, "", 0, false, true, "DefaultAction", "(!((currentWeapon player == ""hgun_Pistol_Signal_F"") || ((currentWeapon player == """"))))"]];
	};
	
	case east:
	{
	};

	case civilian:
	{
		// Waffen Deaktivieren
		DWEV_actions pushBack [player addAction ["", {hint "Deine Waffe ist zur Zeit deaktiviert";}, "", 0, false, true, "DefaultAction", "((!DWEV_allow_fire || player getVariable[""restrained"",false] || (side vehicle player != civilian)) && (currentWeapon player != """") && !(((driver vehicle player) == player) && (vehicle player != player)))"]];
		//Drop fishing net
		DWEV_actions pushBack [player addAction["Fischernetz auswerfen",DWEV_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && DWEV_carryWeight < DWEV_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !DWEV_net_dropped ']];
		//NOS aktivieren
		DWEV_actions pushBack [player addAction["<t color='#00FF00'>NOS aktivieren</t>",DWEV_fnc_boostNitro,false,2,false,false,"",' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']];
		//NOS V2 aktivieren
		DWEV_actions pushBack [player addAction["<t color='#00FF00'>NoS V2 aktivieren</t>",DWEV_fnc_boostNitrov2,false,2,false,false,"",' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitrov2", 0]) > 0) ']];
	};
	
};