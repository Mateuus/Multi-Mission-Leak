private ["_distance","_houseList"];

_mkr=_this;
_probability=10;
_exclusionList=[];
_pos=getpos _mkr;
	_mkrY= (triggerArea _mkr) select 0;
	_mkrX= (triggerArea _mkr) select 1;

_distance=_mkrX;
if (_mkrY > _mkrX)then
{
	_distance=_mkrY;
};

_houseList= _pos nearObjects ["House",_distance];
_houseCount= count _houseList;
sleep 1;

if (_houseCount >=100)then{_probability=10};
if ((_houseCount >=60)and(_houseCount<100))then{_probability=15};
if ((_houseCount >=30)and(_houseCount<60))then{_probability=25};
if ((_houseCount >10)and(_houseCount<30))then{_probability=40};
if (_houseCount <=10)then{_probability=70};
{
	_house=_X;
	if (!(typeOf _house in _exclusionList))then
	{
		for "_n" from 0 to 50 do {
			if (infectedCount > 70) exitWith{};
			_buildingPos=_house buildingpos _n;
			if (str _buildingPos == "[0,0,0]") exitwith {};

				_object=[_buildingPos, 180, "O_Soldier_F", EAST] call bis_fnc_spawnvehicle;
				[_object,_mkr] spawn infectedinit;
	
		sleep 0.8;
		};
	};
	sleep 0.1;
}foreach _houseList;
sleep 1;
