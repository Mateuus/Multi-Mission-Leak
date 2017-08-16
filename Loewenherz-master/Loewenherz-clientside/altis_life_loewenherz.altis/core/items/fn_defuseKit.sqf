/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Defuses blasting charges for the cops?
*/

private ["_vault","_title","_ui","_progressBar","_titleText","_cP","_code","_start","_done","_temp","_display","_text","_b1","_b2","_b3","_b4","_rdy"];
_vault = param [0,ObjNull,[ObjNull]];
if(isNull _vault) exitWith {};
if(_vault != fed_bank) exitWith {};
if(!(_vault getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};

lhm_action_inUse = true;
//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Defuse_Process";
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNamespace getVariable "lhm_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;


_code = "";
_start = 0;
_done = 0;
_temp = fed_bank getvariable["code",[]];

{
	_code = _code + str _x;


	} foreach _temp;


createDialog "KeypadDefuse";
waitUntil {!isnull (findDisplay 5825)};
_display = finddisplay 5825;
_text = _display displayCtrl 1100;

_b1 = _display displayctrl 2000;
_b2 = _display displayctrl 2001;
_b3 = _display displayCtrl 2002;
_b4 = _display displayCtrl 2003;

_b1 ctrlshow false;
_b2 ctrlshow false;
_b3 ctrlshow false;
_b4 ctrlshow false;


_text ctrlSetStructuredText parsetext "<t size='1.25' font='puristaLight' align='center' color='#FF0000'>INFO</t><br/><t size='0.95' font='puristaLight' align='left' color='#BCF5A9'>Warte bis der 10 stellige Code bekannt ist, gebe diesen ein und besätige um die Bombe zu entschärfen, solltest du nicht so viel Zeit haben, kann auch einer der Drähte durchgetrennt werden, das ist allerdings gefährlicher!</t><br/>";
_rdy= false;
For "_i" from 0 to 1 step 0 do
{
	//if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//		sleep 0.35;
		//		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		//};
	sleep 0.5;
	if(isNull _ui) then {
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNamespace getVariable "lhm_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	if(isnull (findDisplay 5825)) exitWith {};
	_cP = _cP + .0035;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_rdy = true;};
	if(lhm_interrupted) exitWith {};

	if(_start <= (round(_cP * 100))) then {
		_done = _done + 1;
		ctrlSetText [1099, _code select[0,_done]];
		playSound 'button_click';
		_start = _start + 10;

	};
};
if(_rdy) then {
	fed_bank setVariable["chargeplaced",false,true];
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {lhm_action_inUse = false;};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; lhm_action_inUse = false;};

lhm_action_inUse = false;
//_vault setVariable["chargeplaced",false,true];
// [[0,"STR_ISTR_Defuse_Success"],"lhm_fnc_broadcast",west,false] call lhm_fnc_mp;