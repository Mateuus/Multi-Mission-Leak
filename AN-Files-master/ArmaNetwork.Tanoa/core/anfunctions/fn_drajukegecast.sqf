/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
params [
  ["_object",objNull,[objNull]]
];
if (isNull _object) exitWith {};
if !(playerSide isEqualTo civilian) exitWith {};
if !((typeOf _object) isEqualTo "Land_MainSection") exitWith {};
if (player distance (getMarkerPos "PrisonBreakMarker") > 100) exitWith {};
if (player distance (_object) > 50) exitWith {};
if (!(getNumber(missionConfigFile >> "DebugMode") isEqualTo 1) && ({side _x isEqualTo west} count playableUnits < 10)) exitWith
{
  ["NotEnoughCops"] call life_fnc_notificationHandler;
};
if (!(count (attachedObjects _object) isEqualTo 0)) exitWith
{
  ["Someone's already placed an EMP on the Jail!",true,[1,0,0,1]] call life_fnc_notificationHandler;
};
if !(["empcharge",1] call life_fnc_virtualItemRemove) exitWith
{
  ["ItemsFail"] call life_fnc_notificationHandler;
};
[5,"<t color='#0000FF'><t size='1.5'>ALL UNITS - A EMP HAS BEEN PLACED ON THE PRISON - THIS WILL BLOW OUT YOUR KEYCARDS IF NEAR</t></t>"] remoteExecCall ["life_fnc_brusathusek",west];
private _time = 0;
_time = if ("hackerOne" in AN_Skills) then {3} else {4};
[_object,player,_time] remoteExecCall ["life_fnc_handleEMPServer",2];
