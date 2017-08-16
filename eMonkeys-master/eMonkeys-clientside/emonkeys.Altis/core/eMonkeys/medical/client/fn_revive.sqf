/*
	File: fn_revive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_unit","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_unit = cursorTarget;
eM_interrupted = false;
if(isNull _unit) exitwith {};

		if(currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		};
		
		eM_action_inUse = true;
		_displayName = _unit getVariable "name";
		_upp = format["Versuche %1 wiederzubeleben...",_displayName];
		
		disableSerialization;
		5 cutRsc ["EMonkeys_progress","PLAIN"];
		_ui = uiNameSpace getVariable "EMonkeys_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		["ainvpknlmstpsnonwnondr_medic0",3.6] execFSM "core\fsm\moveLoop.fsm";
		while{true} do
		{
			if(animationState player == "ainvpknlmstpsnonwnondr_medic0") then 
			{
				_cP = _cP + 0.01;
				_progress progressSetPosition _cP;
				_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			};
			if(_cP >= 1) exitWith {};
			if(!(_unit getVariable["onkill",false])) exitWith {titleText["Wiederbeleben abgebrochen.","PLAIN"];};
			if(player != vehicle player) exitWith {};
			if(eM_interrupted) exitWith {};
			uisleep 0.27;
		};
		EMonkeys_ExitMoveLoop = true;
		player switchMove "AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
		
		eM_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(!isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then {
			if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon EMonkeys_curWep_h;
			};
		};

		if(eM_interrupted) exitWith {eM_interrupted = false; titleText["Wiederbeleben abgebrochen.","PLAIN"]; eM_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du bist in einem Fahrzeug","PLAIN"];};
		if(!(_unit getVariable["onkill",false])) exitWith {titleText["Wiederbeleben abgebrochen.","PLAIN"];};
		
		_unit setVariable["Revive",true,TRUE];
		titleText["Reanimation war erfolgreich.","PLAIN"];
		[format ["%1",8000],"EMonkeys_fnc_madcash",independent,false] call EMonkeys_fnc_mp;
