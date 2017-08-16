// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: fn_openParachute.sqf
//	@file Author: AgentRev

if (!alive player) exitWith {};
if (vehicle player != player) exitWith {};

private "_preCheck";
_preCheck = {{player distance _x < 10 max (sizeOf typeOf _x)} count (player nearEntities ["Helicopter_Base_F", 20]) isEqualTo 0};

if (call _preCheck) then
{
	call life_fnc_forceOpenParachute;
}
else
{
	_preCheck spawn
	{
		waitUntil {sleep 0.1; call _this};
		[] call life_fnc_forceOpenParachute;
	};
};
