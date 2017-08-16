/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Defuses blasting charges for the cops?
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {};
if(EMonkeys_inv_defusekit == 0) exitWith {
	titleText["Du hast kein Entschärfungskit.","PLAIN"];
};
if(!(_vault getVariable["chargeplaced",false])) exitWith {hint "There is no charge on the vault?"};

eM_action_inUse = true;

		if(currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		};
//Setup the progress bar
disableSerialization;
_title = "Defusing charge...";
5 cutRsc ["EMonkeys_progress","PLAIN"];
_ui = uiNamespace getVariable "EMonkeys_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

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
	_cP = _cP + .0035;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR ((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {};
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
if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith {eM_action_inUse = false;};
if(eM_interrupted) exitWith {eM_interrupted = false; titleText["Action cancelled","PLAIN"]; eM_action_inUse = false;};

eM_action_inUse = false;
_vault setVariable["chargeplaced",false,true];
[[2,"The charge has been defused."],"EMonkeys_fnc_broadcast",west,false] call EMonkeys_fnc_mp;