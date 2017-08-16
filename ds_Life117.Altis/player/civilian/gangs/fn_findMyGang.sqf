/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Returns the players current gang object
*/

disableSerialization;
private["_uid","_myGangObject"];
_myGangObject = [false,objNull];
_uid = (getPlayerUID player);
{
	if(_uid in _x)then
		{
		_myGangObject = [true,(_x select 0)];
		};
}forEach DS_gangList;
_myGangObject;
		