if (!license_civ_hack) exitWith {hint "Du hast keine Hack-Kentnisse, du benötigst erst eine IT-Ausbildung"};
if (life_level < 6 && playerside == civilian) exitWith {hint "Du musst erst Level 6 erreicht haben um das Kraftwerk hacken zu können!"};
if((west countside playableUnits) < 2 && playerSide == civilian) exitwith {hint "Es müssen 2 oder mehr Polizisten online sein!"};

private["_types","_city","_onoff","_lamps"];
_types = ["Land_PortableLight_double_F","Lamps_Base_F", "PowerLines_base_F", "Land_LampAirport_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampSolar_F", "Land_LampShabby_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampDecor_F", "Powerpolewooden_l_F", "Lampdecor_F", "Land_Powerpolewooden_l_F"];
_city = _this select 3 select 0;
_onoff = _this select 3 select 1;

[_this select 0,1] call Bis_fnc_DataTerminalAnimate;

switch(_city) do {
	case 0: {
		if (life_kw_kavala) exitWith {hint "Das Kraftwerk ist bereits ausgeschaltet"};
		if (playerside == civilian) then {
			
		_sleep = 0.1;
		_cP = 0.01;
		_upp = "Kraftwerk wird gehackt...";

		_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false};
			
		hint "Du hast das Kraftwerk gehackt, der Strom in Kavala wurde abgeschaltet.";
		[strom_kavala,"shutdown"] remoteExecCall ["say3D",0];
		} else {
			hint "Du hast den Strom in Kavala wieder eingeschaltet.";
		};
		
		{_x setdamage _onoff} foreach (nearestObjects [(getMarkerPos "kraftwerk_1"), _types, 1500]);
		[_this select 0,0] call Bis_fnc_DataTerminalAnimate;

		if(playerSide == civilian) then
		{
			life_kw_kavala = true;
			[getPlayerUID player,name player,"41"] remoteExecCall ["SoA_fnc_wantedAdd",2];
			[2,"Das Kraftwerk in Kavala wurde ausgeschaltet!"] remoteExecCall ["life_fnc_broadcast",0];
			sleep (5 * 60);
			life_kw_kavala = false;
		};
	};

	case 1: {
		if (life_kw_athira) exitWith {hint "Das Kraftwerk ist bereits ausgeschaltet"};
		if (playerside == civilian) then {
			
		_sleep = 0.1;
		_cP = 0.01;
		_upp = "Kraftwerk wird gehackt...";

		_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false};

		hint "Du hast das Kraftwerk gehackt, der Strom in Athira wurde abgeschaltet.";
		[strom_athira,"shutdown"] remoteExecCall ["say3D",0];
		} else {
			hint "Du hast den Strom in Athira wieder eingeschaltet.";
		};

		{_x setdamage _onoff} foreach (nearestObjects [(getMarkerPos "kraftwerk_1_1"), _types, 1500]);
		[_this select 0,0] call Bis_fnc_DataTerminalAnimate;
		
		if(playerSide == civilian) then
		{
			life_kw_athira = true;
			[getPlayerUID player,name player,"41"] remoteExecCall ["SoA_fnc_wantedAdd",2];
			[2,"Das Kraftwerk in Athira wurde ausgeschaltet!"] remoteExecCall ["life_fnc_broadcast",0];
			sleep (5 * 60);
			life_kw_athira = false;
		};
	};

	case 2: {
		if (life_kw_sofia) exitWith {hint "Das Kraftwerk ist bereits ausgeschaltet"};
		if (playerside == civilian) then {
				
		_sleep = 0.1;
		_cP = 0.01;
		_upp = "Kraftwerk wird gehackt...";

		_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false};

		hint "Du hast das Kraftwerk gehackt, der Strom in Sofia wurde abgeschaltet.";
		[strom_sofia,"shutdown"] remoteExecCall ["say3D",0];
		} else {
			hint "Du hast den Strom in Sofia wieder eingeschaltet.";
		};

		{_x setdamage _onoff} foreach (nearestObjects [(getMarkerPos "kraftwerk_1_2"), _types, 1500]);
		[_this select 0,0] call Bis_fnc_DataTerminalAnimate;

		if(playerSide == civilian) then
		{
			life_kw_sofia = true;
			[getPlayerUID player,name player,"41"] remoteExecCall ["SoA_fnc_wantedAdd",2];
			[2,"Das Kraftwerk in Sofia wurde ausgeschaltet!"] remoteExecCall ["life_fnc_broadcast",0];
			sleep (5 * 60);
			life_kw_sofia = false;
		};
	};

	case 3: {
		if (life_kw_pyrgos) exitWith {hint "Das Kraftwerk ist bereits ausgeschaltet"};
		if (playerside == civilian) then {
		
		_sleep = 0.1;
		_cP = 0.01;
		_upp = "Kraftwerk wird gehackt...";

		_handle = [_upp,_sleep,_cP,nil,(_this select 0),4] spawn life_fnc_processBar;
		WaitUntil{scriptDone _handle};
		if(life_process_distance) exitWith {hint "Du bist zu weit entfernt!"; life_process_distance = false;};
		if(life_process_bad) exitWith {life_process_bad = false};
			
		hint "Du hast das Kraftwerk gehackt, der Strom in Pyrgos wurde abgeschaltet.";
		[strom_pyrgos,"shutdown"] remoteExecCall ["say3D",0];
		} else {
			hint "Du hast den Strom in Pyrgos wieder eingeschaltet.";
		};

		{_x setdamage _onoff} foreach (nearestObjects [(getMarkerPos "kraftwerk_1_3"), _types, 1500]);
		[_this select 0,0] call Bis_fnc_DataTerminalAnimate;
		
		if(playerSide == civilian) then
		{
			life_kw_pyrgos = true;
			[getPlayerUID player,name player,"41"] remoteExecCall ["SoA_fnc_wantedAdd",2];
			[2,"Das Kraftwerk in Pyrgos wurde ausgeschaltet!"] remoteExecCall ["life_fnc_broadcast",0];
			sleep (5 * 60);
			life_kw_pyrgos = false;
		};
	};
};