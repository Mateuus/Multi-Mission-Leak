
_firework = _this select 0;

switch(_firework) do {

	case 0: {[getPos player, 'random','red'] call life_fnc_preparefirework;};
	case 1: {[getPos player, 'random','blue'] call life_fnc_preparefirework;};
	case 2: {[getPos player, 'random','green'] call life_fnc_preparefirework;};
	case 3: {[getPos player, 'random','white'] call life_fnc_preparefirework;};
	case 4: {
		_box = "Land_CarBattery_01_F" createvehicle [0,0,0];
		_box setpos (player modeltoworld [0,+2,0]); 
		_box setdir ((getdir player) - 90);
		titleText ["Geh in Deckung!","PLAIN DOWN"];
		sleep 1;
		titleText ["5!","PLAIN DOWN"];
		sleep 1;
		titleText ["4!","PLAIN DOWN"];
		sleep 1;
		titleText ["3!","PLAIN DOWN"];
		sleep 1;
		titleText ["2!","PLAIN DOWN"];
		sleep 1;
		titleText ["1!","PLAIN DOWN"];
		sleep 1;
		
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 0.5;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 1;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 0.5;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 1;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 0.5;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 1;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		sleep 0.5;
		[getPos _box, 'random','random'] call life_fnc_preparefirework;
		
		sleep 10;
		deletevehicle _box;
	};
	case 5: {
		hint "Show gestartet!";
		
		_types = ["Land_PortableLight_double_F","Lamps_Base_F", "PowerLines_base_F", "Land_LampAirport_F", "Land_LampStreet_small_F", "Land_LampStreet_F", "Land_LampSolar_F", "Land_LampShabby_F", "Land_LampHalogen_F", "Land_LampHarbour_F", "Land_LampDecor_F", "Powerpolewooden_l_F", "Lampdecor_F", "Land_Powerpolewooden_l_F"];
		{_x setdamage 0.95} foreach (nearestObjects [(getMarkerPos "kraftwerk_1"), _types, 1500]);
		
		
		[lautsprecher_1, "parade"] remoteExecCall ["say3D",0];
		
		sleep 8;
		[getPos firework_1, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_6, 'random','random'] call life_fnc_preparefirework;
		sleep 6.5;
		[getPos firework_3, 'random','random'] call life_fnc_preparefirework;
		sleep 9.5;
		[getPos firework_1, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_2, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_3, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_4, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_5, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_6, 'random','random'] call life_fnc_preparefirework;
		sleep 5;
		[getPos firework_6, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_5, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_4, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_3, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_2, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_1, 'random','random'] call life_fnc_preparefirework;
		sleep 1.5;
		[getPos firework_6, 'random','random'] call life_fnc_preparefirework;
		sleep 5;
		[getPos firework_2, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_4, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_1, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_6, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_3, 'random','random'] call life_fnc_preparefirework;
		[getPos firework_5, 'random','random'] call life_fnc_preparefirework;

		sleep 8;
		{_x setdamage 0} foreach (nearestObjects [(getMarkerPos "kraftwerk_1"), _types, 1500]);
	};
};