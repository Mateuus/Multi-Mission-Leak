moveOut player;
[] spawn
{
	sleep 1.5;
	player playmove "halofreefall_f";
	while {(getpos player) select 2 > 1} do
	{
		player setvelocity [0,0,-6];
	};
	player switchmove "";
	[player,""] remoteExecCall ["life_fnc_animSync"];
};