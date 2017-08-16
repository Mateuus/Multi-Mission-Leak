/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = _this select 0;
if(!(_vault getVariable["safe_open",false])) exitWith {hint "The vault is already locked?"};

DWEV_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Safe reparieren...";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
			
	if(isNull _ui) then {
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + .012;
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

_vault setVariable["safe_open",false,true];
hint "Der Safe ist nun repariert und wieder sicher.";