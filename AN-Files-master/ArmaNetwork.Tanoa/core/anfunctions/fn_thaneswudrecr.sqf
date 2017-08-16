/*
  ArmA.Network
  Rathbone
  Handles New Bodyguard Request - Server
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_president",objNull,[objNull]]
];
if(isNull _president) exitWith {};

_action = [
	"You've been offered a position in the Presidential Protective Detail!",
	"Protective Detail Job Offer",
	"Accept",
	"Decline"
] call BIS_fnc_guiMessage;

if(_action) then {
  life_protectiveDetail = true;
  hintSilent "Congratulations on being part of the Presidential Protective Detail! You now have access to various new weapons and vehicles at the President Mansion as well as at any Presidential Safe Houses! REMEMBER: YOU ARE NOT ABOVE THE LAW! YOUR MAIN ASSIGNMENT IS TO PROTECT THE PRESIDENT!";
  [1,"The Person has accepted the Offer!"] remoteExecCall ["life_fnc_brusathusek",_president];
  [player] remoteExecCall ["life_fnc_bodyGuardAccepted",2];
} else {
  [1,"The Person has declined the Offer!"] remoteExecCall ["life_fnc_brusathusek",_president];
};
