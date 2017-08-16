/*
File: fn_fadeSound.sqf
Auhtor: Michael Francis

Description:
Fades out sound.
*/
DWEV_fadeSound = !DWEV_fadeSound;

if (DWEV_fadeSound) then
{
	[1,0.05] spawn DWEV_fnc_handleSound;
	titleText ["Dein Sound wurde leise gestellt.", "PLAIN"];
}
else
{
	[1] spawn DWEV_fnc_handleSound;
	titleText ["Dein Sound ist nun wieder normal.", "PLAIN"];
};