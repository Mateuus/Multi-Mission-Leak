/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/

if(!alive player) exitWith {};
if((player getVariable "LifeState") != 0) exitWith {};

_jobs = [];
_paycheck = (call life_paycheck);

switch(playerSide)do {
 case civilian: {
   if(life_protectiveDetail) then {
     _jobs pushBack 1000;
   };
   if(life_isGov) then {
     _jobs pushBack 1000;
   };
   if(count _jobs > 0) then {
    {
     _paycheck = _paycheck + _x;
    } forEach _jobs;
  };
   if(life_gov select 5) then {
     _payCheckIncrease = (call life_paycheck) * 0.2;
     _payCheckIncrease = round (_payCheckIncrease);
     [(_paycheck + _payCheckIncrease),1,0] call life_fnc_sewawruk;
     ["GovPay"] call life_fnc_notificationHandler;
   } else {
     [_paycheck,1,0] call life_fnc_sewawruk;
     ["PayCheck"] call life_fnc_notificationHandler;
   };
 };
 default {
   if(life_gov select 5) then {
     _payCheckIncrease = _paycheck * 0.2;
     _payCheckIncrease = round (_payCheckIncrease);
     [(_paycheck + _payCheckIncrease),1,0] call life_fnc_sewawruk;
     ["GovPay"] call life_fnc_notificationHandler;
   } else {
     [_paycheck,1,0] call life_fnc_sewawruk;
     ["PayCheck"] call life_fnc_notificationHandler;
   };
 };
};
//
{
	if(local _x && {(count units _x isEqualTo 0)}) then {
		deleteGroup _x;
	};
} forEach allGroups;
