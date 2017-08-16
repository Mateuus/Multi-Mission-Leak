/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.

private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if({side _x == west} count playableUnits < 5) exitWith {hint localize "STR_Civ_NotEnoughCops"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["chargeplaced",true,true];
[[0,"STR_ISTR_Blast_Placed"],"life_fnc_broadcast",west,false] call life_fnc_MP;
[[player, "bankjob",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] call life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};
[[player, "bankjob",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";
*/
/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
_vault = param [0,ObjNull,[ObjNull]];
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault == "Land_CargoBox_V1_F") then {

	if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
	if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
	if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?

	_vault setVariable["chargeplaced",true,true];
	[0,"A blasting charge has been placed on the federal reserves vault, You have till the clock runs out to disarm the charge!"] remoteExecCall ["life_fnc_broadcast",west];
	hint localize "STR_ISTR_Blast_KeepOff";
	_handle = [] spawn life_fnc_demoChargeTimer;
	[] remoteExec ["life_fnc_demoChargeTimer",west];
	//[_vault,"ticktock",10] call life_fnc_globalSound;
	[[player, "bankjob",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	waitUntil {scriptDone _handle};
	sleep 0.9;
	if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};
	[[player, "bankjob",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;

	_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
	fed_bank setVariable["chargeplaced",false,true];
	fed_bank setVariable["safe_open",true,true];
	hint localize "STR_ISTR_Blast_Opened";
	hint parseText format["<t color='#FFFFFF'><t align='center'><t size='.8'>THE VAULT IS<br/><t color='#FF0000'><t size ='2'<t align='center'>CRACKED<br/><t color='#FFF700'><t align='center'><t size='1'>GRAB THE GOLD AND RUN"];

} else {

	if(typeOf _vault == "Box_East_AmmoVeh_F") then {
		if(_vault getVariable["hchargeplaced",false]) exitWith {hint "A charge has already been placed!"};
		if(_vault getVariable["heligold_open",false]) exitWith {hint "No need for a charge, it's already open!"};
		if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
		_vault setVariable["hchargeplaced",true,true];
		hint "Back away from the vault \n 1 Minute till detonation!";
		_handle = [] spawn life_fnc_helicrashTimer;
		[_vault,"ticktock",10] call life_fnc_globalSound;
		waitUntil {scriptDone _handle};
		sleep 0.9;
		if(!(heli_gold getVariable["hchargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};
		_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL heli_gold select 0, getPosATL heli_gold select 1, (getPosATL heli_gold select 2)+0.5];
		heli_gold setVariable["hchargeplaced",false,true];
		heli_gold setVariable["heligold_open",true,true];
		[heli_gold,"Open Vault",life_fnc_safeHeliGold,false] remoteExecCall ["life_fnc_addAction",civilian];
		hint localize "STR_ISTR_Blast_Opened";
	};
};
