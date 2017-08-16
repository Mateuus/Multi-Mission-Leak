/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {hint "The vault is already locked?"};

eM_action_inUse = true;
		if(currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
		};
//Setup the progress bar
disableSerialization;
_title = "Repairing vault...";
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
	_cP = _cP + .012;
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

_vault setVariable["safe_open",false,true];
hint "The vault is now fixed and re-secured.";