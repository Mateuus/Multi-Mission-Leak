if(actualProofs isEqualTo []) exitWith {hint "Vous n'avez rien a faire analyser"};
if(life_action_inUse) exitWith {titleText["Vous effectuez déjà une action","PLAIN"]};

life_action_inUse = true;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Analyse en Cours (1%1)...","%"];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 0.15;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Analyse en Cours (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
	if(life_interrupted) exitWith {titleText["Vous ne devez pas bouger pendant les analyses","PLAIN"];};
};

if(life_interrupted) exitWith {
	5 cutText ["","PLAIN"];
	_ui = "osefStatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["osefStatusBar","PLAIN"];
};

_type = actualProofs select 0;
_infos = actualProofs select 1;


if(_type == 1) then {
	_weapon = _infos select 0;
	_dna = _infos select 1;
	if(_dna isEqualTo "NODNA") then {
		titleText[format["Les balles récupérées sur place ont été tirés par un %1",_weapon],"PLAIN"];
	} else {
		titleText[format["Les balles récupérées sur place ont été tirés par un %1 et l'ADN correspond à %2",_weapon,_dna],"PLAIN"];
	};
};
if(_type == 2) then {
	_vehicle = _infos select 0;
	titleText[format["Le morceau de phare brisé correspond à un %1",_vehicle],"PLAIN"];
};

actualProofs = [];