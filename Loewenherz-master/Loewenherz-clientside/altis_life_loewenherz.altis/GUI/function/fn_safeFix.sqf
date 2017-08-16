/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {hint localize "STR_Cop_VaultLocked"};

lhm_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_Cop_RepairVault";
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable "lhm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

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
	_cP = _cP + .012;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(lhm_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {lhm_action_inUse = false;};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};

lhm_action_inUse = false;

fed_bank setVariable["safe_open",false,true];
hint localize "STR_Cop_VaultRepaired";