/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Fishing.sqf

Description:
pick apples
*/
["RPP_Start_Fishing", {
	[_this select 0,_this select 1,_This select 2,_this select 3] spawn {
		private ["_Fish","_Skill","_tool","_sleep","_getfish"];
		if (RPP_Pick) exitWith {
			_msg = "You are already using this command!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Pick = true;

		_Fish = _this select 0;
		_Skill = _this select 1;
		_tool = _this select 2;
		_sleep = _this select 3;
		_getfish = round(random 100);

		if (!(RPP_Skill_Fishing >= _Skill)) exitWith {
			_msg = format ["You need to have atleast %1 Fishing skill to fish here.",_Skill];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			RPP_Pick = false;
		};

		if ([_tool] call RPP_Inventory_Count == 0) exitWith {
			_msg = format ["You need a %1 to fish here",_tool];
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};

		_msg = format ["Fishing %1...",_Fish];
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		sleep (_sleep);

		if (!(RPP_Skill_Fishing < 100)) exitWith {
			if (_getfish < 5) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		};
		if (!(RPP_Skill_Fishing < 40)) exitWith {
			if (_getfish < 20) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		};
		if (!(RPP_Skill_Fishing < 30)) exitWith {
			if (_getfish < 40) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		};
		if (!(RPP_Skill_Fishing < 25)) exitWith {
			if (_getfish < 50) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		};
		if (!(RPP_Skill_Fishing < 10)) exitWith {
			if (_getfish < 70) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		};
		if (!(RPP_Skill_Fishing < 0)) exitWith {
			if (_getfish < 60) then {
				_msg = format ["No %1 was found please try again.",_Fish];
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem; 
				RPP_Pick = false;
			} else {
				[_Fish,1] call RPP_Inventory_Add;
				_msg = format ["You Catched one %1",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				RPP_Skill_Fishing = RPP_Skill_Fishing + 0.2;
				RPP_Pick = false;
			};
		}

	};
}] call RPP_Function;
publicVariable "RPP_Start_Fishing";