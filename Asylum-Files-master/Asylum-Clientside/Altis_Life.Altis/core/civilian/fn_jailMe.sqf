/*
	File: fn_jailMe.sqf
	Author Bryan "Tonic" Boardwine

	Description:
	Once word is received by the server the rest of the jail execution is completed.
*/
private["_ret","_bad","_bail","_esc","_countDown","_jailed"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_jailSpawn = [_this,1,"",[""]] call BIS_fnc_param;
_jailRelease = [_this,2,"",[""]] call BIS_fnc_param;
//_jailed = true;

life_is_arrested = true;
life_bail_paid = false;
life_breakout = false;
[false] call life_fnc_seizePlayerIllegalAction;
[] call life_fnc_civFetchGear;
player setVariable ["parole", nil, true];
player setVariable ["paroleViolated", nil, true];
player setVariable ["prisoner", true, true];
player setVariable ["blindfolded", nil, true];
player setVariable ["copLevel", 0];
removeVest player;
removeHeadgear player;
removeBackpack player;
player setDamage 0;

player forceAddUniform "U_C_Scientist";
[] call life_fnc_equipGear;

player setVariable["can_revive", nil, true];
player setDamage 0;
[0] call life_fnc_setPain;
[false] call life_fnc_brokenLeg;

if(count _ret > 0) then {
	life_bail_amount = (_ret select 3);
	if (life_jail_time < 1) then { life_jail_time = _ret select 4; };
} else {
	life_bail_amount = 1500;
	life_jail_time = 5 * 60;
};
if (life_jail_time > 2700) then { life_jail_time = 2700; };
if(!isNil "was_interrogated") then {life_jail_time = round(life_jail_time * 1.33); was_interrogated = nil};
_esc = false;
_bail = false;

life_canpay_bail = nil;

[] call life_fnc_sessionUpdate;

_endTime = round (time + life_jail_time);
while {life_is_arrested} do
{
	removeAllWeapons player;

	life_jail_time = round (_endTime - time);
	life_can_trial = ((life_jail_time > 900) && !life_requested_trial);

	if(life_jail_time > 0) then
	{
		_countDown = if(life_jail_time > 60) then {format["%1 minute(s)",round(life_jail_time / 60)]} else {format["%1 second(s)",life_jail_time]};
		if (life_bail_amount >= life_executionThreshold && (life_configuration select 9)) then { _countDown = format["ON DEATH ROW\nTrial required for survival.\n\n%1", _countDown]; };
		hintSilent format["Time Remaining:\n %1\n\nCan pay bail: %3\nBail Price: $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
		//_jailed = true;
	};

	if(life_bail_paid) exitWith
	{
		_bail = true;
		//_jailed = false;
	};

	if (life_breakout) exitWith {};

	if(worldName != "Australia" && player distance (getMarkerPos _jailSpawn) > 90 && !(player getVariable ["defendant",false]) && !life_laser_inprogress) then // exitWith
	{
		systemChat "Get away from the walls!";
		player setPos (getMarkerPos _jailSpawn);
		//_esc = true;
	};

	if(worldName == "Australia" && player distance (getMarkerPos "corrections") > 80 && !(player getVariable ["defendant",false]) && !life_laser_inprogress) then // exitWith
	{
		life_breakout = true;
	};

	if(life_jail_time < 1) exitWith {hint ""};
	if(!alive player && (life_jail_time > 0)) exitWith
	{
		//_jailed = false;
	};

	life_thirst = 100;
	life_hunger = 100;
	[] call life_fnc_hudUpdate;
};

waitUntil { !life_isdowned };

switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		life_breakout = false;
		hint "You have been released from prison.";
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		player setPos (getMarkerPos _jailRelease);
		[] call life_fnc_civLoadGear;
		[] call life_fnc_sessionUpdate;
		[] call life_fnc_equipGear;
		//_jailed = false;
	};

	case (life_breakout) :
	{
		life_is_arrested = false;
		life_breakout = false;
		hint "You have escaped from prison, you still retain your previous crimes and now have a count of escaping prison.";
		[[0,format["%1 has escaped from prison!",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		if (worldName != "Australia") then { player setPos (getMarkerPos _jailRelease); };
		//[[getPlayerUID player],"life_fnc_wantedPardon",false,false] spawn life_fnc_MP;
		sleep 2;
		serv_killed = [player,"901"];
		publicVariableServer "serv_killed";
	};

	case (alive player && !life_breakout && !_bail) :
	{
		life_is_arrested = false;
		life_breakout = false;
		hint "You have served your time in jail and have been released.";
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		[] call life_fnc_civLoadGear;
		[] call life_fnc_sessionUpdate;
		[] call life_fnc_equipGear;
		if (life_bail_amount >= life_executionThreshold && (life_configuration select 9)) then
		{
			playSound "handcuffs";
			cutText["Your head is covered while sitting on the chair.","BLACK FADED"];
			0 cutFadeOut 999999;
			if (isWeaponDeployed player) then { player playMove ""; };
			player setPos (getMarkerPos "respawn_civilian");
			sleep 1;
			playSound "elechair";
			sleep 9;
			player setDamage 1;
			[["999999",4000,"add",player],"ASY_fnc_updateGangBank",false,false] spawn life_fnc_MP;
			life_respawned = true;
			cutText ["", "BLACK IN", 0.75];
			[] call life_fnc_spawnMenu;
		}
		else
		{
			if (isWeaponDeployed player) then { player playMove ""; };
			player setPos (getMarkerPos _jailRelease);
		};
	};
};
player setVariable ["arrested", nil, true];
player setVariable ["prisoner", nil, true];
life_abort_enabled = true;
life_can_trial = false;
life_requested_trial = false;
life_jail_time = 0;
life_inv_shank = 0;
profileNamespace setVariable["asylum",false];
