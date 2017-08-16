/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Re-locks the door mainly for the federal reserve structures.
*/
private["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText"];
_building = param [0,ObjNull,[ObjNull]];
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Du schaust nicht auf eine Haustür."};
_doors = 1;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint "Du bist nicht in der nähe einer Tür!"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 1) exitWith {hint "Die Tür ist schon abgeschlossen!"};
DWEV_action_inUse = true;

closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = "Repariere Tür";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.008;};
	case "Land_Research_house_V1_F": {_cpRate = 0.005;};
	default {_cpRate = 0.08;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
	
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;};
DWEV_action_inUse = false;
_building animate [format["door_%1_rot",_door],0];
_building setVariable[format["bis_disabled_Door_%1",_door],1,true]; //Unlock the door.