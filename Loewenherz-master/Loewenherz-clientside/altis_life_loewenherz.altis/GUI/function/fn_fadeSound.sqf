/*
	File: fn_fadeSound.sqf
	Auhtor: Michael Francis

	Description:
	Fades out sound.
*/
private["_ui","_earPlug"];
lhm_fadeSound = !lhm_fadeSound;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
_earPlug = _ui displayCtrl 23600;

if (lhm_fadeSound) then
{
	1 fadeSound 0.1; // Faded to 10%
	titleText ["Spielsound verringert.", "PLAIN DOWN"];
	//_earPlug ctrlShow true;
}
else
{
	1 fadeSound 1; // Returned to 100%
	titleText ["Spielsound wieder normal.", "PLAIN DOWN"];
	//_earPlug ctrlShow false;
};