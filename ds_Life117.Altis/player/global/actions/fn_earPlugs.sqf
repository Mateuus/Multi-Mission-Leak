/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Inserts or removes players earplugs
*/

if(DS_earPlugs)then
	{
	1 fadeSound 0.1;
	hint "Earplugs Inserted";
	}
	else
	{
	1 fadeSound 1;
	hint "Earplugs Removed";
	};