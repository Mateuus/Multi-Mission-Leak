/*
	File: fn_revived.sqf
	Author: John "Paratus" VanderZwet

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir","_pos","_hospital"];
_medic = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_hospital = [_this,1,false,[false]] call BIS_fnc_param;
_admin = param[2,false,[false]];
life_respawned = true;
life_alive = true;

if (life_deadSWAT) exitWith {};
[life_dead_gear] spawn life_fnc_loadDeadGear;

if((life_corpse distance (getPos _medic)) > 50) then {_hospital = true;};

if (_hospital && !_admin) then
{
	cutText["You wake up in a hospital, feeling much better.","BLACK FADED"];
	0 cutFadeOut 6;
	player setDir (markerDir "revive");
	player setPos (markerPos "revive");
}
else
{
	player setDir (getDir life_corpse);
	player setPosASL (visiblePositionASL life_corpse);
	if(_admin) exitWith {titleText[format["The admin %1 has revived you",name _medic],"PLAIN"]};
	hint format["%1 has revived you and a fee of $%2 was taken from your bank account for their services.",name _medic,[life_revive_fee] call life_fnc_numberText];
};

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
if (!_hospital && !_admin) then
{
	if(life_atmmoney > life_revive_fee) then {
		["atm","take",life_revive_fee] call life_fnc_uC;
	} else {
		["atm","set",0] call life_fnc_uC;
	};
};

//Bring me back to life.
[[player,_medic],"life_fnc_medicRespondDone",true,FALSE] call life_fnc_MP;

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
deleteVehicle life_corpse;

if (!isNull _medic && playerSide != independent) then
{
	if (!_admin && (side _medic == civilian || (side _medic == west && !(str _medic in ["cop_medic_1","cop_medic_2","cop_medic_3","cop_medic_4"] || _medic getVariable["copLevel", 0] > 5)))) then
	{
		[] spawn
		{
			player setVariable["can_revive",(player getVariable["can_revive", time]) + 600, true];
			life_revive_fatigue = time + 40;
			[2,"You have been revived by an unprofessional; you feel weakened."] call life_fnc_broadcast;
			player setDamage 0.25;
			player enableFatigue true;
			player forceWalk true;
			while { time < life_revive_fatigue && alive player } do
			{
				if (getFatigue player < 0.9) then { player setFatigue 1; };
				sleep 1;
			};
			if (alive player) then { [2,"You feel a bit better now."] call life_fnc_broadcast; };
			player setFatigue 0.5;
			life_revive_fatigue = 0;
			player forceWalk false;
		};
	};
	//else { player setVariable["can_revive",(player getVariable["can_revive", time]) + 360, true]; };
};

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["last_revived",time,true];
[] call life_fnc_equipGear;
[] call life_fnc_sessionUpdate;
[] spawn life_fnc_hudUpdate;