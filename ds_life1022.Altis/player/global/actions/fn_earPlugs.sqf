/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Inserts or removes players earplugs
*/

_respawned = _this select 0;
if(!isNil "_respawned")exitWith
	{
	1 fadeSound 1;
	DS_earPlugs = 0;
	};

if(DS_earPlugs == 0)then
	{
	1 fadeSound 0.1;
	hint "Earplugs Inserted (Stage 1)";
	DS_earPlugs = 1;
	}
	else
	{
	if(DS_earPlugs == 1)then
		{
		1 fadeSound 0.01;
		hint "Earplugs Inserted (Stage 2)";
		DS_earPlugs = 2;
		}
		else
		{
		1 fadeSound 1;
		hint "Earplugs Removed";
		DS_earPlugs = 0;
		};
	};