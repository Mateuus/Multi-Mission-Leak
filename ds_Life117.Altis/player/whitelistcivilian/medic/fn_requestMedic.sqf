/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Tells the medic they are wanted
*/
private["_medicsOnline","_action","_timer","_cost"];
_medicsOnline = 0;
{
	if(_x getVariable ["medic",false])then
		{
		_medicsOnline = 1;
		};
}forEach playableUnits;

if(DS_atmCoin < 100000)then{_cost = 5000}else{
if(DS_atmCoin < 500000)then{_cost = 15000}else{
if(DS_atmCoin < 2000000)then{_cost = 45000}else{
if(DS_atmCoin < 10000000)then{_cost = 80000}else{
if(DS_atmCoin < 25000000)then{_cost = 100000}else{
_cost = 125000};};};};};

if(_medicsOnline == 0)exitwith{titleText ["There is currently no medics online to revive you", "plain down"];systemchat "There is currently no medics online to revive you"};

_action = [
	format ["Requesting a medic will increase your respawn time to 10 minutes and cost you $%1 when revived. You will also be infection free upon revive",_cost],
	"Warning",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

DS_deadBody setVariable ["reviveCost",_cost,true];

if(!_action)exitwith
	{
	[]spawn{
			((findDisplay 666670) displayCtrl 2401) ctrlEnable false;
			sleep 120;
			((findDisplay 666670) displayCtrl 2401) ctrlEnable true;
			};
	};
if(!_action)exitwith{};
_timer = 600;
DS_requestedMedic = true;
{
	if(_x getVariable ["medic",false])then
		{
		[[DS_deadPos,profileName],"DS_med_medicRequest",_x,FALSE] spawn BIS_fnc_MP;
		};
}forEach playableUnits;

((findDisplay 666670) displayCtrl 2400) ctrlEnable false;
((findDisplay 666670) displayCtrl 2401) ctrlEnable false;
DS_deadbody setVariable ["requestedMedic",true,true];
while{true}do
	{
	if(_timer < 1)exitwith{};
	if(!DS_requestedMedic)exitwith{};
	titleText [format ["Your respawn timer has been frozen for another %1 seconds while you wait for a revive", _timer], "PLAIN"];
	_timer = _timer - 1;
	sleep 1;
	};
if(!DS_requestedMedic)exitwith{};
((findDisplay 666670) displayCtrl 2400) ctrlEnable true;
((findDisplay 666670) displayCtrl 2401) ctrlEnable true;
titleText ["You can now respawn", "plain down"];

DS_requestedMedic = false;