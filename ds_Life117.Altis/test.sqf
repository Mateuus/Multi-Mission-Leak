private ["_fail","_sleep"];

if(DS_canWork)exitwith{hint "You are already repairing something"};
DS_canWork = true;

hint "Repairing nearby objects......";
_fail = false;

sleep 2;
_sleep = random 120;
_price = 0;
_object = nearestBuilding player;

if(damage _object == 0)then
	{
	_object = nearestobjects [player,["House"],50];
	_object = _object select 0;
	if(damage _object == 0)then
		{
		hint "No nearby damaged building detected (Not all buildings can be repaired";
		}
		else
		{
		_objectStr = getText(configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName");
		hint format ["You are repairing a %1, this will take a few minutes to complete",_objectStr];
		sleep 60 + _sleep;
		hint format ["You have repaired a %1 and been paid $15k. You may seek additional payment from building owners",_objectStr];
		_object setDamage 0;
		[5000,true,true] call DS_fnc_handleMoney;
		};
	}
	else
	{
	_objectStr = getText(configFile >> "CfgVehicles" >> (typeOf _object) >> "displayName");
	hint format ["You are repairing a %1, this will take a few minutes to complete",_objectStr];
	sleep 60 + _sleep;
	_object setDamage 0;
	hint format ["You have repaired a %1 and been paid $15k. You may seek additional payment from building owners",_objectStr];
	[15000,true,true] call DS_fnc_handleMoney;
	};

DS_canWork = false;