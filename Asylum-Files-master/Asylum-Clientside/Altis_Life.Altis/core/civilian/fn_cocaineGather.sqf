/*
	File: fn_cocaineGather.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Monitors player in cocaine gathering pen.
*/

private ["_enabled","_pure","_item","_itemName","_sum"];

_enabled = [_this,0,true,[true]] call BIS_fnc_param;
_pure = [_this,1,false,[false]] call BIS_fnc_param;
_item = if (_pure) then { "cocapaste" } else { "cocaine" };
_itemName = [([_item,0] call life_fnc_varHandle)] call life_fnc_varToStr;
life_cocaine_gather = _enabled;

if (life_cocaine_gather) then
{
	if (_pure) then
	{
		[] spawn
		{
			_action1 = player addAction ["<t color='#0099FF'>Add Coca Leaves</t>",{
				if (life_inv_cocaleaf == 0) exitWith { hint "You don't have any coca leaves! Gather it from coca plants." };
				life_coca_leaves = life_coca_leaves + life_inv_cocaleaf;
				publicVariable "life_coca_leaves";
				hint format["You've added coca leaves to the pit. Stomp around the pit to produce coca paste.", life_inv_cocaleaf];
				[false,"cocaleaf",life_inv_cocaleaf] call life_fnc_handleInv;
			}];
			_action2 = player addAction ["Inspect Pit",{
				hint format["There is enough coca in this pit to produce %1 units of coca paste.", life_coca_leaves];
			}];
			waitUntil {!life_cocaine_gather};
			player removeAction _action1;
			player removeAction _action2;
		};
	};
	[_item,_itemName,_pure] spawn
	{
		_item = _this select 0;
		_itemName = _this select 1;
		_pure = _this select 2;
		_checks = 0;
		while {life_cocaine_gather && (life_carryWeight < life_maxWeight)} do
		{
			_qtyPerTick = 1;
			if ((life_turf_list select 0) select 1 == life_gang) then { _qtyPerTick = 2 };
			_sum = [_item,_qtyPerTick,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
			if (_sum < _qtyPerTick) exitWith { titleText [format["You can't hold more %1.", _itemName],"PLAIN"]; life_cocaine_gather = false; };
			sleep 0.5;
			if (speed player > 1) then
			{
				playSound format["CokeSlosh%1", ceil (random 3)];
				_checks = _checks + 1;
				if (_checks == 8) then
				{
					if (_pure && life_coca_leaves > 0) then
					{
						if (_qtyPerTick > life_coca_leaves) then { _qtyPerTick = life_coca_leaves };
						if ([true,_item,_qtyPerTick] call life_fnc_handleInv) then
						{
							life_coca_leaves = life_coca_leaves - _qtyPerTick;
							if (life_coca_leaves < 0) then { life_coca_leaves = 0 };
							publicVariable "life_coca_leaves";
							titleText [format["You produced %1 coca paste.", _qtyPerTick],"PLAIN"];
						};
						_checks = 0;
					};
					if (!_pure) then
					{
						if (8 in life_gangtalents) then
						{
							if (random 3 < 1) then { _qtyPerTick = _qtyPerTick + 1 };
						};
						if ([true,_item,_qtyPerTick] call life_fnc_handleInv) then
						{
							titleText [format["You produced %1 cocaine.", _qtyPerTick],"PLAIN"];
						};
						_checks = 0;
					};
				};
			}
			else { _checks = 0; };
		};
	};
};