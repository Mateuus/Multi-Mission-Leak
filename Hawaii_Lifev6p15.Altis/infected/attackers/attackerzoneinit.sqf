_myzone= _this;
_targetList=[];
missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
_targetList= [];
{
	  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
	if (alive _x ) then //List BLUFOR players & IA
	{
		_targetList = _targetList + [_x];
	};
	

} forEach list _myzone;
missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];