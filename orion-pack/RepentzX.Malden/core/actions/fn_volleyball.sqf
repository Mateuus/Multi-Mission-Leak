_mode = _this select 0;

switch(_mode) do {

	case 0: 
	{
		if(!isnull volleyball) exitWith {["You have already unpacked your volleyball!",false,"slow"] call life_fnc_notificationSystem;};
		[false,"volleyball",1] call life_fnc_handleinv;

		volleyball = "land_volleyball_01_f" createvehicle [0,0,0];
		volleyball addaction ["Take the volleyball",{player playaction "putdown"; sleep 1.2; _this select 0 attachto[player,[0,0,0],"righthand"]; volleythrow = (finddisplay 46) displayAddEventHandler ["keyDown","if ((_this select 1) == 19) then {[1,cursorobject] spawn life_fnc_volleyball; true};"];},0,0,false,false,'',"currentWeapon player == '' && isnull (attachedTo volleyball)",3];
		volleydelete = player addaction ["Put away volleyball",{if(isnull volleyball) exitWith {}; deletevehicle volleyball; player removeAction volleydelete; [true,"volleyball",1] call life_fnc_handleinv;}];
		volleythrow = (finddisplay 46) displayAddEventHandler ["keyDown","if ((_this select 1) == 19) then {[1,cursorobject] spawn life_fnc_volleyball; true};"]; 

		if(currentWeapon player != "") then {player action ["SwitchWeapon", player, player, 100];};
		volleyball attachto [player,[0,0,0],"righthand"];
	};

	case 1: 
	{
		_target = _this select 1;

		if(currentWeapon player != "") exitWith {player action ["SwitchWeapon", player, player, 100];};
		if(isNil "_target" OR !(_target iskindOf "Man")) exitWith {};
		if(!alive _target) exitWith {};

		volley_failed = false;

		player playaction "throwgrenade";
		sleep 0.5; 
		detach volleyball;
		_dir = direction player;
		_vel = velocity volleyball;
		_weite = player distance _target;
		volleyball setVelocity[(_vel select 0) + (sin _dir*_weite), (_vel select 1) + (cos _dir*_weite), 3];

		[] spawn {
			sleep 3;
			if(round(getpos volleyball select 2) != 0 && isnull(attachedTo volleyball)) exitWith {
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", volleythrow];
				volley_failed = true;
			};
		};

		WaitUntil{sleep 0.1; round (getposATL volleyball select 2) < 1 || volley_failed}; 
		if(currentWeapon _target != "") exitWith {["The person is already holding something in their hand!",false,"slow"] call life_fnc_notificationSystem;};

		(findDisplay 46) displayRemoveEventHandler ["KeyDown", volleythrow];
		player removeAction volleydelete;
		if((volleyball distance _target) < 0.5) then 
		{
			[_target,"punch_break"] remoteExecCall ["say3D",0]; 
			volleyball attachto [_target,[0,0,0],"righthand"];
			[2,volleyball] remoteExecCall ["life_fnc_volleyball",_target];

			volleyball = ObjNull;
		};
	};

	case 2: 
	{
		volleyball = _this select 1;
		volleyball addaction ["Take the volleyball",{player playaction "putdown"; sleep 1.2; _this select 0 attachto[player,[0,0,0],"righthand"]; volleythrow = (finddisplay 46) displayAddEventHandler ["keyDown","if ((_this select 1) == 19) then {[1,cursorobject] spawn life_fnc_volleyball; true};"];},0,0,false,false,'',"currentWeapon player == '' && isnull (attachedTo volleyball)",3];
		volleydelete = player addaction ["Put away volleyball",{if(isnull volleyball) exitWith {}; deletevehicle volleyball; player removeAction volleydelete; [true,"volleyball",1] call life_fnc_handleinv;}];
		volleythrow = (finddisplay 46) displayAddEventHandler ["keyDown","if ((_this select 1) == 19) then {[1,cursorobject] spawn life_fnc_volleyball; true};"]; 
	};
};