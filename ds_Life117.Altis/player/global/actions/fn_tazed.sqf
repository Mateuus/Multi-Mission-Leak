/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Runs when a player is tazed by a cop or whitelisted civilian
*/
private["_player","_shooter","_curWep","_curMags","_attach","_inVeh"];
_player = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_inVeh = _this select 2;
if((isNull _player)||(isNull _shooter))exitWith{player allowDamage true;DS_tazed = false};

if(_inVeh) then
	{
	sleep 2;
	};

if((_shooter isKindOf "Man")&&(alive player)) then
{
	if(!DS_tazed) then
	{
		player allowDamage false;
		DS_tazed = true;
		DS_curWep_h = currentWeapon player;
		player action ["SwitchWeapon", player, player, 100];
		player switchcamera cameraView;
		/*
		_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _player} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _player != "") then
		{
			{
				_player addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};
		*/
		player setVariable ["surrender",true,true];
		[[_player,"tazer"],"DS_fnc_playSounds",true,false] spawn DS_fnc_MP;
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _player);
		_obj setPosATL (getPosATL _player);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
	
		if((side _player) != west) then
			{
			if((DS_realEstateArray select 15) == 0)then
				{
				[[0,format["%2 has tazed %1", _player getVariable["name",name _player], _shooter getVariable["name",name _shooter]]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				}
				else
				{
				[[0,format["%2 has tazed someone", _player getVariable["name",name _player], _shooter getVariable["name",name _shooter]]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
				};
			}
			else
			{
			if((DS_realEstateArray select 15) == 0)then
				{
				[[0,format["%2 has tazed %1", _player getVariable["name",name _player], _shooter getVariable["name",name _shooter]]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
				}
				else
				{
				[[0,format["%2 has tazed someone", _player getVariable["name",name _player], _shooter getVariable["name",name _shooter]]],"DS_fnc_globalMessage",west,false] spawn BIS_fnc_MP;
				};
			};



		_player attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		[[player,"amovppnemstpsraswrfldnon"],"DS_fnc_animSync",true,false] spawn DS_fnc_MP;
		if(!(player getVariable["Escorted",false])) then 
			{
			detach player;
			};
		player setVariable ["surrender", false, true];
		player allowDamage true;
		disableUserInput false;
		DS_tazed = false;
	};
}
	else
{
	_player allowDamage true;
	DS_tazed = false;
};
