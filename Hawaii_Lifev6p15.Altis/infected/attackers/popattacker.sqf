private ["_distance","_houseList"];
_myZone=_this select 0;
_mkr=_this select 1;
_totalInfected= _this select 2;
_probability=25;
//_totalWaves=2;
_infectedCount=0;
_exclusionList=["Land_Pier_F","Land_Pier_small_F","Land_NavigLight","Land_LampHarbour_F"];

_mkr setmarkerAlpha 0;
_pos=markerpos _mkr;
_mkrY= getmarkerSize _mkr select 0;
_mkrX= getmarkerSize _mkr select 1;

_distance=_mkrX;
if (_mkrY > _mkrX)then
{
	_distance=_mkrY;
};

_houseList= _pos nearObjects ["House",_distance];
while {_totalInfected >= _infectedCount}do
{
	{
		_house=_X;
		if (!(typeOf _house in _exclusionList))then
		{
			for "_n" from 0 to 50 do {
				_buildingPos=_house buildingpos _n;
				if (str _buildingPos == "[0,0,0]") exitwith {};
				if (_probability > random 100)then
				{
					_object=[_buildingPos, 180, "O_Soldier_F", EAST] call bis_fnc_spawnvehicle;
					[_object,_myZone] spawn fncAttacker;
				sleep 0.5
				};	
			};
		};				
		_infectedCount= _infectedCount + 1;
		sleep 0.1;
	}foreach _houseList;
	sleep 2;
};
