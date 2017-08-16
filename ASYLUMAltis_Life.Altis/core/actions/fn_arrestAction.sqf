/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id","_jail","_markers"];

_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable ["restrained",false])) exitWith {systemChat "You cannot send this person to prison without their being restrained."}; //He's not restrained.
if(!((side _unit) in [civilian,independent])) exitWith {systemChat "Only civilians may be sent to prison."}; //Not a civ
if(playerSide == civilian && !(_unit getVariable ["isCivRestrained",false])) exitWith {systemChat "You cannot send players restrained by a cop to jail."};

_handle = [format["<t align='center'>Are you sure you want to send %1 to jail?</t>", name _unit]] spawn life_fnc_confirmMenu;
waitUntil {scriptDone _handle};
if(!life_confirm_response) exitWith {};

if (life_action_in_use) exitWith { systemChat "You are already performing an action."; };
if (playerSide != west && (count life_bounty_contract) < 1) exitWith { hint "You do not have an active bounty hunting task."; };
if (playerSide != west && !((getPlayerUID _unit) in life_bounty_uid)) exitWith { hint "You cannot arrest this person as you are not tasked to their bounty."; };

life_action_in_use = true;

[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn BIS_fnc_MP;
detach _unit;
[[],"life_fnc_jail",_unit,false] spawn BIS_fnc_MP;
[[0,format["%1 was arrested by %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
[[199, player, format["%1 arrested %2", profileName, name _unit]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;

if (playerSide == civilian) then
{
	life_experience = life_experience + 150;
	[getPlayerUID _unit] spawn life_fnc_removeBounty;
}
else
{
	life_experience = life_experience + 170;
};

life_action_in_use = false;

["BountyUpdate",[format["You have arrested %1. Good work.", name _unit]]] call BIS_fnc_showNotification;