/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Pick_Apple.sqf

Description:
pick apples
*/
["RPP_Start_Field_Pick", {
	[_this select 0,_this select 1,_This select 2,_this select 3,_this select 4] spawn {
		private ["_Fish","_Skill","_SkillType","_sleep","_tool","_getfish","_c"];
		if (RPP_Pick) exitWith {
			_msg = "You are already using this command!";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (vehicle player != player) exitWith {
			_msg = "Please exit your vehicle first.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Pick = true;

		_Fish = _this select 0;
		_Skill = _this select 1;
		_tool = _this select 2;
		_sleep = _this select 3;
		_SkillType = _this select 4;
		_getfish = round(random 100);
		_c = true;


		switch (_SkillType) do { 

			case "Gathering": {

				if (!(RPP_Skill_Gathering >= _Skill)) exitWith {
					_msg = format ["You need to have atleast %1 Gathering Skill to work here.",_Skill];
					_color = RPP_Red;
					[_msg,_color] call RPP_MessageSystem;
					RPP_Pick = false;
				};

				if (!(_tool == "")) then {
					if ([_tool] call RPP_Inventory_Count == 0) exitWith {
						_msg = format ["You need a %1 Work here",_tool];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem;
						_c = false;
					};
				};
				if (!(_c)) exitWith {};

				_msg = format ["Gathering after %1...",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;

				sleep (_sleep);

				if (!(RPP_Skill_Gathering < 100)) exitWith {
					if (_getfish < 5) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Gathering < 40)) exitWith {
					if (_getfish < 20) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Gathering < 30)) exitWith {
					if (_getfish < 40) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Gathering < 25)) exitWith {
					if (_getfish < 50) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Gathering < 10)) exitWith {
					if (_getfish < 70) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Gathering < 0)) exitWith {
					if (_getfish < 60) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Gathering = RPP_Skill_Gathering + 0.1;
						RPP_Pick = false;
					};
				};
			};



			case "Mining" : {

				if (!(RPP_Skill_Mining >= _Skill)) exitWith {
					_msg = format ["You need to have atleast %1 Mining Skill to work here.",_Skill];
					_color = RPP_Red;
					[_msg,_color] call RPP_MessageSystem;
					RPP_Pick = false;
				};

				if (!(_tool == "")) then {
					if ([_tool] call RPP_Inventory_Count == 0) exitWith {
						_msg = format ["You need a %1 Work here",_tool];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem;
						_c = false;
					};
				};
				if (!(_c)) exitWith {};

				_msg = format ["Mining after %1...",_Fish];
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;

				sleep (_sleep);

				if (!(RPP_Skill_Mining < 100)) exitWith {
					if (_getfish < 5) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Mining < 40)) exitWith {
					if (_getfish < 20) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Mining < 30)) exitWith {
					if (_getfish < 40) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Mining < 25)) exitWith {
					if (_getfish < 50) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Mining < 10)) exitWith {
					if (_getfish < 70) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
				if (!(RPP_Skill_Mining < 0)) exitWith {
					if (_getfish < 60) then {
						_msg = format ["No %1 was found please try again.",_Fish];
						_color = RPP_Red;
						[_msg,_color] call RPP_MessageSystem; 
						RPP_Pick = false;
					} else {
						[_Fish,1] call RPP_Inventory_Add;
						_msg = format ["You Found one %1",_Fish];
						_color = RPP_Yellow;
						[_msg,_color] call RPP_MessageSystem;
						RPP_Skill_Mining = RPP_Skill_Mining + 0.1;
						RPP_Pick = false;
					};
				};
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Start_Field_Pick";