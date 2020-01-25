_unit = player;
_side = side player;
_tempPos = [(getpos _unit) select 0,((getpos _unit) select 1) + 1,0];
life_dog_order = 1;
_side = side _unit;
_drugradius = 15;
_group1 = createGroup _side;

"Alsatian_Sandblack_F" createUnit [_tempPos, _group1,"dog = this", 1.0, "private"];




_command =  life_dog_order;
_dogenable = true;

_acts6 = _unit addAction ["<t color = '#ffff00'>Follow Me</t>", {life_dog_order = 1}];

_acts1 = _unit addAction ["<t color = '#ffff00'>Come to Me</t>", {life_dog_order = 6}];

_acts2 = _unit addAction ["<t color = '#ffff00'>Halt</t>", {life_dog_order = 2}];

_acts3 = _unit addAction ["<t color = '#ffff00'>Seek Nearest</t>", {life_dog_order = 3}];

_acts7 = _unit addAction ["<t color = '#ffff00'>Seek Nearest & Attack</t>", {life_dog_order = 7}];

_acts8 = _unit addAction ["<t color = '#ffff00'>Intimidate</t>", {life_dog_order = 8}];

_acts4 = _unit addAction ["<t color = '#ff0000'>Put Away</t>", {life_dog_order = 4}];

_acts9 = _unit addAction ["<t color = '#ff0000'>Bark 1</t>", {life_dog_order = 9}];
_acts10 = _unit addAction ["<t color = '#ff0000'>Bark 2</t>", {life_dog_order = 10}];
_acts11 = _unit addAction ["<t color = '#ff0000'>Bark 3</t>", {life_dog_order = 11}];





while { true } do {
uiSleep 5;
waitUntil {life_dog_order != 5};
		if (life_dog_order == 9) then 
		{
				[dog,"bark1"] spawn life_fnc_nearestSound;
				life_dog_order = 1;
		};

		if (life_dog_order == 10) then 
		{
				[dog,"bark2"] spawn life_fnc_nearestSound;
				life_dog_order = 1;
		};

		if (life_dog_order == 11) then 
		{
				[dog,"bark3"] spawn life_fnc_nearestSound;
				life_dog_order = 1;
		};


		if (life_dog_order == 8) then 
		{
				[dog,"growlsmall"] spawn life_fnc_nearestSound;
				life_dog_order = 2;
		};


		if (life_dog_order == 1) then 
		{
				if (getpos dog distance getpos player > 3) then {
					dog domove (getpos player);	
				};
		};

		if (life_dog_order == 6) then 
		{
				if (getpos dog distance getpos player > 5) then {
					dog domove (getpos player);	
				} else {
				dog domove getpos dog;
				life_dog_order = 5;
				};
		};

		if (life_dog_order == 2) then 
		{
				dog domove getpos dog;
				life_dog_order = 5;
				[dog,"bark1"] spawn life_fnc_nearestSound;
		};



		if (life_dog_order == 7) then 
		{
		_radius = 1000;
		_sidecheck = civilian;
		_nearestunits = nearestObjects [dog,["Man"],_radius];
		_nearestunitofside = [];
			if(_side countSide _nearestunits > 0) then
			{
				{
					_unit = _x;
					if (side _unit == _sidecheck && (isPlayer _unit)) then 
						{
							_nearestunitofside pushBack _unit
						};
				} foreach _nearestunits;
			} else {
			life_dog_order = 2;
			};


			if ((dog distance getpos (_nearestunitofside select 0)) < 5 && (animationState (_nearestunitofside select 0)) != "Incapacitated") then 
			{
				dog domove getpos dog;
				(_nearestunitofside select 0) playMoveNow "Incapacitated";
				[dog,"growl"] spawn life_fnc_nearestSound;
			} else 
			{
				dog domove getpos (_nearestunitofside select 0);	
			};	
		};


		if (life_dog_order == 3) then 
		{
		hint "gate 3";
		_radius = 1000;
		_sidecheck = civilian;
		_nearestunits = nearestObjects [dog,["Man"],_radius];
		_nearestunitofside = [];
			if(_side countSide _nearestunits > 0) then
			{
				{
					_unit = _x;
					if (side _unit == _sidecheck && (isPlayer _unit)) then 
						{
							_nearestunitofside pushBack _unit
						};
				} foreach _nearestunits;
			} else {
			life_dog_order = 2;
			};


			if ((dog distance getpos (_nearestunitofside select 0)) < 5) then 
			{
				dog domove getpos dog;
				life_dog_order = 1;
			} else 
			{
				dog domove getpos (_nearestunitofside select 0);	
			};	
		};




		if (life_dog_order == 4 || (!alive dog) || (deadPlayer)) exitwith {
			deletevehicle dog;
			hint "end!";
			player removeAction _acts1;
			player removeAction _acts2;
			player removeAction _acts3;
			player removeAction _acts4;
		};
};


