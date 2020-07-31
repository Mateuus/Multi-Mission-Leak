_unit = player;
_side = side player;
_tempPos = [(getpos _unit) select 0,((getpos _unit) select 1) + 1,0];
life_dog_order = 1;
_side = side _unit;
_drugradius = 15;
_group1 = createGroup _side;
_uid = getPlayerUID player;
_dogname = "tighe";


if (_uid != "76561197995364867" && _uid != "76561198130126033" && _uid != "76561198108525408") exitwith {
	hint format["UID: %1 %2 is not whitelisted for k9 unit", _unit, _uid];
};
"Alsatian_Sandblack_F" createUnit [_tempPos, group player,"dog = this", 5.0, "private"];
_dogenable = true;
				_acts12 = player addAction ["<t color = '#3f2ec3'>*Hide Dog Menu*</t>", {life_dog_order = 99}];
				_acts6 = player addAction ["<t color = '#ffff00'>Follow Me</t>", {life_dog_order = 1}];
				_acts1 = player addAction ["<t color = '#ffff00'>Come to Me</t>", {life_dog_order = 6}];
				_acts14 = player addAction ["<t color = '#ffff00'>Sniff Closest</t>", {life_dog_order = 14}];
				_acts2 = player addAction ["<t color = '#ffff00'>Halt</t>", {life_dog_order = 2}];
				_acts3 = player addAction ["<t color = '#ffff00'>Seek Nearest</t>", {life_dog_order = 3}];
				_acts7 = player addAction ["<t color = '#ffff00'>Attack Nearest</t>", {life_dog_order = 7}];
				_acts8 = player addAction ["<t color = '#ffff00'>Intimidate</t>", {life_dog_order = 8}];
				_acts4 = player addAction ["<t color = '#ff0000'>Put Away</t>", {life_dog_order = 4}];
				_acts9 = player addAction ["<t color = '#ff0000'>Bark 1</t>", {life_dog_order = 9}];
				_acts10 = player addAction ["<t color = '#ff0000'>Bark 2</t>", {life_dog_order = 10}];
				_acts11 = player addAction ["<t color = '#ff0000'>Bark 3</t>", {life_dog_order = 11}];
				_acts13 = player addAction ["<t color = '#3f2ec3'>*Show Dog Menu*</t>", {life_dog_order = 98}];
hint format ["%1 - Come here boy!!",_dogname];
while { true } do {
uiSleep 0.05;
waitUntil {life_dog_order != 5};

		if (life_dog_order == 99) then 
		{
				player removeAction _acts1;
				player removeAction _acts2;
				player removeAction _acts3;
				player removeAction _acts4;
				player removeAction _acts6;
				player removeAction _acts7;
				player removeAction _acts8;
				player removeAction _acts9;
				player removeAction _acts10;
				player removeAction _acts11;
				player removeAction _acts14;
				life_dog_order = 5;
		};

		if (life_dog_order == 98) then 
		{
				player removeAction _acts1;
				player removeAction _acts2;
				player removeAction _acts3;
				player removeAction _acts4;
				player removeAction _acts6;
				player removeAction _acts7;
				player removeAction _acts8;
				player removeAction _acts9;
				player removeAction _acts10;
				player removeAction _acts11;
				player removeAction _acts14;

				_acts6 = player addAction ["<t color = '#ffff00'>Follow Me</t>", {life_dog_order = 1}];
				_acts1 = player addAction ["<t color = '#ffff00'>Come to Me</t>", {life_dog_order = 6}];
				_acts14 = player addAction ["<t color = '#ffff00'>Sniff Closest</t>", {life_dog_order = 14}];
				_acts2 = player addAction ["<t color = '#ffff00'>Halt</t>", {life_dog_order = 2}];
				_acts3 = player addAction ["<t color = '#ffff00'>Seek Nearest</t>", {life_dog_order = 3}];
				_acts7 = player addAction ["<t color = '#ffff00'>Attack Nearest</t>", {life_dog_order = 7}];
				_acts8 = player addAction ["<t color = '#ffff00'>Intimidate</t>", {life_dog_order = 8}];
				_acts4 = player addAction ["<t color = '#ff0000'>Put Away</t>", {life_dog_order = 4}];
				_acts9 = player addAction ["<t color = '#ff0000'>Bark 1</t>", {life_dog_order = 9}];
				_acts10 = player addAction ["<t color = '#ff0000'>Bark 2</t>", {life_dog_order = 10}];
				_acts11 = player addAction ["<t color = '#ff0000'>Bark 3</t>", {life_dog_order = 11}];
				life_dog_order = 5;
		};


		if ((((vehicle player)!= player)&&((dog distance player)<7))) then {
				life_dog_order = 5;
				player removeAction _acts1;
				player removeAction _acts2;
				player removeAction _acts3;
				player removeAction _acts4;
				player removeAction _acts6;
				player removeAction _acts7;
				player removeAction _acts8;
				player removeAction _acts9;
				player removeAction _acts10;
				player removeAction _acts11;
				player removeAction _acts14;
				_veh = vehicle player;
				dog attachto [player,[0,-0.8,-0.2]];
				dog attachto [_veh];
				waituntil {(vehicle player)!= _veh};
				detach dog;
				_acts6 = player addAction ["<t color = '#ffff00'>Follow Me</t>", {life_dog_order = 1}];
				_acts1 = player addAction ["<t color = '#ffff00'>Come to Me</t>", {life_dog_order = 6}];
				_acts14 = player addAction ["<t color = '#ffff00'>Sniff Closest</t>", {life_dog_order = 14}];
				_acts2 = player addAction ["<t color = '#ffff00'>Halt</t>", {life_dog_order = 2}];
				_acts3 = player addAction ["<t color = '#ffff00'>Seek Nearest</t>", {life_dog_order = 3}];
				_acts7 = player addAction ["<t color = '#ffff00'>Attack Nearest</t>", {life_dog_order = 7}];
				_acts8 = player addAction ["<t color = '#ffff00'>Intimidate</t>", {life_dog_order = 8}];
				_acts4 = player addAction ["<t color = '#ff0000'>Put Away</t>", {life_dog_order = 4}];
				_acts9 = player addAction ["<t color = '#ff0000'>Bark 1</t>", {life_dog_order = 9}];
				_acts10 = player addAction ["<t color = '#ff0000'>Bark 2</t>", {life_dog_order = 10}];
				_acts11 = player addAction ["<t color = '#ff0000'>Bark 3</t>", {life_dog_order = 11}];
				dog setpos [((getpos player) select 0) + 2,((getpos player) select 1) + 2,0];
		};




		if (life_dog_order == 9) then 
		{
				playSound3D ["cg_sndimg\sounds\bark1.ogg", dog, false, getPosASL player, 1, 1, 225];
				life_dog_order = 5;
		};

		if (life_dog_order == 10) then 
		{
				playSound3D ["cg_sndimg\sounds\bark2.ogg", dog, false, getPosASL player, 1, 1, 225];
				life_dog_order = 5;
		};

		if (life_dog_order == 11) then 
		{
				playSound3D ["cg_sndimg\sounds\bark3.ogg", dog, false, getPosASL player, 1, 1, 225];
				life_dog_order = 5;
		};


		if (life_dog_order == 8) then 
		{
				playSound3D ["cg_sndimg\sounds\bark4.ogg", dog, false, getPosASL player, 1, 1, 225];
				life_dog_order = 5;
		};


		if (life_dog_order == 6) then 
		{
					dog domove (getpos _unit);
					life_dog_order = 5;	
		};

		if (life_dog_order == 1) then 
		{

				dog moveTo (getPos _unit);	
				dog doMove (getPos _unit);	
				uiSleep 5;
		};

		if (life_dog_order == 2) then 
		{
				dog domove getpos dog;
				life_dog_order = 5;
				playSound3D ["cg_sndimg\sounds\bark1.ogg", dog, false, getPosASL player, 1, 1, 225];
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
			life_dog_order = 5;
			};


			if ((dog distance getpos (_nearestunitofside select 0)) < 2 && (animationState (_nearestunitofside select 0)) != "BasicDriverOutDying") then 
			{
				dog domove getpos dog;
				_attackperson = (_nearestunitofside select 0);

				_attackperson playMove "BasicDriverOutDying";
				[_attackperson,"BasicDriverOutDying"] remoteExecCall ["life_fnc_animSync"];
				playSound3D ["cg_sndimg\sounds\growl.ogg", dog, false, getPosASL player, 1, 1, 225];
				uiSleep 4;

				_attackperson playMove "AmovPpneMstpSnonWnonDnon_healed";
				[_attackperson,"AmovPpneMstpSnonWnonDnon_healed"] remoteExecCall ["life_fnc_animSync"];
			} else 
			{
				dog domove getpos (_nearestunitofside select 0);	
			};	
		};


		if (life_dog_order == 3) then 
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
			life_dog_order = 5;
			};


			if ((dog distance getpos (_nearestunitofside select 0)) < 2) then 
			{
				dog domove getpos dog;
				uiSleep 3;
			} else 
			{
				dog domove getpos (_nearestunitofside select 0);	
				life_dog_order = 5;
			};	
		};


		if (life_dog_order == 14) then 
		{
			[cursorTarget] spawn life_fnc_SearchAction;
			playSound3D ["cg_sndimg\sounds\bark1.ogg", dog, false, getPosASL player, 1, 1, 225];
			life_dog_order = 5;
		};



		if (life_dog_order == 4 || (!alive dog) || (deadPlayer)) exitwith {
			uiSleep 5;
			deletevehicle dog;
			player removeAction _acts1;
			player removeAction _acts2;
			player removeAction _acts3;
			player removeAction _acts4;
			player removeAction _acts6;
			player removeAction _acts7;
			player removeAction _acts8;
			player removeAction _acts9;
			player removeAction _acts10;
			player removeAction _acts11;
			player removeAction _acts12;
			player removeAction _acts13;
			player removeAction _acts14;
			};
		uiSleep 0.05;
};