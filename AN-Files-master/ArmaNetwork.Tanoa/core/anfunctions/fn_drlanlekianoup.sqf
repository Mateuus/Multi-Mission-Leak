/*
	ArmA.Network
	Rathbone
	(c) ArmA.Network 2016

	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
private ["_bloodLossNr","_bloodLevelNr","_regenRateNr"];
disableSerialization;
_unit = param [0,objNull,[objNull]];
if(isNull _unit) exitWith {};
if(playerSide != independent) exitWith {};
_dead = false;
_deadTime = _unit getVariable "timeofdeath";
if(!isNil "_deadTime") then {_dead = true;};
createDialog "patienthistory";
_dialog = findDisplay 15208;
_occupation = _dialog displayCtrl 1007;
_condition = _dialog displayCtrl 1003;
_declareDead = _dialog displayCtrl 2400;
_declareDead ctrlEnable false;
_reviveBtn = _dialog displayCtrl 2402;
_reviveBtn ctrlEnable false;
_bloodregen = _dialog displayCtrl 1013;
_bleedrate = _dialog displayCtrl 1011;
_bloodlevel = _dialog displayCtrl 1009;
_causeofdeath = _dialog displayCtrl 2409;

_idcArr = [1201,1203,1202,1204];
_dmgArr = [];
_dmgArr pushBack (_unit getHitPointDamage "hitBody");
_dmgArr pushBack (_unit getHitPointDamage "hitHead");
_dmgArr pushBack (_unit getHitPointDamage "hitHands");
_dmgArr pushBack (_unit getHitPointDamage "hitLegs");
{
  _dmg = _x;
  _idc = _idcArr select _forEachIndex;
  _idc = _dialog displayCtrl _idc;
  _idc ctrlSetTextColor [1,0,0,_dmg];
} forEach _dmgArr;

_declaredDeadSt = _unit getVariable "DeclaredDead";

if(_dead) then {
	if(isNil "_declaredDeadSt") then {
		if("AN_Defibrillator" in (magazines player)) then {
			_reviveBtn ctrlEnable true;
		};
	   _declareDead ctrlEnable true;
		buttonSetAction [2400,"closeDialog 0; life_pInact_curTarget setVariable [""DeclaredDead"",true,true]; hintSilent ""You've declared this body as dead!"";"];
		buttonSetAction [2402,"closeDialog 0; [life_pInact_curTarget] spawn life_fnc_triepluwleqlep"];
	};
	_causeofdeath ctrlSetText "Unknown";
	_bloodlevel ctrlSetText "Unknown";
	_bleedrate ctrlSetText "Unknown";
	_bloodregen ctrlSetText "Unknown";
} else {
	_condition ctrlSetText "Alive";
	_causeofdeath ctrlSetText "N/A";
};

while {dialog && !isNull (findDisplay 15208)} do {
	if(_dead) then {
		_currentTime = serverTime - _deadTime;
		_countDown = [_currentTime,"MM:SS"] call BIS_fnc_secondsToString;
		_condition ctrlSetText format["Unconscious: %1",_countDown];
	} else {
		_bloodLevelNr = _unit getVariable["BloodLevel",0];
		_bloodLossNr = _unit getVariable["BleedRate",0];
		_regenRateNr = _unit getVariable["RegenRate",0];
		_bloodlevel ctrlSetText format ["%1",_bloodLevelNr];
		_bleedrate ctrlSetText format ["%1",_bloodLossNr];
		_bloodregen ctrlSetText format ["%1",_regenRateNr];
	};
	sleep 2;
};
