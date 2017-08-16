/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
private [];
disableSerialization;
createDialog "bodycondition";
_dialog = findDisplay 15209;
_bloodLevelDesc = _dialog displayCtrl 1009;
_bloodLossDesc = _dialog displayCtrl 1010;
_bloodRegenDesc = _dialog displayCtrl 1011;
_boneCondDesc = _dialog displayCtrl 1012;
_painDesc = _dialog displayCtrl 1013;
_hungerDesc = _dialog displayCtrl 1014;
_waterDesc = _dialog displayCtrl 1015;
//Button
_useMorphineBtn = _dialog displayCtrl 2403;
_useAdrenalineBtn = _dialog displayCtrl 2404;
_useTransfuseBlood = _dialog displayCtrl 2402;

{
  ctrlEnable [_x,false];
} forEach [2400,2401,2402,2403,2404];

_brokenLeg = player getVariable "LegBroken";
if(!isNil "_brokenLeg") then {
  _boneCondDesc ctrlSetText "Legs are broken.";
} else {
  _boneCondDesc ctrlSetText "Legs aren't broken";
};

if("AN_Bandage" in (magazines player) && {((player getVariable["BleedRate",0]) > 0)}) then {
  ctrlEnable [2400,true];
  buttonSetAction [2400,"closeDialog 0;[] spawn life_fnc_swuzuyedevapr"];
};
if("AN_Tourniquet" in (magazines player) && {((player getVariable["BleedRate",0]) > 0)}) then {
  ctrlEnable [2401,true];
  buttonSetAction [2401,"closeDialog 0;[player] spawn life_fnc_zufazecuzurut"];
};
if("AN_Morphine" in (magazines player) && {!isNil "_brokenLeg"}) then {
  _useMorphineBtn ctrlEnable true;
  _useMorphineBtn buttonSetAction "closeDialog 0;[player] spawn life_fnc_trefravaqefru";
};
if("AN_Adrenaline" in (magazines player) && {((player getVariable["LifeState",0]) != 0)}) then {
  _useAdrenalineBtn ctrlEnable true;
  _useAdrenalineBtn buttonSetAction "closeDialog 0;[player] spawn life_fnc_praspujachaje";
};
if("AN_Bloodbag" in (magazines player) && {((player getVariable["BleedRate",0]) < 1)} && {((player getVariable["BloodLevel",0]) < 3000)}) then {
  _useTransfuseBlood ctrlEnable true;
  _useTransfuseBlood buttonSetAction "closeDialog 0;[player] spawn life_fnc_tecanarabrest";
};

_idcArr = [1202,1203,1204,1201];
_dmgArr = [];
_dmgArr pushBack (player getHitPointDamage "hitBody");
_dmgArr pushBack (player getHitPointDamage "hitHead");
_dmgArr pushBack (player getHitPointDamage "hitHands");
_dmgArr pushBack (player getHitPointDamage "hitLegs");
{
  _dmg = _x;
  _idc = _idcArr select _forEachIndex;
  _idc = _dialog displayCtrl _idc;
  _idc ctrlSetTextColor [1,0,0,_dmg];
} forEach _dmgArr;

while {dialog && !isNull _dialog} do {
  _bloodLevel = player getVariable["BloodLevel",0];
  _bloodLoss = player getVariable["BleedRate",0];
  _regenRate = player getVariable["RegenRate",0];
  _bloodLevelDesc ctrlSetText format ["%1",_bloodLevel];
  _bloodLossDesc ctrlSetText format ["%1",_bloodLoss];
  _bloodRegenDesc ctrlSetText format ["%1",_regenRate];
  //_painDesc ctrlSetText "Pain levels are low";
  _hungerDesc ctrlSetText format ["%1",life_hunger];
  _waterDesc ctrlSetText format ["%1",life_thirst];
  sleep 1;
};
