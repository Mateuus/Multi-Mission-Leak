[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2";};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3";};
			};
		};
	};
	
	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
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
		if (backpack player == "B_Carryall_cbr") then { _load = 76; };
		if (backpack player == "B_Carryall_oli") then { _load = 76; };
		if (backpack player == "B_Carryall_khk") then { _load = 76; };
		if (backpack player == "B_Carryall_mcamo") then { _load = 76; };
		if (backpack player == "B_Carryall_oucamo") then { _load = 76; };
		if (backpack player == "B_Carryall_ocamo") then { _load = 76; };
		if (backpack player == "B_Carryall_ghex_F") then { _load = 76; };
		if (backpack player == "B_Bergen_tna_F") then { _load = 76; };
		if (backpack player == "B_Bergen_mcamo_F") then { _load = 76; };
		if (backpack player == "B_Bergen_dgtl_F") then { _load = 76; };
		if (backpack player == "B_UAV_01_backpack_F") then { _load = 76; };
												
		life_maxWeight = life_maxWeightT + _load;
		if(playerSide == west) then {(unitBackpack player) setObjectTextureGlobal [0,""];}; // <---- Backpack invisible for COPS
        if(playerSide == independent) then {(unitBackpack player) setObjectTextureGlobal [0,""];}; // <----- Backpack invisible for MEDS
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
		sleep 0.3;
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 0;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
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
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};
/*
[] spawn
{
while {true} do
{
private["_damage"];
sleep 1;
//Der Marker uran_area_1 muss auf der Map vorhanden sein -> Dies ist unsere Damage-Zone.
//Das "< 800" sagt, dass wenn ein Spieler sich im Umkreis < 800Metern befindet, die Befehle darunter ausgeführt werden - sonst nicht.
if(player distance (getMarkerPos "uran_area_1") < 800) then
{
//Natürlich kann das was angezeigt wird verändert werden.
hint format["ACHTUNG \n\nRADIOAKTIVE STRAHLUNG \n\nBetreten nur mit Schutzanzug. "];
};
//Hier wird nochmal die Position des Spielers abgefragt und die Befehle darunter dauerhaft ausgeführt SOLANGE
//sich der Spieler innerhalb von 800 Metern in der Area (uran_area_1) befindet.
while{player distance (getMarkerPos "uran_area_1") < 800} do
{
//Hier eine Abfrage, ob der Spieler eine spezielle Uniform trägt.
//Ist dies der Fall, dann passiert quasi nichts - ist dies nicht der Fall, dann werden die weiteren Befehle ausgeführt.
if (uniform player != "U_C_Scientist") then
{
sleep 10;
hint "Die Radioaktive Strahlung zerfrisst deinen Körper!";
_damage = damage player;
//Hier fügen wir dem Spieler 10 Schaden hinzu. (durch das sleep 10 oben, alle 10 Sekunden)
_damage = _damage + 0.1;
player setDamage (_damage);
[] call life_fnc_hudUpdate;
//Dies ist noch ein kleiner Effekt, wo die Sicht ein wenig verschwimmt.
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;
};
};
//Wenn der Spieler wieder ausserhalb der Area ist, dann ist die Sicht noch weitere 10 Sekunden verschwommen (Nachwirkungen)
sleep 10;
"dynamicBlur" ppEffectEnable false;
};
}; 
*/
[] spawn {
while{true} do
{
waitUntil {(player getVariable "missingOrgan")};
life_max_health = .50;
while{(player getVariable "missingOrgan")} do {
life_thirst = 50;
life_hunger = 50;
if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;
sleep 4;
};
"dynamicBlur" ppEffectEnable false;
life_max_health = 1;
};
};