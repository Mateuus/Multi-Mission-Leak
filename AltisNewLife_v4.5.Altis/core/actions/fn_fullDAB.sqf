#define GETC(var) (call var)
/*
	File: fn_fullDAB.sqf
	Author: Mash6 <Altis Life: Evolution> -- http://www.altislife-evolution.fr/ --
	
	Description:
	Full a DAB
*/
_dab = _this select 0;
_lastFulled = _dab getVariable ["lastFulled",0];

if(time < _lastFulled) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nCe DAB a été rempli recemment !","PLAIN"];};
if(GETC(life_tafflevel) != 8) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous n'êtes pas un employé de la Brinks !","PLAIN"];};
if(!brinks_inMission) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous n'êtes pas en service !","PLAIN"];};
if((!(alive brinksVehic)) OR (brinksVehic == ObjNull)) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVotre véhicule est détruit ou n'existe plus !","PLAIN"];};
if((player distance brinksVehic) > 10) exitWith {titleText["\n\n\n\n\n\n\n\n\n\n\n\nVotre véhicule est trop loin !","PLAIN"];};
if(life_action_inUse) exitWith {hint "Vous effectuez déjà une action";};
life_interrupted = false;
life_action_inUse = true;
titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous remplissez le DAB, veuillez patienter...","PLAIN"];

_timeToAdd = (random 30) + 30;
_time = time + _timeToAdd;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Remplissage du DAB (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.33;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Remplissage du DAB (%1%2)...",round(_cP * 100),"%"];
	titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous remplissez le DAB, veuillez patienter...","PLAIN"];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};
player playActionNow "stop";
5 cutText ["","PLAIN"];
life_action_inUse = false;
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};
_money = brinksVehic getVariable ["money",0];
_moneySup = round((random 10000) + 5000);
if(_money > _moneySup) then {
	brinksVehic setVariable ["money",(_money - _moneySup),true];
	hint format["Il reste %1 € dans votre véhicule",(_money - _moneySup)];
} else {
	brinksVehic setVariable ["money",0,true];
	hint "Votre véhicule est vide, rentrez à l'entrepôt.";
};
titleText["\n\n\n\n\n\n\n\n\n\n\n\nVous avez rempli le DAB, vous gagnez 4000€ pour votre travail !","PLAIN"];
compte_banque = compte_banque + 4000;
_dab setVariable["lastFulled",(time + 1200)];
_ui = "osefStatusBar" call BIS_fnc_rscLayer;
_ui cutRsc["osefStatusBar","PLAIN"];