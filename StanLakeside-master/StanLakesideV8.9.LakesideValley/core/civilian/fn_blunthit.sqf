/*
blunt melee hit
*/
private["_curWep","_curMags","_attach"];
params [["_unit", objNull, [objNull]], ["_shooter", objNull, [objNull]]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(deadPlayer) exitWith {};

_koildebs = player getVariable ["EMSON", 2];

if(_koildebs == 1) exitWith {};

if(_shooter isKindOf "Man" && !deadPlayer) then
{
	
["Remove",0.005] call fnc_doHealth;

	if(!life_istazed) then
	{
		[] spawn KK_fnc_forceRagdoll;
		life_istazed = true;
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

		disableUserInput true;
		[] spawn {
			uiSleep 3;
			[player,"amovppnemstpsraswrfldnon"] remoteExecCall ["life_fnc_animSync"];
			if(!(player getVariable["Escorting", false])) then {
				detach player;
			};
			life_istazed = false;
			player allowDamage true;
			disableUserInput false;
		};
	};
}
	else
{
	_unit allowDamage true;
	life_iztazed = false;
};