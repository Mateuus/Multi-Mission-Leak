private["_rankStr"];

if(!(playerSide isEqualTo west))exitwith{};

_rankStr = "";

player setVariable["rank",(DS_copLevel),true];
switch(DS_copLevel)do
	{
	case 0:
		{
		_rankStr = "Rent-A-Cop";
		};
	case 1:
		{
		_rankStr = "Cadet";
		};
	case 2:
		{
		_rankStr = "Constable";
		};
	case 3:
		{
		_rankStr = "Senior Constable";
		};
	case 4:
		{
		_rankStr = "Sergeant";
		};
	case 5:
		{
		_rankStr = "Senior Sergeant";
		};
	case 6:
		{
		_rankStr = "Lieutenant";
		};
	case 7:
		{
		_rankStr = "Superintendent";
		};
	case 8:
		{
		_rankStr = "Assistant Commissioner";
		};
	case 9:
		{
		_rankStr = "Deputy Commissioner";
		};
	case 10:
		{
		_rankStr = "Commissioner";
		};
	};
if(getPlayerUID player in ["76561197992718808"])then
	{
	_rankStr = "Chief Of Police";
	};
player setVariable ["rankStr",_rankStr,true];