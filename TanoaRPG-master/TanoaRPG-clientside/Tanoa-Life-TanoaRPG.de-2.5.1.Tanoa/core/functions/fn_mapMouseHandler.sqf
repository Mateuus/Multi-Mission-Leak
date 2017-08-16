/*
	File: fn_mapMauseHandler.sqf
	Author: CooliMC
	
	Description:
	For Drawn Marker Detection on the Main Map
*/
private ["_ctrl","_button"];


_button = _newthis select 1;
_ctrl = _newthis select 5;

if(_button == 0) then
{
	[] spawn
	{
		_time = time;
		waitUntil{((!isNull (findDisplay 54))||((_time + 2) <= time))};
		
		if((_time + 2) > time) then
		{
			[player, objNull, 1, "[MAP-MARKER]", "Hat einen Marker auf die Map gemacht"] remoteExec ["TEX_FNC_LOGIT", 2];
		};
	};

	if(_ctrl) then
	{
		[player, objNull, 1, "[MAP-MARKER]", "Hat einen Marker auf die Map gemalt"] remoteExec ["TEX_FNC_LOGIT", 2];
	};
};

false;