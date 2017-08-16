/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if (!([8,[0,0,0,1,1,3,0]]  call emonkeys_fnc_coplevelcall)) exitWith {hint "Es sind zu wenig Polizisten Online, das Gold wurde vorher an einem geheimen Ort versteckt."};
if(EMonkeys_inv_boltcutter == 0) exitWith {
	titleText["Du hast kein Brecheisen.","PLAIN"];
};
if(isNil "EMonkeys_boltcutter_uses") then {EMonkeys_boltcutter_uses = 0;};
if((nearestObject [[16736,13667,0.00140572],"Land_Dome_Small_F"]) == _building OR (nearestObject [[16731.646,13665.511,0],"Land_Research_house_V1_F"]) == _building) then {
	[[[1,2],"!!!!! DIE ZENTRALBANK WIRD AUSGERAUBT !!!!!!"],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;
} else {
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint "Du bist nicht in der Nähe einer Tür"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint "Die Türe is offen!"};
eM_action_inUse = true;

		if(currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		};
//Setup the progress bar
disableSerialization;
_title = "Die Tür wird aufgebrochen...";
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNamespace getVariable "EMonkeys_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Small_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.08;}
};

while {true} do
{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				uisleep 0.8;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
	uisleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["EMonkeys_progress","PLAIN"];
		_ui = uiNamespace getVariable "EMonkeys_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR ((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
	if(eM_istazed) exitWith {}; //Tazed
	if(eM_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
		if(!isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then {
			if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon EMonkeys_curWep_h;
			};
		};
if(((!alive player) || (player getVariable["onkill",FALSE])) OR eM_istazed) exitWith {eM_action_inUse = false;};
if((player getVariable["restrained",false]) OR (player getVariable["restrainedciv",false])) exitWith {eM_action_inUse = false;};
if(eM_interrupted) exitWith {eM_interrupted = false; titleText["Action cancelled","PLAIN"]; eM_action_inUse = false;};
EMonkeys_boltcutter_uses = EMonkeys_boltcutter_uses + 1;
eM_action_inUse = false;
if(EMonkeys_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call EMonkeys_fnc_handleInv;
	EMonkeys_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
