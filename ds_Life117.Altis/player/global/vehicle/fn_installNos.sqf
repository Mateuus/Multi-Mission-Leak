/*
		File: nitro.sqf
		Author: John "Paratus" VanderZwet
		
		Description: Attaches nitrous injector to a car
*/
private ["_removed","_amount"];

_removed = false;
_amount = 1;
_unit = cursorTarget;

if(DS_mechanicMission)exitwith{};

if (count (_unit getVariable ["vehicle_owners", []]) < 1 || !(_unit isKindOf "Car")) exitWith {hint "Your target is not a valid vehicle for nitrous oxide.";};
if (vehicle player != player) exitWith {};
if(DS_item_nitro > 0)then
	{
	["nitro",false,3] call DS_fnc_handleInventory;
	_removed = true;
	};
if((DS_item_vehNos > 0)&&(!_removed))then
	{
	["vehNos",false,5] call DS_fnc_handleInventory;
	_removed = true;
	_amount = 5;
	};
if((DS_item_vehNosAdv > 0)&&(!_removed))then
	{
	["vehNosAdv",false,10] call DS_fnc_handleInventory;
	_removed = true;
	_amount = 10;
	};

DS_doingStuff = true;
[]spawn 
	{
	while{true}do
		{
		if(!DS_doingStuff)exitwith{};
		[[player,"repair"],"DS_fnc_playSounds",_x,false] spawn DS_fnc_MP;
		sleep 2.5;
		};
	};

_upp = "Attaching nitrous injector...";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["DS_progress","PLAIN"];
_ui = uiNameSpace getVariable "DS_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _unit > 6) exitWith {};
	if(!alive player) exitWith {};
	if(speed player > 2) exitWith {};
};
5 cutText ["","PLAIN"];
DS_doingStuff = false;

if (_success) then
{
	if((playerside == civilian)&&((DS_infoArray select 13) > 41))then
		{
		_amount = (_amount*2);
		_unit setVariable["nitro",_amount,true];
		hint format ["Nitrous oxide injector added to vehicle (%1 injections).",_amount];
		}
		else
		{
		_unit setVariable["nitro",_amount,true];
		hint format ["Nitrous oxide injector added to vehicle (%1 injections).",_amount];
		};
}
else
{
	if(_amount == 1)then
		{
		["nitro",true,1] call DS_fnc_handleInventory;
		};
	if(_amount == 5)then
		{
		["vehNos",true,1] call DS_fnc_handleInventory;
		};
	if(_amount == 10)then
		{
		["vehNosAdv",true,1] call DS_fnc_handleInventory;
		};
	hint "Installation failed";
};








