/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Runs when a player is ziptied
*/
private ["_vehicle","_veh","_sp","_num","_sp1","_sp2","_range"];

hint "Setting up your IED";
systemchat "Setting up your IED";
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 3;
if((DS_infoArray select 17) > 28)then
	{
	_range = 200;
	}
	else
	{
	_range = 100;
	};

_num = round random 4;

switch(_num)do
	{
	case 0:
		{
		_veh = "Land_JunkPile_F";
		};
	case 1:
		{
		_veh = "Land_GarbagePallet_F";
		};
	case 2:
		{
		_veh = "Land_JunkPile_F";
		};
	case 3:
		{
		_veh = "Land_GarbageWashingMachine_F";
		};
	case 4:
		{
		_veh = "Land_Tyres_F";
		};
	};

_sp = [(getpos player select 0) + 0, (getpos player select 1) + 0, getpos player select 2];
_sp1 = [(getpos player select 0) + 4, (getpos player select 1) + 2, getpos player select 2];
_sp2 = [(getpos player select 0) - 4, (getpos player select 1) - 2, getpos player select 2];

_vehicle = _veh createVehicle _sp;

_vehicle setVariable ["ied",true,true];
_DS_iedAction = player addAction["<t color='#00FF00'>Activate IED</t>",{DS_ied = true;sleep 4;DS_ied = false;},false,2,false,false,"",'((!(player getVariable ["cuffed",false]))&&(!DS_Tazed)&&(!DS_jailed))'];

waituntil {(((DS_ied)&&(player distance _vehicle < _range))||(isNull _vehicle))};
if(isNull _vehicle)exitwith{player removeAction _DS_iedAction;};
if(!alive _vehicle)exitwith{player removeAction _DS_iedAction;};
DS_iedActive = false;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp1;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp2;
sleep 0.3;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp1;
_veh = "M_Mo_82mm_AT_LG";
_vehicle1 = _veh createVehicle _sp2;
sleep 0.9;
[[1,format["%1 has just set off an IED",name player,true]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
deletevehicle _vehicle;
sleep 2;
DS_ied = false;
player removeAction _DS_iedAction;
sleep (random 10);
if((DS_infoArray select 17) == 7)then
	{
	[2] call DS_fnc_questCompleted;
	};
if(((DS_infoArray select 17) == 28)&&(player distance cleanupWrecks < 1200))then
	{
	_tempNum = (DS_infoArray select 18);
	_tempNum = _tempNum + 1;
	DS_infoArray set [18,_tempNum];
	if((DS_infoArray select 18) > 2)then
		{
		[2] call DS_fnc_questCompleted;
		};
	};

