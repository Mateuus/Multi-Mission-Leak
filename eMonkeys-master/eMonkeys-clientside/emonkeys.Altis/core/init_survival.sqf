[] spawn
{
	while{true} do
	{
		waitUntil {("ItemRadio" in (assignedItems  player))};
		[[player,EMonkeys_sidechat,playerSide,1],"TON_fnc_managesc",false,false] spawn EMonkeys_fnc_MP;
		waitUntil {!("ItemRadio" in (assignedItems  player))};
		[[player,EMonkeys_sidechat,playerSide,0],"TON_fnc_managesc",false,false] spawn EMonkeys_fnc_MP;
		uisleep 5;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		EMonkeys_maxWeight = EMonkeys_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			EMonkeys_maxWeight = EMonkeys_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		uisleep 2;
		if(EMonkeys_carryWeight > EMonkeys_maxWeight && !isForcedWalk player) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Du trägst zuviel bei dir!";
		} 
			else 
		{
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {(EMonkeys_dr164 > 0)};
		while{(EMonkeys_dr164 > 0)} do 
		{
			if(EMonkeys_dr164 > 0.08) then 
			{
				"radialBlur" ppEffectEnable true;
				"radialBlur" ppEffectAdjust[0.08, 0,0.35,0.37];
				"radialBlur" ppEffectCommit 3;
				uisleep 240;
				EMonkeys_dr164 = EMonkeys_dr164 - 0.02;
			} 
				else 
			{
				"radialBlur" ppEffectEnable true;
				"radialBlur" ppEffectAdjust[0.05, 0,0.36,0.38];
				"radialBlur" ppEffectCommit 1;
				uisleep 180;
				EMonkeys_dr164 = EMonkeys_dr164 - 0.02;
			};
		};
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		"radialBlur" ppEffectEnable false;
		EMonkeys_dr164 = 0;
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		uisleep 2;
		if(((!alive player) || (player getVariable["onkill",FALSE]))) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					EMonkeys_thi164 = EMonkeys_thi164 - 5;
					EMonkeys_hu164 = EMonkeys_hu164 - 5;
					[] call EMonkeys_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

if(EMonkeys_HC2_isActive) then
{
	[] spawn  
	{
		EMonkeys_packetlistp = [];
		{
			if ((_x select 1) == getPlayerUID player) then 
			{
				EMonkeys_packetlistp pushback _x;
			};
		} forEach EMonkeys_packetlist;
		[] call EMonkeys_fnc_hudUpdate;   
	};
};