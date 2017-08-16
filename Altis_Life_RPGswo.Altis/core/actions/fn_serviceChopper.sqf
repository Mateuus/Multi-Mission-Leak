/*
	File: fn_serviceChopper.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for the chopper service paid, to be replaced in later version.
*/
disableSerialization;
private["_search","_ui","_progress","_cP","_pgText"];
if(DWEV_action_inUse) exitWith {hint "Warte bis du mit deiner aktuellen Aktion fertig bist."};
_search = nearestObjects[getPos (_this select 0), ["Air"],20];
if(count _search == 0) exitWith {hint "Kein Helikopter auf dem Helipad!"};
if(dwf_cash < 1000) exitWith {hint "Du benötigst 1000€ für den Wartungsdienst."};
dwf_cash = dwf_cash - 1000;
DWEV_action_inUse = true;
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNameSpace getVariable "DWEV_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Warte Helikopter (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Warte Helikopter (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
	
	if(player distance (_this select 0) > 5) exitWith { };
	if(!alive (_search select 0) || (_search select 0) distance (_this select 0) > 20) exitWith {  };

};

if(!alive (_search select 0) || (_search select 0) distance (_this select 0) > 20) exitWith { 5 cutText ["","PLAIN"]; DWEV_action_inUse = false; hint "Der Helikopter hat das Helipad verlassen."; };

if(player distance (_this select 0) > 5) exitWith { 5 cutText ["","PLAIN"]; titleText["Bleibe innerhalb von 5 m.","PLAIN"]; DWEV_action_inUse = false; };
if(!local (_search select 0)) then
{
	//[(_search select 0),1] remoteExec ["DWEV_fnc_setFuel",(_search select 0)];
}
	else
{
	//(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

5 cutText ["","PLAIN"];
titleText ["Dein Helikopter wurde Repariert.","PLAIN"];
DWEV_action_inUse = false;