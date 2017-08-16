_broken = [_this,0,false,[false]] call BIS_fnc_param;

if (_broken) then
{
	if (ES_brokenLeg) exitWith {};
	player setVariable["broken", _broken, true];
	PlaySound "beine";
	systemChat "You feel and hear your leg break!";
	player playActionNow "PlayerProne";
}
else
{
	player setVariable["broken", nil, true];
};

ES_brokenLeg = _broken;

[] call ES_fnc_hudUpdate;

if (_broken) then
{
	while {ES_brokenLeg} do
	{
		if (stance player != "PRONE" && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false])) then { player playActionNow "PlayerProne"; };
		sleep 2;
	};
};