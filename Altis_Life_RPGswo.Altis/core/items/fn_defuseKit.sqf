/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Defuses blasting charges for the cops?
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText"];
closeDialog 0;
_vault = param [0,ObjNull,[ObjNull]];
if(isNull _vault) exitWith {};
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {};
if(!(_vault getVariable["chargeplaced",false])) exitWith {hint "Da ist keine Bombe am Safe?"};

DWEV_action_inUse = true;
//Setup the progress bar
disableSerialization;
_title = "Bombe entschärfen...";
5 cutRsc ["DWEV_progress","PLAIN"];
_ui = uiNamespace getVariable "DWEV_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
	{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	
	sleep 0.195;
			
	if(isNull _ui) then 
	{
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNamespace getVariable "DWEV_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	
	_cP = _cP + .0035;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(DWEV_interrupted) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {DWEV_action_inUse = false;};
if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Aktion abgebrochen","PLAIN"]; DWEV_action_inUse = false;};


DWEV_action_inUse = false;
_vault setVariable["chargeplaced",false,true];
[2,"Die Bombe wurde entschärft."] remoteExec ["DWEV_fnc_broadcast",west];
dwf_atmcash = dwf_atmcash + 10000;
hint parseText format["<t color='#FFFFFF'><t align='center'><t size='.8'>Du hast<br/><t color='#FF0000'><t size ='1.1'<t align='center'>Die Bombe entschärft.<br/><t color='#00FF22'><t align='center'><t size='1'>Dafür hast du eine Sicherheitszulage von 10000€ erhalten."];