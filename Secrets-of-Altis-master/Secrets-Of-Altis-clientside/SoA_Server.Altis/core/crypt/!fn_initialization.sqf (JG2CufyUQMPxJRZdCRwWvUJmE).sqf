waitUntil {sleep 0.1; !(isNull (findDisplay 46))};

switch(playerSide) do {

	case west: {

		if((call life_coplevel) == 0 && (call life_adminlevel) == 0) exitWith 
		{
			["NotWhitelisted",false,true] call BIS_fnc_endMission;
			sleep 35;
		};

		if(str player == "cop_1") then {"cop" call life_fnc_RageRadio};
	};

	case independent: {

		if(call life_ahwLevel < 1) exitWith {
			["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
			sleep 35;
		};
	};

	case civilian: {
	
		_ausweis = life_ausweisdaten;
		_name = "";

		if(!(isnil "_ausweis") && !(_ausweis IsEqualTo []) && playerside == civilian && (call life_adminlevel) == 0) then {

			if(((group player) getVariable ["gang_tag","NEU"]) != "NEU") then {
				_name = format["[%1] %2 %3",((group player) getVariable "gang_tag"),(_ausweis select 1),(_ausweis select 0)];
			} else {
				_name = format["%1 %2",(_ausweis select 1),(_ausweis select 0)];
			};
			
			if(_name != name player) exitWith {
				playsound "haltstopp";
				[format["Du bist mit %1 auf der Insel gemeldet. Bitte ändere deinen Namen dementsprechend ab!",_name],"Falsche Identität","Mach ich!",false] call BIS_fnc_guiMessage;
				["ProfileName",false,1] call bis_fnc_endmission;
			};
		};

		[] spawn life_fnc_SpawnNear;

		if(license_civ_president) then {
			life_paycheck = life_paycheck + 17500;
		};
		if(license_civ_presse) then {
			life_paycheck = life_paycheck + 13500;
		};
	};

	case sideLogic: {
		waitUntil {!(isNull (findDisplay 46))};
		if(call life_adminlevel < 1) exitWith {["NotWhitelisted",false,1] call bis_fnc_endmission;};
	};
};

[] call life_fnc_UpdateClothing;