/*
	File: fn_robStoreAction.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Starts the robbing process
*/

private ["_lastRobbed","_unit"];

_unit = _this select 0;

if (playerSide == west) exitWith { hint "Police can't rob stores! Damned crooked cops."; };

_lastRobbed = _unit getVariable["lastRobbed",-2000];
if ((time - _lastRobbed) < 1800) exitWith { hint "This location was recently robbed and cannot be robbed again so soon."; };
if (_unit getVariable["robProgress",false]) exitWith { hint "This store is already being robbed!"; };

[] spawn
{
	private ["_rnd"];
	titleText["Stay near this store for at least 1 minute and 5 minutes for MAX payout! You can leave earlier for a much smaller payout.","PLAIN"];
	if (44 in life_talents) then
	{
		_rnd = random (60 * 2);
		sleep _rnd;
	};
	if (!(alive player)) exitWith {};
	playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
	[[1,format["A store is being robbed by %1!", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};

_unit setVariable["lastRobbed",time,true];
life_use_atm = false;

_upp = "Robbing Store";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

[[player, _unit],"ASY_fnc_robStore",false,false] spawn life_fnc_MP;
serv_killed = [player,"211"];
publicVariableServer "serv_killed";

_robSuccess = true;
_started = time;
while{true} do
{
	sleep 1;
	_cP = _cP + 0.003333;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if (!(alive player)) exitWith { _robSuccess = false; };
	if (vehicle player != player) exitWith {};
	if (player getVariable ["restrained", false]) exitWith { _robSuccess = false; };
	if (player getVariable ["downed", false]) exitWith { _robSuccess = false; };
	if ((player distance _unit) > 15) exitWith {};
};
		
if (_robSuccess) then 
{
	_duration = (time - _started) / 60;
	_cash = round(_duration * 1500); // $1,500 per minute
	if (_cash > 5000 && (life_turf_list select 1) select 1 != life_gang) then { _cash = 5000; };
	if (_duration < 1) then { _cash = 0; }; // Less than a minute? Nadda!
	if (_cash < 1) then { _robSuccess = false; };
	[_cash,true] call life_fnc_robSuccess;
	[] spawn { sleep 300; life_use_atm = true; };
}
else
{
	[0,false] call life_fnc_robSuccess;
};

5 cutText ["","PLAIN"];