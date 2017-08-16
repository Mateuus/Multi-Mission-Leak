#include <macro.h>
#define DEBUG

private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = param [0,Objnull,[Objnull]];
_shooter = param [1,Objnull,[Objnull]];
_sleeptimer = param [2,15,[0]];
if(isNull _unit) exitWith {player allowDamage true; lhm_istazed = false;};

if(alive player) then
{
	if(!lhm_istazed) then
	{
		lhm_istazed = true;
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

		[[_unit],"lhm_fnc_tazeSound",true,false] call lhm_fnc_mp;
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"lhm_fnc_animSync",true,false] call lhm_fnc_mp;
		//[[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"fnc_animsync",true,false] call lhm_fnc_mp;
		if (isNull _shooter) then {
			[[0,format["%1 wurde mit Mine oder Granate getasert", name _unit]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
		} else {
			[[0,format["%1 wurde von %2 getasert", name _unit, name _shooter]],"lhm_fnc_broadcast",true,false] call lhm_fnc_mp;
		};
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		while {_sleeptimer > 0} do {
			[1,[0.5,0.5,0.9],0.5] spawn lhm_fnc_fader;
			_sleeptimer = _sleeptimer - 1;
			sleep 1;
		};
		[[player,"amovppnemstpsraswrfldnon"],"lhm_fnc_animSync",true,false] call lhm_fnc_mp;
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		lhm_istazed = false;
		player allowDamage true;
		disableUserInput false;
	};
}
	else
{
	_unit allowDamage true;
	lhm_iztazed = false;
};
