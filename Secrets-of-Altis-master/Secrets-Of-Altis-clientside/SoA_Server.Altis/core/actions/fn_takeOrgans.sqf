/*
    file: fn_takeOrgans.sqf
    author: [midgetgrimm] - www.grimmlife.com
    
    taken from the same idea of robbing script by tonic
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((_unit getVariable ["missingOrgan",FALSE])) exitWith {};
if((player getVariable ["hasOrgan",FALSE])) exitWith {};
if((animationState _unit != "Incapacitated")) exitWith {};
if(!([false,"scalpel",1] call life_fnc_handleInv)) exitWith {hint "Du hast kein Skalpell!"};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!([true,"kidney",1] call life_fnc_handleInv)) exitWith {hint "Kein Platz für eine Niere."};
life_action_inUse = true;
player setVariable["hasOrgan",true,true];
player playMove "AinvPknlMstpSnonWnonDnon_medic";
sleep 3;
_unit setVariable["missingOrgan",true,true];
life_action_inUse = false;
[] remoteExec ["life_fnc_hasOrgan",_unit];

[1,format["%1 hat eine Niere von %2 herausgeschnitten.",name player,name _unit]] remoteExecCall ["life_fnc_broadcast",0];
[getPlayerUID player,name player,"919"] remoteExecCall ["SOA_fnc_wantedAdd",2];
sleep 300;
player setVariable["hasOrgan",false,true];