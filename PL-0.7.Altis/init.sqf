StartProgress = false;
[] execVM "core\scripts\kron.sqf";
[] execVM "core\scripts\briefing.sqf";
[] execVM "core\scripts\statusbar.sqf";
[] execVM "SelectChance_FNC.sqf";
StartProgress = true;

0 setOvercast 0;
0 setRain 0;
0 setFog 0;

[] spawn
{
	while {true} do
	{
		0 setfog 0;
		sleep 1;
	};  
};