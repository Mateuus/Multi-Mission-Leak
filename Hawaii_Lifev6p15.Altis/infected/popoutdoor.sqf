if(isserver)then{
	_myZone=_this select 0;
	_markName=_this select 1;
	_totalInfected= _this select 2;

	_markPos=markerpos _markName;
	_mPosX=_markPos select 0;
	_mPosY=_markPos select 1;
	_mkrY= getmarkerSize _markName select 0;
	_mkrX= getmarkerSize _markName select 1;
	_count= 0;
	while{_totalInfected >= _count}do
	{
		_rX= floor (random _mkrX);
		_rY= floor (random _mkrY);
		_markPos=[((_mPosX+_rX)-(_mkrX/2)),((_mPosY+_rY)-(_mkrY/2))];
		_object=[_markPos, 180, "O_Soldier_F", EAST] call bis_fnc_spawnvehicle;
		[_object,_myZone] spawn infectedinit; 
		_count= _count + 1;
		sleep 1;
	};
};
