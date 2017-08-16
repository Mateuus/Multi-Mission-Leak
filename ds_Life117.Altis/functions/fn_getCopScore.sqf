/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	return current cop score depending on online cops, their ranks and if pubblies are allowed out or not
*/
private["_pubsOut"];

if(!(miscInfoArray select 7))then
	{
	_pubsOut = true;
	}
	else
	{
	_pubsOut = false;
	};
	
_copsRanks = 0;

{
	if((side _x) == west)then
		{
		_copsRanks = _copsRanks + (_x getVariable["rank",0]);	
		};
}forEach playableUnits;

if(_pubsOut)then{_copsRanks = _copsRanks + 4;};

_copsRanks;		