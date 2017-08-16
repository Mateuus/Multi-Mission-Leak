/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Places an IED
*/

private ["_tempNum","_range","_sp","_sp1","_sp2","_veh","_vehicle","_iedAction","_bomb","_targets"];

if(!isNull objectParent player)exitwith{hint "You can't setup an IED in a vehicle";};
if(((player distance (getMarkerPos "Rebelop_2_1") < 900)||(player distance (getMarkerPos "Rebelop_2_2") < 900)||(player inArea "safezone")||(player inArea "safezone_1"))&&(playerSide isEqualTo civilian))exitwith{hint "You can't setup an IED in a safezone";};

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

_sp = [(getPos player select 0) + 0, (getPos player select 1) + 0, getPos player select 2];
_sp1 = [(getPos player select 0) + 4, (getPos player select 1) + 2, getPos player select 2];
_sp2 = [(getPos player select 0) - 4, (getPos player select 1) - 2, getPos player select 2];

_veh = selectRandom ["Land_JunkPile_F","Land_GarbagePallet_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_Tyres_F"];
_vehicle = _veh createVehicle _sp;

_vehicle setVariable ["ied",true,true];
_iedAction = player addAction["<t color='#00FF00'>Activate IED</t>",{DS_ied = true;sleep 4;DS_ied = false;},false,2,false,false,"",'((!(player getVariable ["restrained",false]))&&(!DS_tazed)&&(!DS_jailed))'];

waitUntil {(((DS_ied)&&(player distance _vehicle < _range))||(isNull _vehicle))};
if(isNull _vehicle)exitwith{player removeAction _iedAction;};
if(!alive _vehicle)exitwith{player removeAction _iedAction;};

DS_iedActive = false;

_veh = "M_Mo_82mm_AT_LG";
_bomb = _veh createVehicle _sp;
_bomb = _veh createVehicle _sp1;
_bomb = _veh createVehicle _sp2;
sleep 0.3;
_bomb = _veh createVehicle _sp;
_bomb = _veh createVehicle _sp1;
_bomb = _veh createVehicle _sp2;
sleep 0.9;

_targets = allPlayers select {((side _x) isEqualTo west)&&(_x distance player < 5000)};
if(!(_targets isEqualTo []))then{[1,format ["%1 has just set off an IED",name player,true]] remoteExecCall ["DS_fnc_globalMessage",_targets];};

deleteVehicle _vehicle;
sleep 2;
DS_ied = false;
player removeAction _iedAction;

sleep (random 10);

if((DS_infoArray select 17) == 7)then { [2] call DS_fnc_questCompleted };
if((player distance hosp1_1_3_1_1 < 300)&&((DS_infoArray select 17) == 28))then {
	_tempNum = (DS_infoArray select 18) + 1;
	if(_tempNum > 2)then {
		[2] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [18,_tempNum];
	};
};