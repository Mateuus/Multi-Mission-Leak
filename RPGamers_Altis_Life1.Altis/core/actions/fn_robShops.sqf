#include "..\..\script_macros.hpp"

private["_robber","_shop","_kassa","_title","_ui","_progress","_pgText","_cP","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;

if(side _robber != civilian) exitWith { ["You can not rob this register!",5,"gray"] call RPG_Fnc_Msg; };
if(_robber distance _shop > 5) exitWith { ["You need to be within 5m of the cashier to rob him!",5,"gray"] call RPG_Fnc_Msg; };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { ["Robbery already in progress!",5,"gray"] call RPG_Fnc_Msg; };
if (vehicle player != _robber) exitWith { ["Get out of your vehicle!",5,"gray"] call RPG_Fnc_Msg; };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { ["HaHa, you do not threaten me! Get out of my store!",5,"orange"] call RPG_Fnc_Msg; };
if (_kassa == 0) exitWith { ["There is no cash in the register!",5,"gray"] call RPG_Fnc_Msg; };

_cops = (west countSide playableUnits);
if(_cops < 1) exitWith{[_vault,-1] remoteExec ["disableSerialization;",2]; ["There isn't enough police to rob gas stations!",5,"gray"] call RPG_Fnc_Msg;};

_rip = true;
_kassa = 20000 + round(random 20000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";

[1,format["ALARM! - Gas Station: %1 is being robbed!", _shop]] remoteExec ["life_fnc_broadcast",west];
["drob", false] remoteExec ["life_fnc_dispatch",west];
[0,format["ALARM! - Gas Station: %1 is being robbed!", _shop]] remoteExec ["life_fnc_broadcast",west];

disableSerialization;

//Setup our progress bar.
_title = localize "STR_NOTF_Robbery";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_title];
_progress progressSetPosition 0.01;
_cP = 0.01;

if(_rip) then
{

[_shop,"robbed"] spawn life_fnc_nearestSound;

sleep 4;

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _shop];

while{true} do
{
sleep 0.85;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
_Pos = position player;
				                _marker = createMarker ["Marker200", _Pos];
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "!ATTENTION! Robbery !ATTENTION!";
				                "Marker200" setMarkerType "mil_warning";			
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 10.5) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 10.5) exitWith { deleteMarker "Marker200"; _shop switchMove ""; ["You need to stay within 10m to rob the register!",5,"gray"] call RPG_Fnc_Msg; ["Now the register has locked.",5,"gray"] call RPG_Fnc_Msg; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _shop];
[format["You have stolen $%1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText],5,"blue"] call RPG_Fnc_Msg;
deleteMarker "Marker200";
life_cash = life_cash + _kassa;
["Robbed"] spawn mav_ttm_fnc_addExp;

_rip = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
//[getPlayerUID _robber,name _robber,"211"] remoteExec ["life_fnc_wantedAdd",2];};
_reason = "211";
[player,player,_reason] spawn life_fnc_createEvidence;
sleep 300;
_action = _shop addAction["Rob the Cash Register",life_fnc_robShops];	
_shop switchMove "";