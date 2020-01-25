/*
File: gather evidence
*/
private["_curTarget","_unit","_victim","_crime","_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_curTarget = cursorTarget;
_target = cursorTarget;


["Zbieram dowody... Zajmie to okolo 10 sekund", false] spawn domsg;
titleFadeOut 10;

_target setVariable["EVIDO",player,TRUE];

_evidence = _curTarget getVariable "evidence";

_suspect = _evidence select 0;
_victim = _evidence select 1;
_crime = _evidence select 2;

//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Zbieram dowody na %1",_suspect];
_progressBar progressSetPosition 0.01;
_cP = 0;




_bad = 0;
//Lets reuse the same thing!
while {true} do
{
	if(animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon") then {
		
		player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};

	uiSleep 0.2;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Zbieram dowody na  %1",_suspect];
	if(_cP >= 1 OR deadPlayer) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_bad = 1;};
	if(_target getVariable["EVIDO",ObjNull] != player) exitWith {};
};
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
if(_target getVariable ["EVIDO",ObjNull] != player) exitWith { hint "Ktos juz zbiera te dowody.."; };
if(_bad == 1) exitWith { hint "Za bardzo sie oddaliles od dowodow"; };
if(life_interrupted) exitWith {hint "Przerwales zbieranie dowodow.";};




[format["Zebrales dowody i dostales premie w wysokosci $8000 za dodanie %1 do listy poszukiwanych za %2.", name _suspect, _crime], false] spawn domsg;
hint format ["Zebrales dowody na %1 oraz dodales go na liste poszukiwanych za %2.", name _suspect, _crime];

if(_crime == "187") then {
	[getPlayerUID _suspect,_suspect getVariable["realname",name _suspect],"187"] remoteExec ["life_fnc_wantedAdd",2];
};
if(_crime == "211") then {
	[getPlayerUID _suspect,_suspect getVariable["realname",name _suspect],"211"] remoteExec ["life_fnc_wantedAdd",2];
};
if(_crime == "487") then {
	[getPlayerUID _suspect,_suspect getVariable["realname",name _suspect],"487"] remoteExec ["life_fnc_wantedAdd",2];
};
if(_crime == "334") then {
	[getPlayerUID _suspect,_suspect getVariable["realname",name _suspect],"334"] remoteExec ["life_fnc_wantedAdd",2];
};
deleteVehicle _curTarget;