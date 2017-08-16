#include "..\..\script_macros.hpp"

private ["_aciton","_unit","_atm"];

_unit = player;

if(playerSide != civilian) exitWith {["Only Civilians can buy a Bounty Hunting License!",5,"orange"] call RPG_Fnc_Msg;};
if(life_cash < 50000) exitWith {["Sorry! You do not have $50,000 for the license",5,"orange"] call RPG_Fnc_Msg;};
if(license_civ_bountyH) exitWith {["You're already a bounty hunter, why buy it again?",5,"orange"] call RPG_Fnc_Msg;};

_action = [
    format [localize "STR_GNOTF_BountyMSG"],
    localize "STR_Bounty_License",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
	hint parseText format["<t color='#FA4F4F'><t size='1.5'>Welcome to Bounty Hunters!</t></t><br/><br/><t size='1.2'>The Bounty Hunters are a group of civilians who wish to make Altis a better place by eliminating the ones who make it bad, they do this by the books while earning money on the side. Being a bounty hunter does NOT give you the right to RDM! Any RDM will be delt with! You MUST follow initiation rules and do NOT meta-game!</t>"];
	life_cash = life_cash - 50000;
	[100] remoteExecCall ["life_fnc_removeLicenses",_unit];
} else {
	["So the bounty hunters is not for you? Get out of my house!",5,"orange"] call RPG_Fnc_Msg;
};
