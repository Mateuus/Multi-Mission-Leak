/*
RedTeam = Paintball_Uniform_Fun_Camo_01_O
BlueTeam = Paintball_Uniform_blue_01_B

Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Paintball.sqf

Description:
paintball :D
*/
["RPP_PaintBall_Var", {
	RPP_Paintball_Weapons =
	[
		["Weapon_angel_F","Weapon"],
		["Weapon_egosl_F","Weapon"],
		["Weapon_angel_kitty_F", "Weapon"],
		["Weapon_angel_rasta_F", "Weapon"]
	];
	publicVariable 'RPP_Paintball_Weapons';

	RPP_Paintball_Weapons_Hit =
	[
		"Weapon_angel_F",
		"Weapon_egosl_F",
		"Weapon_angel_kitty_F",
		"Weapon_angel_rasta_F"
	];
	publicVariable 'RPP_Paintball_Weapons_Hit';


	RPP_PaintBall_Magazine =
	[
		["140Rnd_PaintBall_blau","Magazine"],
		["140Rnd_PaintBall_fire","Magazine"],
		["140Rnd_PaintBall_glow","Magazine"],
		["140Rnd_PaintBall_gold","Magazine"],
		["140Rnd_PaintBall_grun","Magazine"]
	];
	publicVariable 'RPP_PaintBall_Magazine';

	RPP_PaintBall_TeamBlue = [];
	RPP_Paintball_TeamRed = [];
	publicVariable 'RPP_PaintBall_TeamBlue';
	publicVariable 'RPP_Paintball_TeamRed';

	RPP_Paintball_GameGoing = false;
	publicVariable 'RPP_Paintball_GameGoing';

	RPP_Paintball_MaxPlayers = 10;
	RPP_Paintball_TeamRedCount = 0;
	RPP_Paintball_TeamBlueCount = 0;
	publicVariable 'RPP_Paintball_TeamRedCount';
	publicVariable 'RPP_Paintball_TeamBlueCount';
	publicVariable 'RPP_Paintball_MaxPlayers';

	RPP_Paintball_Alive_TeamRed = 0;
	RPP_Paintball_Alive_TeamBlue = 0;
	publicVariable 'RPP_Paintball_Alive_TeamRed';
	publicVariable 'RPP_Paintball_Alive_TeamBlue';


	RPP_Paintball_Clothes =
	[
		'U_C_Poloshirt_blue',
		'U_C_Poloshirt_burgundy',
		'U_C_Poloshirt_stripped',
		'U_C_Poloshirt_tricolour',
		'U_C_Poloshirt_salmon',
		'U_C_Poloshirt_redwhite',
		'U_NikosBody',
		'U_OrestesBody',
		'U_BG_Guerilla2_1',
		'U_BG_Guerilla2_2',
		'U_BG_Guerilla2_3',
		'U_C_Poor_2'
	];
	publicVariable 'RPP_Paintball_Clothes';
}] call RPP_Function;
publicVariable 'RPP_PaintBall_Var';

[] call RPP_PaintBall_Var;

["RPP_Paintball_Dialog", {
	private ['_Readytxt','_p','_ReadyOrNot','_HostOrNot'];
	createDialog 'RPP_PaintBallMenu';

	buttonSetAction [1600, '[] call RPP_Paintball_JoinTeamRed;'];
	buttonSetAction [1601, '[] call RPP_Paintball_JoinTeamBlue;'];
	buttonSetAction [1602, '[] call RPP_Paintball_BuyTicket;'];
	buttonSetAction [1608, '[] call RPP_Paintball_Readyup;'];
	buttonSetAction [1607, '[] call RPP_Paintball_StartGame;'];
	buttonSetAction [1606, '[] call RPP_Paintball_Gamemode_DeatchMatch;'];

	_Readytxt = 'No Status';

	{
		_p = _x select 0;
		_ReadyOrNot = _p getVariable 'RPP_Paintball_ReadytoPlay';
		_HostOrNot = _p getVariable 'RPP_Paintball_Host';
		if (_ReadyOrNot) then {
			_Readytxt = 'Ready';
		};
		if (!(_ReadyOrNot)) then {
			_Readytxt = 'Not Ready';
		};
		if (_HostOrNot) then {
			_Readytxt = 'Host';
		};
		lbAdd [1501, format ['%1 (%2)',name _p,_Readytxt]];
	} foreach RPP_Paintball_TeamRed;

	{
		_p = _x select 0;
		_ReadyOrNot = _p getVariable 'RPP_Paintball_ReadytoPlay';
		_HostOrNot = _p getVariable 'RPP_Paintball_Host';
		if (_ReadyOrNot) then {
			_Readytxt = 'Ready';
		};
		if (!(_ReadyOrNot)) then {
			_Readytxt = 'Not Ready';
		};
		if (_HostOrNot) then {
			_Readytxt = 'Host';
		};
		lbAdd [1500, format ['%1 (%2)',name _p,_Readytxt]];
	} foreach RPP_Paintball_TeamBlue;



	lbAdd [1502, format ['==== Paintball Weapons ====']];
	lbAdd [1502, format ['']];

	{
		_data1 = lbAdd [1502, format ['%1',getText (configFile >> 'CfgWeapons' >> _x select 0 >> 'displayName')]];
		lbSetData [1502, _data1, _x select 0];
	} foreach RPP_Paintball_Weapons;

	lbAdd [1502, format ['']];
	lbAdd [1502, format ['==== Paintball Magazines ====']];
	lbAdd [1502, format ['']];

	{
		_data2 = lbAdd [1502, format ['%1',getText (configFile >> 'CfgMagazines' >> _x select 0 >> 'displayName')]];
		lbSetData [1502, _data2, _x select 0];
	} foreach RPP_PaintBall_Magazine;
}] call RPP_Function;
publicVariable 'RPP_Paintball_Dialog';

["RPP_Paintball_JoinTeamRed", {
	if (!(RPP_PaintBall_Ticket)) exitWith {
		_msg = 'You need to buy a ticket befor you can play.';
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (RPP_Paintball_GameGoing) exitWith {
		_msg = 'There is already a game going.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_Paintball_TeamRedCount >= 10) exitWith {
		_msg = 'This team is full, Max 10 players pr team.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player getVariable 'RPP_Paintball_Playing') exitWith {
		_msg = 'You are already in a Que.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (RPP_Paintball_TeamRedCount == 0 && RPP_Paintball_TeamBlueCount == 0) then {
		player setVariable ['RPP_Paintball_Host',true,true];
	};
	player setVariable ['RPP_Paintball_Playing',true,true];
	player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
	player setVariable ['RPP_Paintball_OnTeamRed',true,true];
	RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount + 1;
	publicVariable 'RPP_Paintball_TeamRedCount';

	RPP_Paintball_TeamRed = RPP_Paintball_TeamRed + [ [player] ];
	publicVariable 'RPP_Paintball_TeamRed';

	_msg = 'You are now in the Que for Team Red.';
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
	[] call RPP_Paintball_Dialog;
}] call RPP_Function;
publicVariable 'RPP_Paintball_JoinTeamRed';

["RPP_Paintball_JoinTeamBlue", {
	if (!(RPP_PaintBall_Ticket)) exitWith {
		_msg = 'You need to buy a ticket befor you can play.';
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (RPP_Paintball_GameGoing) exitWith {
		_msg = 'There is already a game going.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_Paintball_TeamBlueCount >= 10) exitWith {
		_msg = 'This team is full, Max 10 players pr team.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player getVariable 'RPP_Paintball_Playing') exitWith {
		_msg = 'You are already in a Que.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (RPP_Paintball_TeamRedCount == 0 && RPP_Paintball_TeamBlueCount == 0) then {
		player setVariable ['RPP_Paintball_Host',true,true];
	};
	player setVariable ['RPP_Paintball_Playing',true,true];
	player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
	player setVariable ['RPP_Paintball_OnTeamBlue',true,true];
	RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount + 1;
	publicVariable 'RPP_Paintball_TeamBlueCount';

	RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue + [ [player] ];
	publicVariable 'RPP_Paintball_TeamBlue';

	_msg = 'You are now in the Que for Team Blue.';
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
	[] call RPP_Paintball_Dialog;
}] call RPP_Function;
publicVariable 'RPP_Paintball_JoinTeamBlue';

["RPP_Paintball_Readyup", {
	private ['_Red','_Blue','_msg','_color'];
	if (!(RPP_PaintBall_Ticket)) exitWith {
		_msg = 'You are not in a Que.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player getVariable 'RPP_Paintball_ReadytoPlay') exitWith {
		_Red = player getVariable 'RPP_Paintball_OnTeamRed';
		_Blue = player getVariable 'RPP_Paintball_OnTeamBlue';
		if (_Red) exitWith {
			RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount - 1;
			RPP_Paintball_TeamRed = RPP_Paintball_TeamRed - [[player]];
			publicVariable 'RPP_Paintball_TeamRed';
			publicVariable 'RPP_Paintball_TeamRedCount';

			RPP_PaintBall_Ticket = false;
			RPP_Paintball_Picket_Mag = false;
			RPP_Paintball_Picket_Weapon = false;
			RPP_Paintball_Magusing = '';
			RPP_Paintball_Weaponusing = '';

			player setVariable ['RPP_Paintball_Host',false,true];
			player setVariable ['RPP_Paintball_Playing',false,true];
			player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
			player setVariable ['RPP_Paintball_OnTeamRed',false,true];

			_msg = 'Successfully left the Que from Team Red.';
			_Color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
			closeDialog 1;
			[] call RPP_Paintball_Dialog;
		};
		if (_Blue) exitWith {
			RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount - 1;
			RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue - [[player]];
			publicVariable 'RPP_Paintball_TeamBlue';
			publicVariable 'RPP_Paintball_TeamBlueCount';

			RPP_PaintBall_Ticket = false;
			RPP_Paintball_Picket_Mag = false;
			RPP_Paintball_Picket_Weapon = false;
			RPP_Paintball_Magusing = '';
			RPP_Paintball_Weaponusing = '';

			player setVariable ['RPP_Paintball_Host',false,true];
			player setVariable ['RPP_Paintball_Playing',false,true];
			player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
			player setVariable ['RPP_Paintball_OnTeamBlue',false,true];

			_msg = 'Successfully left the Que from Team Blue.';
			_Color = RPP_Yellow;
			[_msg,_color] call RPP_MessageSystem;
			closeDialog 1;
			[] call RPP_Paintball_Dialog;
		};
	};
	player setVariable ['RPP_Paintball_ReadytoPlay',true,true];
	_msg = 'You are now ready.';
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
	[] call RPP_Paintball_Dialog;
}] call RPP_Function;
publicVariable 'RPP_Paintball_Readyup';

["RPP_Paintball_BuyTicket", {
	if (RPP_PaintBall_Ticket) exitWith {
		_msg = 'You already got a ticket.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_data = lbData [ 1502, ( lbCurSel 1502 ) ];
	_Array = '';

	if (_data == '') exitWith {
		if (!(RPP_Paintball_Picket_Weapon)) exitWith {
			_msg = 'Please select a weapon to use.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (!(RPP_Paintball_Picket_Mag)) exitWith {
			_msg = 'Please select a magazines to use.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
	};

	if (!(RPP_Paintball_Picket_Weapon)) exitWith {
		if (!(_data in RPP_Paintball_Weapons_Hit)) exitWith {
			_msg = 'Please select a Weapon first.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Paintball_Weaponusing = _data;
		_msg = 'Successfully picked a weapon now please select a magazine.';
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
		RPP_Paintball_Picket_Weapon = true;


		closeDialog 1;
		[] call RPP_Paintball_Dialog;
	};
	if (!(RPP_Paintball_Picket_Mag)) exitWith {
		if (_data == 'Weapon') exitWith {
			_msg = 'Please select a Magazine first.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		RPP_Paintball_Magusing = _data;
		_msg = 'Successfully picked a magazine to use. Ticket bought.';
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
		RPP_PaintBall_Ticket = true;
		RPP_Paintball_Picket_Mag = true;

		closeDialog 1;
		[] call RPP_Paintball_Dialog;
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_BuyTicket';

["RPP_Paintball_StartGame", {
	if (!(player getVariable 'RPP_Paintball_Host')) exitWith {
		_msg = 'You are not the Host.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(player getVariable 'RPP_Paintball_ReadytoPlay')) exitWith {
		_msg = 'Please click the ready button first.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player getVariable 'RPP_Paintball_Gamemode' == '') exitWith {
		_msg = 'Please select a game mode.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(RPP_Paintball_TeamBlueCount == RPP_Paintball_TeamRedCount && RPP_Paintball_TeamRedCount == RPP_Paintball_TeamBlueCount)) exitWith {
		_msg = 'The teams are not Equeld.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	RPP_Paintball_GameGoing = true;
	publicVariable 'RPP_Paintball_GameGoing';
	_msg = 'Game Started.';
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	_gamemode = player getVariable 'RPP_Paintball_Gamemode';

	[[player,_gamemode], 'RPP_Paintball_StartGame_TptoArea',true] call BIS_FNC_MP;
	[] call RPP_Paintball_MatchStatus;

	_msg = '::PAINTBALL NEWS:: A Paintball match has just started.';
	[_msg] call RPP_Message_Global;
}] call RPP_Function;
publicVariable 'RPP_Paintball_StartGame';

["RPP_Paintball_MatchStatus", {
	[] spawn {
		while {RPP_Paintball_GameGoing} do {
			if (RPP_Paintball_TeamBlueCount <= 0 && RPP_Paintball_TeamRedCount > 0) exitWith {
				_msg = '::PAINTBALL NEWS:: Team Red just won the Paintball match.';
				[_msg] call RPP_Message_Global;
				RPP_Paintball_TeamBlueCount = 0;
				RPP_Paintball_TeamRedCount = 0;
				publicVariable 'RPP_Paintball_TeamBlueCount';
				publicVariable 'RPP_Paintball_TeamRedCount';
				RPP_Paintball_GameGoing = false;
				publicVariable 'RPP_Paintball_GameGoing';
				[[], 'RPP_Paintball_MatchOver', true] call BIS_FNC_MP;
				player setpos (getMarkerPos 'paintBall_frontSpawn');
			};
			if (RPP_Paintball_TeamRedCount <= 0 && RPP_Paintball_TeamBlueCount > 0) exitWith {
				_msg = '::PAINTBALL NEWS:: Team Blue just won the Paintball match.';
				[_msg] call RPP_Message_Global;
				RPP_Paintball_TeamBlueCount = 0;
				RPP_Paintball_TeamRedCount = 0;
				publicVariable 'RPP_Paintball_TeamBlueCount';
				publicVariable 'RPP_Paintball_TeamRedCount';
				RPP_Paintball_GameGoing = false;
				publicVariable 'RPP_Paintball_GameGoing';
				[[], 'RPP_Paintball_MatchOver', true] call BIS_FNC_MP;
				player setpos (getMarkerPos 'paintBall_frontSpawn');

			};
			if (RPP_Paintball_TeamBlueCount == 0 && RPP_Paintball_TeamRedCount == 0) exitWith {
				RPP_Paintball_GameGoing = false;
				publicVariable 'RPP_Paintball_GameGoing';

				_msg = 'The game is now over.';
				_color = RPP_Yellow;
				[_msg,_color] call RPP_MessageSystem;
				[[], 'RPP_Paintball_MatchOver', true] call BIS_FNC_MP;
			};
			sleep 1;
		};
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_MatchStatus';

["RPP_Paintball_MatchOver", {
	[] call RPP_PaintBall_Var;
	_Red = player getVariable 'RPP_Paintball_OnTeamRed';
	_Blue = player getVariable 'RPP_Paintball_OnTeamBlue';
	if (_Red) exitWith {
		RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount - 1;
		RPP_Paintball_TeamRed = RPP_Paintball_TeamRed - [[player]];
		publicVariable 'RPP_Paintball_TeamRed';
		publicVariable 'RPP_Paintball_TeamRedCount';

		RPP_PaintBall_Ticket = false;
		RPP_Paintball_Picket_Mag = false;
		RPP_Paintball_Picket_Weapon = false;
		RPP_Paintball_Magusing = '';
		RPP_Paintball_Weaponusing = '';

		player setVariable ['RPP_Paintball_Host',false,true];
		player setVariable ['RPP_Paintball_Playing',false,true];
		player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
		player setVariable ['RPP_Paintball_OnTeamRed',false,true];
		player setpos (getMarkerPos 'paintBall_frontSpawn');

		_pickrandom = RPP_Paintball_Clothes call bis_fnc_selectrandom;
		player forceAddUniform _pickrandom;
		removeAllWeapons player;

		[] call RPP_PaintBall_Var;
	};
	if (_Blue) exitWith {
		RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount - 1;
		RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue - [[player]];
		publicVariable 'RPP_Paintball_TeamBlue';
		publicVariable 'RPP_Paintball_TeamBlueCount';

		RPP_PaintBall_Ticket = false;
		RPP_Paintball_Picket_Mag = false;
		RPP_Paintball_Picket_Weapon = false;
		RPP_Paintball_Magusing = '';
		RPP_Paintball_Weaponusing = '';

		player setVariable ['RPP_Paintball_Host',false,true];
		player setVariable ['RPP_Paintball_Playing',false,true];
		player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
		player setVariable ['RPP_Paintball_OnTeamBlue',false,true];
		player setpos (getMarkerPos 'paintBall_frontSpawn');
		_pickrandom = RPP_Paintball_Clothes call bis_fnc_selectrandom;
		player forceAddUniform _pickrandom;
		removeAllWeapons player;

		[] call RPP_PaintBall_Var;
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_MatchOver';

["RPP_Paintball_StartGame_TptoArea", {
	_host = _this select 0;
	_gamemode = _this select 1;
	{
		if (_x getVariable 'RPP_Paintball_OnTeamBlue') then {
			RPP_PaintBall_OldUniform = uniform player;
			RPP_PaintBall_OldWeapon = weapons player;
			_x setpos (getMarkerPos 'paintBall_BlueTeamSpawn');
			_x forceAddUniform 'Paintball_Uniform_blue_01_B';
			[[], 'RPP_Paintball_AddWeapons', _x] call BIS_FNC_MP;
			player addEventHandler['handleDamage',{_this call RPP_Paintball_Hit;}];

			if (_gamemode == 'Deatch Match') then {
				[] call RPP_Paintball_Mode_DeatchMatch;
			};
		};
		if (_x getVariable 'RPP_Paintball_OnTeamRed') then {
			RPP_PaintBall_OldUniform = uniform player;
			RPP_PaintBall_OldWeapon = weapons player;
			_x setpos (getMarkerPos 'paintBall_RedTeamSpawn');
			_x forceAddUniform 'Paintball_Uniform_Fun_Camo_01_O';
			[[], 'RPP_Paintball_AddWeapons', true] call BIS_FNC_MP;
			player addEventHandler['handleDamage',{_this call RPP_Paintball_Hit;}];

			if (_gamemode == 'Deatch Match') then {
				[] call RPP_Paintball_Mode_DeatchMatch;
			};
		};
	} foreach playableUnits;
}] call RPP_Function;
publicVariable 'RPP_Paintball_StartGame_TptoArea';

["RPP_Paintball_AddWeapons", {
	if (player getVariable "RPP_Paintball_Playing") then {
		player addWeapon RPP_Paintball_Weaponusing;
		player addMagazine RPP_Paintball_Magusing;
		player addMagazine RPP_Paintball_Magusing;
		player addMagazine RPP_Paintball_Magusing;
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_AddWeapons';

["RPP_Paintball_Mode_DeatchMatch", {
	[] spawn {
		_Minute = 5;
		_Seconds = 25;

		while {player getVariable 'RPP_Paintball_Playing'} do {
			hintSilent format ['Match Time left: %1:%2',_Minute,_Seconds];
			player allowDamage false;
			sleep 1;
			if (_Seconds == 0 && _Minute == 0) exitWith {
				if (player getVariable 'RPP_Paintball_OnTeamBlue') exitWith {
					RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount - 1;
					RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue - [[player]];
					publicVariable 'RPP_Paintball_TeamBlue';
					publicVariable 'RPP_Paintball_TeamBlueCount';
					removeAllWeapons player;
					player allowDamage true;

					RPP_PaintBall_Ticket = false;
					RPP_Paintball_Picket_Mag = false;
					RPP_Paintball_Picket_Weapon = false;
					RPP_Paintball_Magusing = '';
					RPP_Paintball_Weaponusing = '';

					player setVariable ['RPP_Paintball_Host',false,true];
					player setVariable ['RPP_Paintball_Playing',false,true];
					player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
					player setVariable ['RPP_Paintball_OnTeamBlue',false,true];
					_msg = 'The Match is now over';
					_color = RPP_Yellow;
					[_msg,_color] call RPP_MessageSystem;

					player setpos (getMarkerPos 'paintBall_frontSpawn');
					
					player forceAddUniform RPP_PaintBall_OldUniform;
					if (!(RPP_PaintBall_OldWeapon == "")) then {
						player addWeapon RPP_PaintBall_OldWeapon;
					};
				};
				if (player getVariable 'RPP_Paintball_OnTeamRed') exitWith {
					RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount - 1;
					RPP_Paintball_TeamRed = RPP_Paintball_TeamRed - [[player]];
					publicVariable 'RPP_Paintball_TeamRed';
					publicVariable 'RPP_Paintball_TeamRedCount';

					removeAllWeapons player;
					player allowDamage true;

					RPP_PaintBall_Ticket = false;
					RPP_Paintball_Picket_Mag = false;
					RPP_Paintball_Picket_Weapon = false;
					RPP_Paintball_Magusing = '';
					RPP_Paintball_Weaponusing = '';

					player setVariable ['RPP_Paintball_Host',false,true];
					player setVariable ['RPP_Paintball_Playing',false,true];
					player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
					player setVariable ['RPP_Paintball_OnTeamRed',false,true];
					_msg = 'The Match is now over';
					_color = RPP_Yellow;
					[_msg,_color] call RPP_MessageSystem;
					player setpos (getMarkerPos 'paintBall_frontSpawn');
					player forceAddUniform RPP_PaintBall_OldUniform;
					if (!(RPP_PaintBall_OldWeapon == "")) then {
						player addWeapon RPP_PaintBall_OldWeapon;
					};
				};
			};
			if (_Seconds == 0) then {
				_Minute = _Minute - 1;
				_Seconds = 59;
			};
			if (!(RPP_Paintball_GameGoing)) exitWith {
				if (player getVariable 'RPP_Paintball_OnTeamBlue') exitWith {
					RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount - 1;
					RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue - [[player]];
					publicVariable 'RPP_Paintball_TeamBlue';
					publicVariable 'RPP_Paintball_TeamBlueCount';
					removeAllWeapons player;
					player allowDamage true;

					RPP_PaintBall_Ticket = false;
					RPP_Paintball_Picket_Mag = false;
					RPP_Paintball_Picket_Weapon = false;
					RPP_Paintball_Magusing = '';
					RPP_Paintball_Weaponusing = '';

					player setVariable ['RPP_Paintball_Host',false,true];
					player setVariable ['RPP_Paintball_Playing',false,true];
					player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
					player setVariable ['RPP_Paintball_OnTeamBlue',false,true];
					_msg = 'The Match is now over';
					_color = RPP_Yellow;
					[_msg,_color] call RPP_MessageSystem;

					player setpos (getMarkerPos 'paintBall_frontSpawn');
					player forceAddUniform RPP_PaintBall_OldUniform;
					if (!(RPP_PaintBall_OldWeapon == "")) then {
						player addWeapon RPP_PaintBall_OldWeapon;
					};
				};
				if (player getVariable 'RPP_Paintball_OnTeamRed') exitWith {
					RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount - 1;
					RPP_Paintball_TeamRed = RPP_Paintball_TeamRed - [[player]];
					publicVariable 'RPP_Paintball_TeamRed';
					publicVariable 'RPP_Paintball_TeamRedCount';

					removeAllWeapons player;
					player allowDamage true;

					RPP_PaintBall_Ticket = false;
					RPP_Paintball_Picket_Mag = false;
					RPP_Paintball_Picket_Weapon = false;
					RPP_Paintball_Magusing = '';
					RPP_Paintball_Weaponusing = '';

					player setVariable ['RPP_Paintball_Host',false,true];
					player setVariable ['RPP_Paintball_Playing',false,true];
					player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
					player setVariable ['RPP_Paintball_OnTeamRed',false,true];
					_msg = 'The Match is now over';
					_color = RPP_Yellow;
					[_msg,_color] call RPP_MessageSystem;
					player setpos (getMarkerPos 'paintBall_frontSpawn');
					player forceAddUniform RPP_PaintBall_OldUniform;
					if (!(RPP_PaintBall_OldWeapon == "")) then {
						player addWeapon RPP_PaintBall_OldWeapon;
					};
				};
			};
			_Seconds = _Seconds - 1;
		};
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_Mode_DeatchMatch';

["RPP_Paintball_Gamemode_DeatchMatch", {
	if (!(player getVariable 'RPP_Paintball_Host')) exitWith {
		_msg = 'You are not the Host.';
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	_DM = 'Deatch Match';
	if (player getVariable 'RPP_Paintball_Gamemode' == _dm) exitWith {
		_msg = 'This mode is already activated.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	player setVariable ['RPP_Paintball_Gamemode',_dm,true];
	_msg = format ['Successfully set game mode to: %1',_dm];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable 'RPP_Paintball_Gamemode_DeatchMatch';

["RPP_Paintball_Hit", {
	_unit = _this select 0;
	_causedby = _this select 3;
	_id = getPlayerUID _causedby;
	if (getPlayerUID _causedby == getPlayerUID _unit) exitWith {}; 

	if (currentWeapon _causedby in RPP_Paintball_Weapons_Hit) then { 
		[[_causedby], 'RPP_Paintball_Hit_Do', _unit] call BIS_FNC_MP;
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_Hit';

["RPP_Paintball_Hit_Do", {
	if (player getVariable 'RPP_Paintball_OnTeamRed') exitWith {
		RPP_Paintball_TeamRedCount = RPP_Paintball_TeamRedCount - 1;
		RPP_Paintball_TeamRed = RPP_Paintball_TeamRed - [[player]];
		publicVariable 'RPP_Paintball_TeamRed';
		publicVariable 'RPP_Paintball_TeamRedCount';

		removeAllWeapons player;

		RPP_PaintBall_Ticket = false;
		RPP_Paintball_Picket_Mag = false;
		RPP_Paintball_Picket_Weapon = false;
		RPP_Paintball_Magusing = '';
		RPP_Paintball_Weaponusing = '';

		player setVariable ['RPP_Paintball_Host',false,true];
		player setVariable ['RPP_Paintball_Playing',false,true];
		player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
		player setVariable ['RPP_Paintball_OnTeamRed',false,true];
		player setpos (getMarkerPos 'paintBall_frontSpawn');
		_msg = 'You have been hit and are now out of the game.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		player removeEventHandler ['handleDamage', 0];
		player addEventHandler['handleDamage',{_this call RPP_Tased;}];

		_pickrandom = RPP_Paintball_Clothes call bis_fnc_selectrandom;
		player forceAddUniform _pickrandom;
	};
	if (player getVariable 'RPP_Paintball_OnTeamBlue') exitWith {
		RPP_Paintball_TeamBlueCount = RPP_Paintball_TeamBlueCount - 1;
		RPP_Paintball_TeamBlue = RPP_Paintball_TeamBlue - [[player]];
		publicVariable 'RPP_Paintball_TeamBlue';
		publicVariable 'RPP_Paintball_TeamBlueCount';

		removeAllWeapons player;

		RPP_PaintBall_Ticket = false;
		RPP_Paintball_Picket_Mag = false;
		RPP_Paintball_Picket_Weapon = false;
		RPP_Paintball_Magusing = '';
		RPP_Paintball_Weaponusing = '';

		player setVariable ['RPP_Paintball_Host',false,true];
		player setVariable ['RPP_Paintball_Playing',false,true];
		player setVariable ['RPP_Paintball_ReadytoPlay',false,true];
		player setVariable ['RPP_Paintball_OnTeamBlue',false,true];
		player setpos (getMarkerPos 'paintBall_frontSpawn');
		_msg = 'You have been hit and are now out of the game.';
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
		player removeEventHandler ['handleDamage', 0];
		player addEventHandler['handleDamage',{_this call RPP_Tased;}];

		_pickrandom = RPP_Paintball_Clothes call bis_fnc_selectrandom;
		player forceAddUniform _pickrandom;
	};
}] call RPP_Function;
publicVariable 'RPP_Paintball_Hit_Do';