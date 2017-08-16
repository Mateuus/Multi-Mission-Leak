/* 
EMP VEHICLE SCRIPT
File: menuCooldownCounter.sqf
Author: DemoCore
Date: 2014.05.05
Version: 1.00
*/

_idc = _this select 0;
_cooldown = _this select 1;
_vehicle = _this select 2;

while{(_cooldown - time > 0) or !dialog} do
{
	if(_vehicle == vehicle player) then
	{
		ctrlSetText [_idc, str(_cooldown - time)]; 
	};
};
if(_vehicle == vehicle player) then
{
	ctrlSetText [_idc, ""]; 
};