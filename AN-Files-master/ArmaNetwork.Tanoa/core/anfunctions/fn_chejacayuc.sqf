/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = param [0,Objnull,[Objnull]];
_shooter = param [1,Objnull,[Objnull]];
if(isNull _unit OR {isNull _shooter}) exitWith {player allowDamage true; life_istazed = false;};
_time = time;
_damagep = getDammage player;
_bleedingRate = player getVariable "BleedRate";
_bloodLevel = player getVariable "BloodLevel";

if(_shooter isKindOf "Man" && {!life_killed}) then {
	if(!life_istazed) then {
		life_istazed = true;
		//player allowDamage false;
		//call life_fnc_rewrumequs;
		//sleep 0.1;
		//player allowDamage true;
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
			{
				player addMagazine _x;
			} forEach _curMags;
		};
		[player,"Tazersound",50] remoteExecCall ["life_fnc_quvucamaph",-2];
		//[0,format[localize "STR_NOTF_Tazed", _unit getVariable["realname",name _unit], _shooter getVariable["realname",name _shooter]]] remoteExecCall ["life_fnc_brusathusek",-2];
		disableUserInput true;
		player allowDamage false;
		player setDamage _damagep;
	  _anim = if(isNull objectParent player) then {"Incapacitated"} else {"kia_driver_mid01"};
		player playMoveNow _anim;
		player setVariable ["BleedRate", _bleedingRate, true];
		player setVariable ["BloodLevel", _bloodLevel, true];
		waitUntil{time - _time >= 15};
		player allowDamage true;
		if(player getVariable["restrained",false]) exitWith {
			if(!(player getVariable["Escorting",false])) then {
				detach player;
			};
			life_istazed = false;
			disableUserInput false;
		};
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		life_istazed = false;
		disableUserInput false;
		player playMoveNow "amovppnemstpsraswrfldnon";
		player setVariable ["BleedRate", _bleedingRate, true];
		player setVariable ["BloodLevel", _bloodLevel, true];
	};
} else {
	life_istazed = false;
	player allowDamage true;
	player setVariable ["BleedRate", _bleedingRate, true];
	player setVariable ["BloodLevel", _bloodLevel, true];
};
player allowDamage true;
player setVariable ["BleedRate", _bleedingRate, true];
player setVariable ["BloodLevel", _bloodLevel, true];
