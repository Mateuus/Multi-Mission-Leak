/*
	I am so tired of writing this.
*/
private["_vault"];
_vault = prison_safe;
if(!(_vault getVariable["prison_open",false])) exitWith {hint "Everything seems to be fine. Stop wasting your time and get to work!";};
if("ToolKit" in (items player)) then
{
		life_action_inUse = true;

		//Setup the progress bar
		disableSerialization;
		_title = localize "STR_Cop_RepairVaultPrison";
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
		_titleText ctrlSetText format["%2 (1%1)...","%",_title];
		_progressBar progressSetPosition 0.01;
		_cP = 0.01;

		while {true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep 0.26;
			if(isNull _ui) then {
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNamespace getVariable "life_progress";
				_progressBar = _ui displayCtrl 38201;
				_titleText = _ui displayCtrl 38202;
			};
			_cP = _cP + .012;
			_progressBar progressSetPosition _cP;
			_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
			if(_cP >= 1 OR !alive player) exitWith {};
			if(life_interrupted) exitWith {};
		};

		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(!alive player) exitWith {life_action_inUse = false;};
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		life_action_inUse = false;
		prison_safe2 attachTo [prison_holder,[3,4,-0.4]];
		prison_safe attachTo[prison_wallholder,[3.9,0.85,1.4]];
		prison_safe1 attachTo [prison_wallholder,[3.9,1.8,0.57]];
		prison_safe setVariable["prison_open",false,true];
		[5,"<t color='#FFFF00'><t size='1.5'>The prison has been secured and repaired!</t></t>"] remoteExecCall ["life_fnc_broadcast",-2];
		deleteMarker "MarkerJailbreak";
		deleteMarker "MarkerTextJailbreak";
} else {
	hint"You need a toolkit to repair the prison";
};
