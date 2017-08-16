_body = cursorTarget;
if((player distance _body) > 10)  exitWith {titleText["Vous êtes trop loin du cadavre","PLAIN"]};
if(life_action_inUse) exitWith {titleText["Vous effectuez déjà une action","PLAIN"]};

_type = _body getVariable["killedType",666];
_infos = _body getVariable["killedInfos",[]];

if(_type == 666) exitWith {hint "Cet homme à été tué par Satan, et il n'a pas laissé d'indices"};

if(_type == 3) exitWith {
	titleText["Les échantillons ont apparement déjà été prélevés ou sont en cours de prélevement","PLAIN"];
};

_body setVariable["killedType",3,true];

life_action_inUse = true;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["Recherche d'indices (1%1)...","%"];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.13;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["Recherche d'indices (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {_body setVariable["killedType",_type,true];};
	if(life_interrupted) exitWith {_body setVariable["killedType",_type,true];life_action_inUse = false;};
};

if(_type == 0) then {titleText["Vous n'avez rien trouvé d'interessant","PLAIN"]};

if(_type == 1) then {
	titleText["La victime semble avoir été tuée par balle, vous avez prélevé des preuves que vous devez faire analyser.","PLAIN"];
	actualProofs = [1,_infos];
};

if(_type == 2) then {
	titleText["La victime semble avoir été percutée, vous avez prélevé des preuves que vous devez faire analyser.","PLAIN"];
	actualProofs = [2,_infos];
};
life_action_inUse = false;
5 cutText ["","PLAIN"];
_ui = "osefStatusBar" call BIS_fnc_rscLayer;
_ui cutRsc["osefStatusBar","PLAIN"];