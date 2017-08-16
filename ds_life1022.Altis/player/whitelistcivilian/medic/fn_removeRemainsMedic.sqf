/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Removes Human Remains (Medic Mission)
*/

private ["_vehicle","_true","_tempNum","_payment"];
if([player,6,independent] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this with a work mate so nearby","PLAIN"];};
if(!(player getVariable ["medic",false]))exitwith{};
_payment = 5000;
if(DS_uselessMedic)exitwith{hint "You have been badly wounded and are unable to perform medic functions until you get treated at a hospital"};
_vehicle = (nearestObjects [player, ["Land_HumanSkeleton_F"],  3] select 0);
if(isNull _vehicle)exitwith{};
if(player distance _vehicle < 3)then
	{
	if((DS_infoArray select 10) > 11)then{_payment = (_payment*2);};
	if((DS_infoArray select 10) > 18)then{_payment = (_payment*1.5);};
	if(_vehicle getVariable ["medicMission1",false])then{DS_medicMission = true;};
	DS_doingStuff = true;
	player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 3;
	detach _vehicle;
	deletevehicle _vehicle;
	waitUntil {(isNull _vehicle)};
	systemchat format ["%1 has been paid into your bank for clearing these remains, return them to a hospital for additional payment",[_payment] call DS_fnc_numberText];
	[_payment,true,true] spawn DS_fnc_handleMoney;
	[5,true] spawn DS_fnc_moralAlter;
	DS_doingStuff = false;
	["bones",true,1] call DS_fnc_handleInventory;
	};

if((player distance kavAtm < 3000)&&((DS_infoArray select 10) == 0))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance repairBank2 < 500)&&((DS_infoArray select 10) == 1))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance hosp1_1_3_1_1 < 3000)&&((DS_infoArray select 10) == 7))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 9)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance kavAtm_1_2_1 < 3000)&&((DS_infoArray select 10) == 11))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if(((player distance gangflag1 < 3000)||(player distance gangflag2 < 3000)||(player distance gangflag3 < 3000)||(player distance gangflag4 < 3000))&&((DS_infoArray select 10) == 15))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance kavAtm_1_2_1_1 < 3000)&&((DS_infoArray select 10) == 18))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 2)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if(((player distance gangflag1 < 3000)||(player distance gangflag2 < 3000)||(player distance gangflag3 < 3000)||(player distance gangflag4 < 3000))&&((DS_infoArray select 10) == 21))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 3)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if(((player distance gangflag1 < 3000)||(player distance gangflag2 < 3000)||(player distance gangflag3 < 3000)||(player distance gangflag4 < 3000))&&((DS_infoArray select 10) == 25))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};

if((player distance shawn1 < 3000)&&((DS_infoArray select 10) == 28))then {
	_tempNum = (DS_infoArray select 11) + 1;
	if(_tempNum > 4)then {
		[3] call DS_fnc_questCompleted;
	} else {
		DS_infoArray set [11,_tempNum];
	};
};