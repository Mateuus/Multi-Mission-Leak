#include "..\..\script_macros.hpp"
/*
	File: fn_Upgrade.sqf
	Author: RPGforYOU 
	Website: www.outlawed-veterans.com
	
	Description:
	Centralizes the upgrade scripts
	If you are copying it, be so kind to leave my name as author in it as I'm the one and only original one - RPGforYOU! :)
	And this took some time to fucking write, check and search for XD
*/

private["_window","_bad","_object","_value","_UpgradeName","_Upgradecost","_time","_actualtime"
];

_value = [_this,3,"",[""]] call BIS_fnc_param;
if(_value == "") exitWith {}; //well nothing shouldn't be coming through ...
_actualtime = 0;
//////////////
/*
EXAMPLES: 
*/
//////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if (life_upgrade) exitWith {"Upgrade already in progress"};

uiSleep 0.1;
_bad = 0;
_time = 0;
_actualtime = life_playtime;
_Upgradecost = 0;

switch (_value) do {
	////MEDICAL////

	case "medic_rank1": {
	/////////////////////
	//Medic Rank 1
	/////////////////////
	_UpgradeName = "Medic Rank 1";
	_time = 250;
	};
	case "medic_rank2": {
	/////////////////////
	//Medic Rank 2
	/////////////////////
	_UpgradeName = "Medic Rank 2";
	_time = 750;
	};
	case "medic_rank3": {
	/////////////////////
	//Medic Rank 3
	/////////////////////
	_UpgradeName = "Medic Rank 3";
	_time = 1500;
	};
	case "medic_rank4": {
	/////////////////////
	//Medic Rank 4
	/////////////////////
	_UpgradeName = "Medic Rank 4";
	_time = 3000;
	};
	case "medic_rank5": {
	/////////////////////
	//Medic Rank 5
	/////////////////////
	_UpgradeName = "Medic Rank 5";
	_time = 6000;
	};
	
	////POLICE////
	
	case "cop_rank1": {
	/////////////////////
	//Police Rank 1
	/////////////////////
	_UpgradeName = "Police Rank 1(Recruit)";
	_time = 0;
	};
	
	case "cop_rank2": {
	/////////////////////
	//Police Rank 2
	/////////////////////
	_UpgradeName = "Police Rank 2(Officer)";
	_time = 600;
	};
	
	case "cop_rank3": {
	/////////////////////
	//Police Rank 3
	/////////////////////
	_UpgradeName = "Police Rank 3(Sergeant)";
	_time = 1500;
	};
	
	case "cop_rank4": {
	/////////////////////
	//Police Rank 4
	/////////////////////
	_UpgradeName = "Police Rank 4(Lieutenant)";
	_time = 4000;
	};
	
	case "cop_rank5": {
	/////////////////////
	//Police Rank 5
	/////////////////////
	_UpgradeName = "Police Rank 5(Captain)";
	_time = 9000;
	};
	
	case "cop_rank6": {
	/////////////////////
	//Police Rank 6
	/////////////////////
	_UpgradeName = "Police Rank 6(Major)";
	_time = 14000;
	};
	
	case "cop_rank7": {
	/////////////////////
	//Police Rank 7
	/////////////////////
	_UpgradeName = "Police Rank 7(Colonel)";
	_time = 22000;
	};
	
	case "cop_rank8": {
	/////////////////////
	//Police Rank 8
	/////////////////////
	_UpgradeName = "Police Rank 8(General)";
	_time = 30000;
	};
	
	case "cop_rank9": {
	/////////////////////
	//Police Rank 9
	/////////////////////
	_UpgradeName = "Police Rank 9(Marshal)";
	_time = 66666;
	};
};
uiSleep 0.2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if(playerside isequalto west) then {
if ((FETCH_CONST(life_coplevel) isequalto 1)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- MXC<br/>
			- MK20<br/>
			- Rook<br/>
			<br/>
			Vehicles:<br/>
			- Hatchback<br/>
			- SUV"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 2)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- MX GL<br/>
			- MXM<br/>
			- MX SW<br/>
			- Flashbangs<br/>
			<br/>
			Vehicles:<br/>
			- Hunter<br/>
			- Orca Helicopter"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 3)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- Katiba<br/>
			- MK 18<br/>
			- MK 200<br/>
			<br/>
			Vehicles:<br/>
			- Truck covered<br/>
			- Sport Hatchback<br/>
			- Ghosthawk Helicopter"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 4)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- MK 1<br/>
			- MK 14<br/>
			- M320<br/>
			<br/>
			Vehicles:<br/>
			- Offroad Armed<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 5)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- Zafir<br/>
			- Cyrus<br/>
			- RPG launcher<br/>
			<br/>
			Vehicles:<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 6)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- MAR-10<br/>
			- SPMG .388<br/>
			- Satchel Charge<br/>
			<br/>
			Vehicles:<br/>
			- Huron Helicopter"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 7)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- GM6 Lynx<br/>
			- Navid<br/>
			<br/>
			Vehicles:<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
} else {
if ((FETCH_CONST(life_coplevel) isequalto 8)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a cop is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			Weapons:<br/>
			- GM6 Lynx<br/>
			- Navid<br/>
			<br/>
			Vehicles:<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};
};
};
};
};
};
};
};
} else {
if(playerside isequalto independent) then {
if ((FETCH_CONST(life_mediclevel) isequalto 0)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a medic is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			General<br/>
			- 1.3 Revive speed<br/>
			- 1.2 Impound speed<br/>
			- 1.2 Repair speed<br/>
			- + 1.750 paycheck<br/>
			<br/>
			Vehicles:<br/>
			- None<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};
if ((FETCH_CONST(life_mediclevel) isequalto 1)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a medic is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			General<br/>
			- 1.6 Revive speed<br/>
			- 1.4 Impound speed<br/>
			- 1.4 Repair speed<br/>
			- + 2.500 paycheck<br/>
			<br/>
			Vehicles:<br/>
			- Boxer Truck<br/>
			- S"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};
if ((FETCH_CONST(life_mediclevel) isequalto 2)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a medic is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			General<br/>
			- 1.9 Revive speed<br/>
			- 1.6 Impound speed<br/>
			- 1.6 Repair speed<br/>
			- + 3.250 paycheck<br/>
			<br/>
			Vehicles:<br/>
			- 2 New Medical trucks<br/>
			- 1 Orca Helicopter"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};
if ((FETCH_CONST(life_mediclevel) isequalto 3)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a medic is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			General<br/>
			- 2.2 Revive speed<br/>
			- 1.8 Impound speed<br/>
			- 1.8 Repair speed<br/>
			- + 4.000 paycheck<br/>
			<br/>
			Vehicles:<br/>
			- 1 New medical truck<br/>"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};
if ((FETCH_CONST(life_mediclevel) isequalto 4)) then {
_window = [
			format["Are you sure you wish to be promoted to:<br/>%1 ?<br/><br/>The needed <t color='#8cff9b'>ON-LINE</t> time as a medic is:<br/>%2 minutes<br/><br/>Your current <t color='#8cff9b'>ON-LINE</t> time = <t color='#FF0000'>%3</t> minutes<br/><br/>
			Unlocks for Next Rank!<br/><br/>
			General<br/>
			- 2.5 Revive speed<br/>
			- 2.0 Impound speed<br/>
			- 2.0 Repair speed<br/>
			- + 6.000 paycheck<br/>
			<br/>
			Vehicles:<br/>
			- Medical Strider<br/>
			- Medic Taru Chopper<br/>
			- Medic Huron Chopper"
			,_UpgradeName,[_time] call life_fnc_numberText,[_actualtime] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;
};

} else {
_window = [
			format["Are you sure you wish to Upgrade to %1 ?<br/><br/>It will cost you <t color='#8cff9b'>$ %2</t> to upgrade.<br/>This will be deducted from your bank account!",_UpgradeName,[_upgradecost] call life_fnc_numberText],
			"Upgrade",
			"Yes",
			"No"
		] call BIS_fnc_guiMessage;

};
};
		
if(_window) then {
uiSleep 0.2;

//Dead and vehicle check
if (vehicle player != player) exitWith { hint "Get out of your vehicle, you can't upgrade like that!";_bad = 1;};
if(!alive player) exitWith {hint"You are dead so doesn't matter what decision you make";_bad = 1;};
if((player getVariable "restrained")) exitWith {hint"Updating with your hands restrained is gone be hard!";};
if(life_istazed) exitWith {hint"You are tazed you can't upgrade like that!";};
if((animationState player) == "Incapacitated") exitWith {hint"You are down on the ground, you can't upgrade like that!";};

if(_actualtime < _time) exitWith {_bad = 1;};
if(_bad == 1) exitWith {};


uiSleep 0.2;
switch (_value) do {

	case "medic_rank1": {
	/////////////////////
	//Medic Rank 1
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_mediclevel) > 1) exitWith {};
	[13] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_medic1",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "medic_rank2": {
	/////////////////////
	//Medic Rank 2
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_mediclevel) > 2) exitWith {};
	if(FETCH_CONST(life_mediclevel) < 1) exitWith {};
	[14] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_medic2",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "medic_rank3": {
	/////////////////////
	//Medic Rank 3
	/////////////////////	
	life_upgrade = true;
	if(FETCH_CONST(life_mediclevel) > 3) exitWith {};
	if(FETCH_CONST(life_mediclevel) < 2) exitWith {};
	[15] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_medic3",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "medic_rank4": {
	/////////////////////
	//Medic Rank 4
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_mediclevel) > 4) exitWith {};
	if(FETCH_CONST(life_mediclevel) < 3) exitWith {};
	[16] call SOCK_fnc_updatePartial;	
	[5,"STR_NOTF_medic4",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "medic_rank5": {
	/////////////////////
	//Medic Rank 5
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_mediclevel) > 5) exitWith {};
	if(FETCH_CONST(life_mediclevel) < 4) exitWith {};
	[17] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_medic5",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	
	case "cop_rank1": {
	/////////////////////
	//Police Rank 1
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 1) exitWith {};
	Uisleep 0.1;
	[40] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop1",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank2": {
	/////////////////////
	//Police Rank 2
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 2) exitWith {};
	if(FETCH_CONST(life_coplevel) < 1) exitWith {};
	Uisleep 0.1;
	[41] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop2",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank3": {
	/////////////////////
	//Police Rank 3
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 3) exitWith {};
	if(FETCH_CONST(life_coplevel) < 2) exitWith {};
	Uisleep 0.1;
	[42] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop3",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank4": {
	/////////////////////
	//Police Rank 4
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 4) exitWith {};
	if(FETCH_CONST(life_coplevel) < 3) exitWith {};
	Uisleep 0.1;
	[43] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop4",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank5": {
	/////////////////////
	//Police Rank 5
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 5) exitWith {};
	if(FETCH_CONST(life_coplevel) < 4) exitWith {};
	Uisleep 0.1;
	[44] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop5",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank6": {
	/////////////////////
	//Police Rank 6
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 6) exitWith {};
	if(FETCH_CONST(life_coplevel) < 5) exitWith {};
	Uisleep 0.1;
	[45] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop6",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank7": {
	/////////////////////
	//Police Rank 7
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 7) exitWith {};
	if(FETCH_CONST(life_coplevel) < 6) exitWith {};
	Uisleep 0.1;
	[46] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop7",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank8": {
	/////////////////////
	//Police Rank 8
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 8) exitWith {};
	if(FETCH_CONST(life_coplevel) < 7) exitWith {};
	Uisleep 0.1;
	[47] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop8",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
	case "cop_rank9": {
	/////////////////////
	//Police Rank 9
	/////////////////////
	life_upgrade = true;
	if(FETCH_CONST(life_coplevel) > 9) exitWith {};
	if(FETCH_CONST(life_coplevel) < 8) exitWith {};
	Uisleep 0.1;
	[48] call SOCK_fnc_updatePartial;
	[5,"STR_NOTF_cop9",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	uiSleep 3;
	["PROMOTION",false,true] call BIS_fnc_endMission;
	};
};
} else {
hint parseText format["<t color='#ff0000'><t align='center'><t size='1'>CANCELLED<br/><br/></t>"];
titleText [format["Cancelled"],"PLAIN"];
};
reload player;
