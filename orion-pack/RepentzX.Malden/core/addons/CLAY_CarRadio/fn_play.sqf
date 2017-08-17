
disableSerialization;
_t = 0;
_m = 0;
_s = 1;

sleep 1;
if (isNil "CLAY_Radio_PlayCounter") then {CLAY_Radio_PlayCounter = 0;};
if (isNil "CLAY_RadioManualControl") then {CLAY_RadioManualControl = false;};

if (CLAY_Radio_PlayCounter > 0) exitWith {};
CLAY_Radio_PlayCounter = CLAY_Radio_PlayCounter + 1;

if (isNil "CLAY_RadioEventHandler") then
{
	CLAY_RadioEventHandler = addMusicEventHandler ["MusicStop",{CLAY_RadioEndTimer = true;}];
};

CLAY_RadioEndTimer = false;

while {!CLAY_RadioEndTimer} do
{
	if (_s >= 60) then
	{
		_s = 0; _m = _m + 1;
	};
	
	if (_s < 10) then
	{
		ctrlSetText [606, format ["%1:0%2", _m, _s]];
	}
	else
	{
		ctrlSetText [606, format ["%1:%2", _m, _s]];
	};
	uisleep 1;
	_s = _s + 1;
};

ctrlSetText [606, "0:00"];
if (CLAY_RadioEndTimer && !CLAY_RadioManualControl) then
{
	["next", 0] spawn Repentz_fnc_controls;
};

CLAY_Radio_PlayCounter = CLAY_Radio_PlayCounter - 1;