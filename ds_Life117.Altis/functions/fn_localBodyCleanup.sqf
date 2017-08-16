/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Cleans up dead bodies locally
*/

{
	_revive = _x getVariable ["revive",false];
	if(!_revive)then
		{
		deleteVehicle _x;
		};
}forEach allDeadMen;