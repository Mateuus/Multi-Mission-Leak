/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Pick_Mining.sqf

Description:
Mining
*/
["RPP_Pick_Mining_Gold",{
	[] spawn {
		if (RPP_Pick) exitWith {
			_msg = "You are already using this command!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (RPP_Skill_Mining > 10) exitWith {
			_msg = "You need atleast 10 Mining Skill to mine gold";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Pick = true;

		_msg = "Mining Gold...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		_Mining = round(random 100);
		sleep 2;

		if (RPP_Skill_Mining <= 0) then {
			if (_Mining > 70) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 10) then {
			if (_Mining > 60) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 20) then {
			if (_Mining > 50) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 30) then {
			if (_Mining > 40) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 40) then {
			if (_Mining > 40) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 50) then {
			if (_Mining > 30) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 70) then {
			if (_Mining > 20) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 100) then {
			if (_Mining > 5) exitWith {
				_msg = "No Gold was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (!(_c)) exitWith {};

		["Gold",1] call RPP_Inventory_Add;

		_msg = "You Found 1 Gold";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
		if (RPP_Skill_Mining <= 100) then {
			RPP_Skill_Mining = 100;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Pick_Mining_Gold";

["RPP_Pick_Mining_Iron",{
	[] spawn {
		if (RPP_Pick) exitWith {
			_msg = "You are already using this command!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Pick = true;

		_msg = "Mining Iron...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		_Mining = round(random 100);
		sleep 2;

		if (RPP_Skill_Mining <= 0) then {
			if (_Mining > 70) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 10) then {
			if (_Mining > 60) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 20) then {
			if (_Mining > 50) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 30) then {
			if (_Mining > 40) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 40) then {
			if (_Mining > 40) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 50) then {
			if (_Mining > 30) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 70) then {
			if (_Mining > 20) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 100) then {
			if (_Mining > 5) exitWith {
				_msg = "No Iron was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (!(_c)) exitWith {};

		["Iron",1] call RPP_Inventory_Add;

		_msg = "You Found 1 Iron";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
		if (RPP_Skill_Mining <= 100) then {
			RPP_Skill_Mining = 100;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Pick_Mining_Iron";

["RPP_Pick_Mining_Diamond",{
	[] spawn {
		if (RPP_Pick) exitWith {
			_msg = "You are already using this command!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Pick = true;

		_msg = "Mining Diamond...";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		_Mining = round(random 100);
		sleep 2;

		if (RPP_Skill_Mining <= 0) then {
			if (_Mining > 70) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 10) then {
			if (_Mining > 60) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 20) then {
			if (_Mining > 50) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 30) then {
			if (_Mining > 40) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 40) then {
			if (_Mining > 40) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 50) then {
			if (_Mining > 30) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 70) then {
			if (_Mining > 20) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (RPP_Skill_Mining <= 100) then {
			if (_Mining > 5) exitWith {
				_msg = "No Diamond was found please try again.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_c = false;
			};
		};

		if (!(_c)) exitWith {};

		["Diamond",1] call RPP_Inventory_Add;

		_msg = "You Found 1 Diamond";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
		if (RPP_Skill_Mining <= 100) then {
			RPP_Skill_Mining = 100;
		};
	};
}] call RPP_Function;
publicVariable "RPP_Pick_Mining_Diamond";