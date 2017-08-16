/*
	File: fn_sidechat.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sidechat
*/
if(life_ringer) then
{
	life_ringer = false;
}
else
{
	life_ringer = true;
};
[] call life_fnc_settingsMenu;