/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/

private ["_vault","_display","_text","_b1","_b2","_b3","_b4","_wire","_handle","_bomb"];
_vault = param [0,ObjNull,[ObjNull]];
if(isNull _vault) exitWith {}; //Bad object
if(BankHeistState < 6) exitWith {Hint "Kann nur beim Banküberfall benutzt werden!"};
if(BankHeistState < 6) exitWith {Hint "Kann nur beim Banküberfall benutzt werden!"};

if(({side _x == west} count playableUnits) < 8) exitWith {hint format["Es müssen mindestens 8 Cops online sein!"];};

// Check for special placements...
if(_vault in blastingChargePlacements) then {
	if(_vault getVariable["chargeplaced",false]) exitWith {hint "Achtung, es ist bereits eine Bombe plaziert!"};
	if(!([false,"blastingcharge",1] call lhm_fnc_handleInv)) exitWith {}; //Error?
	playSound "bag";

	_vault setVariable["chargeplaced",true,true];
	hint "Bombe plaziert!";
	_handle = [1,true,_vault] spawn lhm_fnc_demoChargeTimer;
	waitUntil {scriptDone _handle};

	sleep 0.9;
	if(!(_vault getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL _vault select 0, getPosATL _vault select 1, (getPosATL _vault select 2)+0.5];
	_vault setPos [getPos _vault select 0,getPos _vault select 1, -100];
	sleep 1;
	_vault setVariable["chargeplaced",false,true];

} else {
	if(fed_bank != _vault) exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
	if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
	if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
	if(!([false,"blastingcharge",1] call lhm_fnc_handleInv)) exitWith {}; //Error?
	playSound "bag";
	disableSerialization;

	// open bomb gui
	if(!(createDialog "KeypadDefuse")) exitWith {([true,"blastingcharge",1] call lhm_fnc_handleInv)}; // item add check??
	waitUntil {!isnull (findDisplay 5825)};
	_display = finddisplay 5825;
	_text = _display displayCtrl 1100;
	_b1 = _display displayctrl 2000;
	_b2 = _display displayctrl 2001;
	_b3 = _display displayCtrl 2002;
	_b4 = _display displayCtrl 2003;

	_b1 ctrlshow false;
	_b2 ctrlshow false;
	_b3 ctrlshow false;
	_b4 ctrlshow false;

	_text ctrlSetStructuredText parsetext "<t size='1.25' font='puristaLight' align='center' color='#FF0000'>INFO</t><br/><t size='0.95' font='puristaLight' align='left' color='#BCF5A9'>Gebe einen beliebigen 10 stelligen Code ein um die Bombe zu aktivieren. Die Bombentechnicker der Polizei werden danach diese Zahlenkombination zum entschärfen herausfinden müssen!</t><br/>";
};

// wait till bomb code is set
/*
waitUntil {count (_vault getVariable["code",[]]) == 10;if(isnull (findDisplay 5825)) exitWith {true};};
if(isnull (findDisplay 5825)) exitWith {};
fed_bank setVariable["chargeplaced",true,true];



// random wire set
_wire = ["BLUE", "WHITE", "YELLOW", "GREEN"] call bis_fnc_selectRandom;
fed_bank setvariable["wire",_wire,true];


// [[0,"STR_ISTR_Blast_Placed"],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;
hint localize "STR_ISTR_Blast_KeepOff";
// _handle = [] spawn lhm_fnc_demoChargeTimer;
// [[],"lhm_fnc_demoChargeTimer",west,false] call lhm_fnc_mp;

//waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};
/*
_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";
*/
