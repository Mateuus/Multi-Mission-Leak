/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {_unit allowDamage true; life_istazed = false;};

if(_shooter isKindOf "Man" && alive _unit) then
{
	if(!life_istazed) then
	{
		life_istazed = true;
		_curWep = currentWeapon _unit;
		_curMags = magazines _unit;
		_attach = if(primaryWeapon _unit != "") then {primaryWeaponItems _unit} else {[]};
		{_unit removeMagazine _x} foreach _curMags;
		_unit removeWeapon _curWep;
		_unit addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{_unit addMagazine _x;} foreach _curMags;
		};

		[_unit,"Tazersound"] remoteExecCall ["say3D",0];
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[_unit,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["switchmove",0];
		[0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",0];
		_unit attachTo [_obj,[0,0,0]];
		"DynamicBlur" ppEffectEnable true;
		"DynamicBlur" ppEffectAdjust [20];
		"DynamicBlur" ppEffectCommit 1;
		disableUserInput true;
		sleep 15;
		"DynamicBlur" ppEffectEnable false;
		[_unit,"amovppnemstpsraswrfldnon"] remoteExecCall ["switchmove",0];
		if(!(_unit getVariable["Escorting",false])) then {
			detach _unit;
		};
		life_istazed = false;
		_unit allowDamage true;
		disableUserInput false;
	};
}
	else
{
	_unit allowDamage true;
	life_iztazed = false;
};