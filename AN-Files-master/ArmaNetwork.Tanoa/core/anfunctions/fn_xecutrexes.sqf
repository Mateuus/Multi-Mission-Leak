/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis

	Description:
	Fades out sound.
*/
life_fadeSound = !life_fadeSound;
if (life_fadeSound) then {
	1 fadeSound 0.1;
	[true,1205] call life_fnc_spunadruc;
} else {
	1 fadeSound 1;
	[false,1205] call life_fnc_spunadruc;
};
