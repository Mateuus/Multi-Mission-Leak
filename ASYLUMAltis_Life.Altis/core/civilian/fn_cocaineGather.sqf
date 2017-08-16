/*
	File: fn_cocaineGather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Monitors player in cocaine gathering pen.
*/

private ["_enabled","_item","_itemName","_sum"];

_enabled = [_this,0,true,[true]] call BIS_fnc_param;
_item = "cocaine";
_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
life_cocaine_gather = _enabled;

if (life_cocaine_gather) then
{
	[_item,_itemName] spawn
	{
		_item = _this select 0;
		_itemName = _this select 1;
		_checks = 0;
		_qtyPerTick = 1;
		if ((life_turf_list select 0) select 1 == life_gang) then { _qtyPerTick = 2 };
		while {life_cocaine_gather && (life_carryWeight < life_maxWeight)} do
		{
			_sum = [_item,_qtyPerTick,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
			if (_sum < _qtyPerTick) exitWith { titleText [format["You can't hold more %1.", _itemName],"PLAIN"]; life_cocaine_gather = false; };
			sleep 0.5;
			if (speed player > 1) then
			{
				playSound format["CokeSlosh%1", ceil (random 3)];
				_checks = _checks + 1;
				if (_checks == 8) then
				{
					if ([true,"cocaine",_qtyPerTick] call life_fnc_handleInv) then
					{
						titleText [format["You produced %1.", _itemName],"PLAIN"];
					};
					_checks = 0; 
				};
			}
			else { _checks = 0; };
		};
	};
};