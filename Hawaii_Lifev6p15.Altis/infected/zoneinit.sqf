_myzone= _this;
//_myzone spawn fncPop;
_playerInZone=true;
missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
_targetList=[];
missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
_deleteInfected=false;
missionNamespace setVariable [format ["%1_deleteInfected", _myzone], _deleteInfected];

// Zone player list , check toutes les 5s///////////////////////////////////////////////////////////////
while {_playerInZone} do
{
	_targetList= [];
	{
		  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
		if ((alive _x )and( side _x != east )) then //List BLUFOR players & IA
		{
			_targetList = _targetList + [_x];
		};
		
	
	} forEach list _myzone;
	_targetCount= count _targetList;
	if (_targetCount<1)then
	{
		_playerInZone=false;
		missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
	}else{
		_playerInZone=true;
		missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
		missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
	};
	sleep 12;
};
