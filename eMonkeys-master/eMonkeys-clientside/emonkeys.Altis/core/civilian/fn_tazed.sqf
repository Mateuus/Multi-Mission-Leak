/*
	File: fn_tazed.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the tazed animation and broadcasts out what it needs to.
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; eM_istazed = false;};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!eM_istazed) then
	{
		eM_istazed = true;
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
		
		[[_unit],"EMonkeys_fnc_tazeSound",true,false] call EMonkeys_fnc_mp;
		player playMoveNow "Incapacitated";
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player);
		_obj setPosATL (getPosATL player);
		player attachTo [_obj,[0,0,0]];

		[[0,format["%1 wurde von %2 ruhiggestellt!", _unit getVariable["realname",name _unit], _shooter getVariable["realname",name _shooter]]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;
		
		disableUserInput true;	
		
		// Extended Tazed
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
		"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
		enableCamShake true; // enables camera shake
		addCamShake [10, 45, 10]; // sets shakevalues
		player setFatigue 1; // sets the fatigue to 100%
		5 fadeSound 0.1; // fades the sound to 10% in 5 seconds
		
		uisleep 15;
		player playMoveNow "amovppnemstpsraswrfldnon";
		detach player;
		deleteVehicle _obj;
		if(!(player getVariable["Escorting",false])) then {
			detach player;
		};
		eM_istazed = false;
		player allowDamage true;
		disableUserInput false;
			
		// Extended Tazed - back to normal
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
		"dynamicBlur" ppEffectCommit 5; // time it takes to normal
		resetCamShake; // resets the shake
		5 fadeSound 1; //fades the sound back to normal	
	
	};
}
	else
{
	_unit allowDamage true;
	EMonkeys_iztazed = false;
};