/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_cpRate","_title","_progressBar","_titleText","_cp","_ui"];
_building = param [0,ObjNull,[ObjNull]];
if(isNull _building) exitWith {};
if(isNil "lhm_boltcutter_uses") then {lhm_boltcutter_uses = 0;};
/*
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
} else {
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
};
*/


if((_building == rsb1) || (_building == rsb2)  || (_building == rsb3)) then {
	if(Bankheiststate < 7) exitWith {hint "Fehler: Banküberfall ist noch nicht an dieser Stelle!"};
	if(({side _x == west} count playableUnits) < 8) exitWith {hint format["Es müssen mindestens 8 Cops online sein!"];};
	_door = [_building] call lhm_fnc_nearestDoor;
	if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
	if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

	lhm_action_inUse = true;


	disableSerialization;
	_title = localize "STR_ISTR_Bolt_Process";
	5 cutRsc ["lhm_progress","PLAIN"];
	_ui = uiNamespace getVariable "lhm_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;
	_cpRate = 0.001;

	// Animation Fix Test
	if((weaponState player select 4) > 0) then {
		player action ["SwitchWeapon", player, player, 100];
	};
	waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};
	
	For "_i" from 0 to 1 step 0 do
	{
			// Animation Fix Test
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				 player action ["SwitchWeapon", player, player, 100];
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				 player playActionNow "stop";
				 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			 };
			 // Animation Fix Test
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["lhm_progress","PLAIN"];
			_ui = uiNamespace getVariable "lhm_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {};
		if(lhm_istazed) exitWith {};
		if(lhm_interrupted) exitWith {};
	};


	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR lhm_istazed) exitWith {lhm_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {lhm_action_inUse = false;};
	if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};
	lhm_boltcutter_uses = lhm_boltcutter_uses + 1;
	lhm_action_inUse = false;
	if(lhm_boltcutter_uses >= 5) then {
		[false,"boltcutter",1] call lhm_fnc_handleInv;
		lhm_boltcutter_uses = 0;
	};
	_building setVariable[format["bis_disabled_Door_%1",_door],0,true];
	[[getPlayerUID player,profileName,"2577"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
	if(_building == rsb1) then {
		[[8],"lhm_fnc_bankHeist_setState",false,false] call LHM_fnc_MP;
	};


	} else {
	if(!(_building isKindOf "House_F")) exitWith {hint "Du guckst auf kein Haus."};

	_door = [_building] call lhm_fnc_nearestDoor;

	if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
	if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};

	lhm_action_inUse = true;

	//Setup the progress bar
	disableSerialization;
	_title = localize "STR_ISTR_Bolt_Process";
	5 cutRsc ["lhm_progress","PLAIN"];
	_ui = uiNamespace getVariable "lhm_progress";
	_progressBar = _ui displayCtrl 38201;
	_titleText = _ui displayCtrl 38202;
	_titleText ctrlSetText format["%2 (1%1)...","%",_title];
	_progressBar progressSetPosition 0.01;
	_cP = 0.01;

	switch (typeOf _building) do {
		case "Land_Dome_Big_F": {_cpRate = 0.002;};
		case "Land_Research_HQ_F": {_cpRate = 0.001;};
		default {_cpRate = 0.008;}
	};
	
// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};

	For "_i" from 0 to 1 step 0 do
	{
		// Animation Fix Test
		if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
			 player action ["SwitchWeapon", player, player, 100];
			 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			 player playActionNow "stop";
			 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			 player playActionNow "stop";
			 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 };
		 // Animation Fix Test
		sleep 0.26;
		if(isNull _ui) then {
			5 cutRsc ["lhm_progress","PLAIN"];
			_ui = uiNamespace getVariable "lhm_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
		};
		_cP = _cP + _cpRate;
		_progressBar progressSetPosition _cP;
		_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
		if(_cP >= 1 OR !alive player) exitWith {};
		if(lhm_istazed) exitWith {}; //Tazed
		if(lhm_interrupted) exitWith {};
	};

	//Kill the UI display and check for various states
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(!alive player OR lhm_istazed) exitWith {lhm_action_inUse = false;};
	if((player getVariable["restrained",false])) exitWith {lhm_action_inUse = false;};
	if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};
	lhm_boltcutter_uses = lhm_boltcutter_uses + 1;
	lhm_action_inUse = false;
	if(lhm_boltcutter_uses >= 5) then {
		[false,"boltcutter",1] call lhm_fnc_handleInv;
		lhm_boltcutter_uses = 0;
	};

	_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
	if((_building getVariable["locked",false])) then {
		_building setVariable["locked",false,true];
	};
	[[getPlayerUID player,profileName,"459"],"lhm_fnc_wantedAdd",false,false] call lhm_fnc_mp;
};