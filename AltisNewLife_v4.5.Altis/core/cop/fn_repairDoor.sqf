private["_building","_doors","_door","_cP","_cpRate","_ui","_title","_titleText"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "Vous ne regardez pas a une porte de maison."};
_doors = 1;
while {true} do {
	if(!isClass(configFile >> "CfgVehicles" >> (typeOf _building) >> "AnimationSources" >> format["Door_%1_source",_doors])) exitWith {};
	_doors = _doors + 1;
};
_door = 0;
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint "Vous n'etes pas a cote de la porte !"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 1) exitWith {hint "Cette porte est deja verouillé!"};
life_action_inUse = true;
closeDialog 0;
//Setup the progress bar
disableSerialization;
_title = "Reperation de la porte...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
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
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_building animate [format["door_%1_rot",_door],0];
_building setVariable[format["bis_disabled_Door_%1",_door],1,true]; //Unlock the door.