private _target = cursortarget;
private _pos = getposATL _target;
private _pos2 = [(_pos select 0),(_pos select 1),(_pos select 2)];
titletext ["Person wird abgetastet!","PLAIN DOWN"];
private _alles = [];
{_alles pushback _x;}foreach (magazines _target);
{_alles pushback _x;}foreach (weapons _target);
_alles pushback (uniform _target);
_alles pushback (Vest _target);
_alles pushback (goggles _target);
private _back = Backpack _target;
_alles pushback (Headgear _target);
{_alles pushback _x;}foreach (primaryWeaponItems _target);
{_alles pushback _x;}foreach (handgunItems _target);
{if(!(_x in ["Binocular","Rangefinder"]) && (!(["Laserdesignator", _x,false] call BIS_fnc_inString)))then {_alles pushback _x;};}foreach (assignedItems _target);


disableSerialization;
"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_title = "Taste Person ab";
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
_t2 = "Fertig";
_time = ["abtasten"]call ESG_fnc_skilltime;
for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1"] remoteExecCall ["life_fnc_animSync",-2];
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };

    sleep _time;
    _cP = _cP + 0.01;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
    if (_cP >= 1 || !alive _target || !alive player) exitWith {};
    if (life_isknocked) exitWith {_t2 = "Abgebrochen";};
    if (life_interrupted) exitWith {_t2 = "Abgebrochen";};
    if (player getVariable ["restrained",false]) exitWith {_t2 = "Abgebrochen";};
    if (player distance _target > 4) exitWith {_badDistance = true; _t2 = "Abgebrochen";};
	if(player getVariable["esg_bewusstlos",false])exitWith {_t2 = "Abgebrochen";};
};

for "_i" from 0 to 1 step 0 do {
	sleep 0.0006;
	_cP = _cP - 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format ["%1 (%2)",_title,_t2];
	if (_cP <= 0 || !alive _target || !alive player) exitWith {};
};
"progressBar" cutFadeOut 1;
player playActionNow "stop";

if (life_isknocked || life_interrupted || (player getVariable ["restrained",false]) || (player distance _target > 4) || !alive _target || !alive player) exitWith {hint "Aktion abgebrochen!"};
if(player getVariable["esg_bewusstlos",false])exitWith {life_action_inUse = false;};


{
	_target removeWeaponGlobal _x;
} forEach weapons _target;
{_target removeMagazine _x;} forEach (magazines _target);
removeUniform _target;
removeVest _target;
removeBackpackGlobal _target;
removeHeadGear _target;
removeGoggles _target;

{
	_target unassignItem _x;
	_target removeItem _x;
} forEach (assignedItems _target);
if (hmd _target != "") then {
	_target unlinkItem (hmd _target);
};
_holder = "WeaponHolderSimulated" createVehicle [0,0,0];
_holder setPos _pos2;
{
	if (!(_x isEqualTo "")) then {
		_holder addItemCargoGlobal [_x, 1];
	};
}foreach _alles;
if (!(_back isEqualTo "")) then {
	_holder addBackpackCargoGlobal [_back, 1];
};
hint "Sachen der Person wurden auf den Boden gelegt!";
["abtasten",1]call ESG_fnc_skilladd;