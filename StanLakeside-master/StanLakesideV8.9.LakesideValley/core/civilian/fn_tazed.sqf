/*
	File: fn_tazed.sqf
	
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_curWep","_curMags","_attach"];
params [["_unit", objNull, [objNull]], ["_shooter", objNull, [objNull]]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
_sleeptime = 15;

if(life_crazy > 0) then {
	_sleeptime = _sleeptime * 0.1;
};

if(life_rebelbadguyman) then {
	_sleeptime = _sleeptime * 0.8;
};

if(_shooter isKindOf "Man" && !deadPlayer) then
{
	if(!life_istazed && !life_isdowned) then
	{
		life_istazed = true;
		[] spawn KK_fnc_forceRagdoll;
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};
		playSound3D ["cg_sndimg\sounds\tazer.ogg", _shooter, false, getPosASL player, 1, 1, 125];
		disableUserInput true;

		player playmovenow "DeadState";
		_sleeptime spawn {
			_sleeptime = _this;
			uisleep _sleeptime;
			sleep 1;
			if(!(player getVariable ["escorting", false])) then {
				detach player;
			};
			sleep 1;
			life_istazed = false;
			disableUserInput false;
			[player,""] remoteExecCall ["life_fnc_animSync"];
		};
	};
}
	else
{
	_unit allowDamage true;
	life_istazed = false;
};