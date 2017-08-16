private ["_me","_target","_targetPos","_distance"];
_me=(_this select 0)select 0;
_myzone=_this select 1;
infectedCount = infectedCount + 1;
_me disableAI "FSM";
_me disableAI "AUTOTARGET";
_me disableAI "TARGET";
_me setBehaviour "CARELESS";
_me enableFatigue false;
_me setVariable ["BIS_noCoreConversations", true];
[_me] join infected;
infected setCombatMode "CARELESS";
infected setSpeedMode "FULL";
_initialPos=getPos _me;
[_me] spawn fncStuff;
_target= missionNamespace getVariable [format ["%1_TargetList", _myzone], []];
_target= _target select 0;
_mypos=getpos _me;
_imHere=false;
_onAttack=true;
missionNamespace setVariable [format ["%1_nextTarget", _me], _target];
_me addEventHandler ["hit",{
	(_this select 0) lookAt (_this select 1);
	missionNamespace setVariable [format ["%1_nextTarget",_this select 0], _this select 1];
}];
while{alive _me}do
{
	_nextTarget=missionNamespace getVariable [format ["%1_nextTarget", _me], []];
	if (_nextTarget != _target) then
	{
		_target=_nextTarget;
	};
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
		_me doMove _initialPos;
	};
	_asleep= 1+(random 1);
	sleep _asleep;
	
};

if(!alive _me)then
{
	infectedCount = infectedCount - 1;
	_me removeAllEventHandlers "hit";
	_me removeAllEventHandlers "Killed";
	sleep 10;
	deleteVehicle _me;
};