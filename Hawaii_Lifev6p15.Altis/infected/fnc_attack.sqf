private ["_me","_target","_targetPos","_distance"];
_me=_this select 0;
_target= _this select 1;
_myzone=_this select 2;
_mypos=getpos _me;
_imHere=false;
_onAttack=true;
while{(alive _me)and _onAttack}do
{
	if(!(vehicle _target isKindOf "man"))then
	{
		_isInVehicle=missionNamespace getVariable [format ["%1_playerIn", _target],[]];
		if(!(_isInVehicle select 0))then
		{
			_target=_isInVehicle select 1;
		};
	};
	_targetPos = getposATL _target;
	if(surfaceIsWater _targetPos) then
	{
		_targetPos = getposASL _target;
	};
	_distance=(_targetPos distance _me);
	(_me)doMove(_targetPos);
	_me setSpeedMode "FULL";
	if((_distance<=20)and(!_imHere))then
	{
		_imHere=true;
	};
	if(_distance<=2.5)then
	{	
		if ((alive _me) and (alive _target))then
		{
			_me switchMove "AwopPercMstpSgthWnonDnon_throw";
			sleep 0.2;
			_target setDamage (damage _target + 0.24);
			sleep 2;
		};
	};
	if(!alive _target)then
	{
		sleep 2;
		_onAttack=false;
	};
	if(_distance>100)then
	{
		_onAttack=false;
	};
	if(!alive _me)then
	{
		infectedCount = infectedCount - 1;
		_onAttack=false;
		missionNamespace setVariable [format ["%1_onAttack", _me],_onAttack];
		_me removeAllEventHandlers "hit";
		_me removeAllEventHandlers "Killed";
		sleep 10;
		deleteVehicle _me;
	};
	_asleep= 1+(random 1);
	sleep _asleep;
};