/*
dog functions

pass in the calling unit

made by:
|TG-355th| Yink
*/

_unit = _this select 0;

//if (!(isNil "_unit")) exitWith {diag_log "Deaktiviert"};
if (isNil "_unit") exitWith {diag_log "Unit is zero"};
if (!(isNull life_dog)) exitWith {["A dog has already been called!",false,"slow"] call life_fnc_notificationSystem;};
if(!([false,"dogwhistle",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
_side = side _unit;
sleep 2;
_setVariable =
	{
		_unit setVariable ["order","nil"];
		_unit setVariable ["step","wait"];
		_unit setVariable ["action","true"];
		_unit setVariable ["seek","false"];
		_unit setVariable ["dog_dead","false"];
	};



_dogRevive =
	{
		_unit = _this select 0;
		_dog = _unit getVariable "dog";

		sleep 5;

		_side = side _unit;
		_unit setVariable ["follow",'false'];
		_tempPos = getPosATL _unit;

		life_dog = createAgent ["Alsatian_Black_F", _tempPos, [], 5, "CAN_COLLIDE"];
//		life_dog = (group _unit) createUnit ["Goat_random_F", _tempPos,[],0,"NONE"];
	//	life_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
		sleep 0.5;

		_dog = _unit getVariable "dog";
		_unit setVariable ["step","go"];

	};

_dogWhistle =
    {

    _unit 		= (_this select 3) select 0;
		_growl 		= (_this select 3) select 1;
		_play 		= (_this select 3) select 2;
		_idle 		= (_this select 3) select 3;
		_vehicle 	= (_this select 3) select 4;


		 removeAllActions _unit;
		_sound = ["dog_whistle",_unit, 20] spawn _play;
		//[player,"dog_whistle"] remoteexeccall ["say3D",0];
    ["Doggo, come here!",false,"slow"] call life_fnc_notificationSystem;
    sleep 1;
    _unit setVariable ["follow",'false'];
    _tempPos = getPosATL _unit;
    _side = side _unit;

		life_dog = createAgent ["Alsatian_Black_F", _tempPos, [], 5, "CAN_COLLIDE"];


    _unit setVariable ["order","idle"];
		_unit setVariable ["dog_dead","false"];
    _unit setVariable ["step","go"];
    _unit setVariable ["dog", life_dog];
    (_unit getVariable "dog") setVariable ["player",_unit];

		_vehicle	= [_unit,_play] spawn _vehicle;
		_return		= [_unit,_play] spawn _idle;
    _growl 		= [_unit,_play] spawn _growl;

   life_dog addEventHandler
    [
      	"killed",
				{
					_unit1 = (_this select 0) getVariable "player";
					_unit1 setVariable ["dog_dead","true"];
					_unit1 setVariable ["order","idle"];
					_unit1 setVariable ["action","false"];
					_unit1 setVariable ["step","go"];
					removeAllActions _unit1;
					life_dog = objNull;
				}
    ];

   life_dog addEventHandler
    [
        "FiredNear",
				{
					_dog = _this select 0;
					_firer = _this select 1;
					_unit1 = _dog getVariable "player";
					_side = west;
					switch (side _unit1) do {
						case civilian: {_side = west;};
						case west: {_side = civilian;};
					};


					if (((side _firer)==_side)&&((_unit1 getVariable "seek")=="true")) then
						{
							_unit1 setVariable ["order","idle"];
							_unit1 setVariable ["step","go"];
							_unit1 setVariable ["seek","false"];
							_dog moveTo (getPosATL _unit1);
							_sound = ["dog_whine",_dog, 20] spawn _play;
							//[_dog,"dog_whine"] remoteexeccall ["say3D",0];
						};
				}
    ];
};

_dogFollow =
	{
		_unit 	= (_this select 3) select 0;
		_play	= (_this select 3) select 1;
		_sound 	= ["dog_one",life_dog, 20] spawn _play;
		["Doggo, Follow!",false,"slow"] call life_fnc_notificationSystem;
		_unit setVariable ["order","active"];
		_unit setVariable ["step","go"];
		_unit setVariable ["follow",'true'];
		life_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
		life_dog playMove "Dog_Sprint";

		while {(_unit getVariable "follow") == 'true'} do
		{
			sleep 0.5;
			if ((life_dog distance2D _unit) > 4) then
			{
				life_dog moveTo  (getPosATL _unit);
			};

		};
		life_dog setVariable ["BIS_fnc_animalBehaviour_disable", false];
		life_dog playMove "Dog_Idle_Stop";
	};

_dogSeek =
	{
		_unit 	= (_this select 3) select 0;
		_unit setVariable ["follow",'false'];
		_unit setVariable ["seek","true"];
		_dog 	= _unit getVariable "dog";
		_play 	= (_this select 3) select 1;
		["Doggo, search!",false,"slow"] call life_fnc_notificationSystem;
		_unit setVariable ["order","active"];
		_unit setVariable ["step","go"];
		_dog = _unit getVariable "dog";
		_side = west;
		switch (side _unit) do {
			case civilian: {_side = west;};
			case west: {_side = civilian;};
		};
		_radius = 1000;

		_nearestunits = nearestObjects [_dog,["Man"],_radius];

		_nearestunitofside = [];

		if(_side countSide _nearestunits > 0) then
		{
		//_sound = ["dog_one",_dog, 20] spawn _play;
		[_dog,"dog_one"] remoteexeccall ["say3D",0];
			{
				_unit = _x;
				if (side _unit == _side) then
					{
						_nearestunitofside = _nearestunitofside + [_unit]
					};
			} foreach _nearestunits;
		} else {
		_sound = ["dog_ruff",_dog, 20] spawn _play;
		//[_dog,"dog_ruff"] remoteexeccall ["say3D",0];
		_unit setVariable ["order","idle"];
		};
		_dog setVariable ["BIS_fnc_animalBehaviour_disable", true];
		_dog playMove "Dog_Sprint";
		_dog moveTo getPosATL (_nearestunitofside select 0);

		waituntil {(_dog distance (_nearestunitofside select 0))<10};
		_sound = ["dog_ruff",_dog, 20] spawn _play;
		//[_dog,"dog_ruff"] remoteexeccall ["say3D",0];
		_dog playMove "Dog_Idle_Stop";
		_dog setVariable ["BIS_fnc_animalBehaviour_disable", false];
	};

_dogHeel =
	{

		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getVariable "dog";
		_play 	= (_this select 3) select 1;
		_sound 	= ["dog_one",_dog, 20] spawn _play;
		["Doggo, Heel!",false,"slow"] call life_fnc_notificationSystem;
		_unit setVariable ["follow",'false'];
		_dog = _unit getVariable "dog";
		//TODO keine Animation???
		_dog moveTo [(getPosATL _unit) select 0,((getPosATL _unit) select 1) - 1, 0];
		_unit setVariable ["order","active"];
		_unit setVariable ["step","go"];
	};

_dogHide =
	{
		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getVariable "dog";
		_unit setVariable ["follow",'false'];
		_dog 	= _unit getVariable "dog";
		["Doggo, Hide!",false,"slow"] call life_fnc_notificationSystem;
		_unit setVariable ["order","nil"];
		_unit setVariable ["step","go"];
		sleep 3;
		deleteVehicle _dog;
	};

_dogStop =
	{

		_unit 	= (_this select 3) select 0;
		_dog 	= _unit getVariable "dog";
		_play 	= (_this select 3) select 1;

		if (_unit getVariable "dog_dead" == "false") then {
			_sound 	= ["dog_one",_dog, 20] spawn _play;
			_unit setVariable ["seek","false"];
			["Doggo, Wait!",false,"slow"] call life_fnc_notificationSystem;
			_unit setVariable ["follow",'false'];
			_dog moveTo getPosATL _dog;
			_unit setVariable ["order","idle"];
			_unit setVariable ["step","go"];
		};
	};

_dogGrowl =
    {

    _unit 	= _this select 0;
    _dog 	= _unit getVariable "dog";
		_side = side _unit;
    while {alive _dog} do
        {
            _timer 	= round(random 5);
            _timer	= _timer + 15;
            _objs 	= nearestobjects [_dog,["Man"], 5];

            {
            	if ((side _x) == _side) then
	            {
	                _objs = _objs - [_x];
	            };
            } foreach _objs;

            if ((count _objs)>0) then
            {
								_play = _this select 1;
								_sound = ["dog_growl",_dog, 11] spawn _play;
								//[_dog,"dog_growl"] remoteexeccall ["say3D",0];
            };

            sleep _timer;
            _dog = _unit getVariable "dog";

        };

    };

_playSound =
	{

		_soundPath 	= [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		_sound 		= _this select 0;
		_dog1 		= _this select 1;
		[_dog1,_sound] remoteExecCall ["life_fnc_globalSound",-2];
	};

_dogReturnIdle =
	{
	_unit 	= _this select 0;
	_dog	= _unit getVariable "dog";
	_play 	= _this select 1;
	while {!(isNull _dog) && alive _dog} do
		{
			waituntil {(((_dog distance _unit)>50)&&((_unit getVariable "order")=="idle"))};
			_dog moveTo (getPosATL _unit);
			_sound = ["dog_whine",_dog, 20] spawn _play;
			//[_dog,"dog_whine"] remoteexeccall ["say3D",0];
			
			waituntil {unitReady _dog};
			_unit setVariable ["order","active"];
		};
	};



_dogVehicle =
	{
		_unit 	= _this select 0;

		//Das soll wohl den Hund in das Auto bringen
		while {!(isNull life_dog) && alive life_dog} do
			{
				waituntil {(((vehicle _unit)!= _unit)&&((life_dog distance _unit)<8))};
				_veh = vehicle _unit;
				life_dog attachTo [_unit,[0,0.1,-0.2]];
				life_dog attachTo [_veh];
				waituntil {(vehicle _unit)!= _veh};
				detach life_dog;
				life_dog setPos [((getPosATL _unit) select 0) + 2,((getPosATL _unit) select 1) + 2,0];
			};
	};
_actions =
	{
	_unit       	= _this select 0;
	_dogWhistle		= _this select 1;
	_dogFollow  	= _this select 2;
	_dogSeek 	   	= _this select 3;
	_dogHide    	= _this select 4;
	_dogHeel   	 	= _this select 5;
	_dogStop	    = _this select 6;
	_dogGrowl   	= _this select 7;
	_playSound		= _this select 8;
	_dogReturnIdle 	= _this select 9;
	_dogVehicle		= _this select 10;
	_unit setVariable ["action","true"];

	while {(_unit getVariable "action") == "true" && (_unit getVariable ["dog_dead","false"]) == "false"} do
	{
		_unit setVariable ["step","wait"];
		_actions = _unit getVariable ["actions",[]];
		{
			_unit removeaction _x;
		} foreach _actions;

		_actions = [];
		if ((_unit getVariable ["dog_dead","false"]) == "true") exitWith
		{
			_unit setVariable ["order","nil"];
			life_dog = objNull;


		};
		if ((_unit getVariable "order") == "nil" && (_unit getVariable ["dog_dead","false"]) == "false") then
		{
				_whistle = _unit addAction ["Deploy Dog", _dogWhistle, [_unit, _dogGrowl,_playSound,_dogReturnIdle,_dogVehicle]];
				_unit setVariable ["order","whistle"];
				_unit setVariable ["step","wait"];
				_unit setVariable ["actions",[_whistle]];
		};

		if ((_unit getVariable "order") == "idle") then
		{
				_follow = _unit addAction ["<t color = '#ffff00'>Follow</t>", _dogFollow, [_unit,_playSound]];
				_find = _unit addAction ["<t color = '#ffff00'>Search</t>", _dogSeek, [_unit,_playSound]];
				_rest = _unit addAction ["<t color = '#ff0000'>Hide!</t>", _dogHide, [_unit,_playSound]];
				_heel = _unit addAction ["<t color = '#ffff00'>Heel</t>", _dogHeel, [_unit,_playSound]];
				_unit setVariable ["step","wait"];

				_unit setVariable ["actions",[_follow,_find,_rest,_heel]];
		};

		if ((_unit getVariable "order") == "active") then
		{
			_stop = _unit addAction ["<t color = '#ff0000'>Stop!</t>", _dogStop, [_unit,_playSound]];
			_unit setVariable ["step","wait"];
			_unit setVariable ["actions",[_stop]];
		};

		waituntil {((_unit getVariable "step") == "go") || _unit getVariable ["dog_dead","false"] == "true"};
	};
};

_var1 = [_unit] call _setVariable;
_loop = [_unit,_dogWhistle,_dogFollow,_dogSeek,_dogHide,_dogHeel,_dogStop,_dogGrowl,_playSound,_dogReturnIdle, _dogVehicle] call _actions;
