/*
	File: fn_earPlugs.sqf
	Auhtor: Bryan "Tonic" Boardwine
	
	Description:
	Lowers sound.
*/
life_earPlugs = !life_earPlugs;
if (life_earPlugs) then 
{
	1 fadeSound 0.1;
	titleText ["Ear Plugs in...", "PLAIN"];
}
else
{
	1 fadeSound 1;
	titleText ["Ear Plugs out...", "PLAIN"];
};