/*
	File: fn_challengeWar.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Challenge another gang to war
*/

disableSerialization;

if (life_gang == "0") exitWith {hint "You are not currently a member of a gang. You must create one or receive an invitation.";closeDialog 0;};
if (life_gang_rank > 1) exitWith {hint "You are not of sufficient rank within your gang.";closeDialog 0;};
if ((time - life_gang_war_last) < 300) exitWith {hint "You may only challenge a gang to war once every 5 minutes!"};

if (isNull (findDisplay 9580)) exitWith {hint "INVALID GANG UI"};
_dialog = findDisplay 9580;

_gangId = (lbData[9581,(lbCurSel 9581)]);
if((lbCurSel 9581) == -1) exitWith {hint "You need to select a gang to challenge!"};

{
	if ((_x getVariable ["gang","0"]) == _gangId) then
	{
		[[player,life_gang,player getVariable ["gangName","unknown"]],"life_fnc_warChallenged",_x,false] spawn life_fnc_MP;
	};
} forEach allPlayers;

life_gang_war_last = time;
hint "A war challenge has been sent to all online members of the gang!";