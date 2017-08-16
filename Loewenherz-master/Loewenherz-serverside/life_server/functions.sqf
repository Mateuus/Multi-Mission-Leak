lhm_fnc_sidechat =
compileFinal "
	if(lhm_sidechat) then {lhm_sidechat = false;} else {lhm_sidechat = true;};
	[[player,lhm_sidechat,playerSide],""TON_fnc_managesc"",false,false] call lhm_fnc_mp;
	[] call lhm_fnc_settingsMenu;
";


TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[[lhm_atmcash,lhm_cash,owner player,player],""lhm_fnc_admininfo"",_ret,false] call lhm_fnc_mp;
";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	lhm_atmcash = lhm_atmcash + _val;
	hint format[""%1 hat dir $%2 ueberwiesen."",_from,[_val] call lhm_fnc_numberText];

";


TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";



TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		lhm_my_gang = ObjNull;
		lhm_gangData = [];
		[player] joinSilent (createGroup civilian);
		hint ""Du wurdest aus der Gang entfernt!"";

	};
";


TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in lhm_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir Schluessel fuer %2 gegeben"",_giver,_name];
		lhm_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] call lhm_fnc_mp;
	};
";



TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist der neue Anfuehrer!"";
	};
";



//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""Du musst zum senden eine Nachricht eingeben!"";ctrlShow[3022,true];};

	[[_msg,name player,5],""TON_fnc_clientMessage"",independent,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Du hast eine Nachricht an alle Medizinisches Einheiten gesendet!"",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Du musst zum senden einen Spieler auswaehlen.""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Du musst zum senden eine Nachricht eingeben!"";ctrlShow[3015,true];};

	[[_msg,name player,0],""TON_fnc_clientMessage"",_to,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Du sendest %1 folgende Nachricht: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""Du musst zum senden einen Spieler auswaehlen."";ctrlShow[3016,true];};

	[[_msg,name player,1],""TON_fnc_clientMessage"",true,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Du sendest %1 folgende Nachricht: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Du musst zum senden einen Spieler auswaehlen."";ctrlShow[3017,true];};

	[[_msg,name player,2],""TON_fnc_clientMessage"",true,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Du sendest %1 folgende Nachricht: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call lhm_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Du musst zum senden eine Nachricht eingeben!"";};

	[[_msg,name player,3],""TON_fnc_clientMessage"",_to,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Admin Nachricht an: %1 - Nachricht: %2"",name _to,_msg];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call lhm_adminlevel) < 1) exitWith {hint ""Du bist kein Admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Du musst zum senden eine Nachricht eingeben!"";};

	[[_msg,name player,4],""TON_fnc_clientMessage"",true,false] call lhm_fnc_mp;
	[] call lhm_fnc_cellphone;
	hint format[""Admin Nachricht an alle: %1"",_msg];
";

//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format["">>>Nachricht von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Du hast eine private Nachricht von %1 erhalten"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""---911 MELDUNG VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Neue Meldung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>an: <t color='#ffffff'>Alle Beamten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""PoliceDispatch"",[format[""Neuer Polizeibericht von: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2 :
		{
			if((call lhm_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""ADMIN ANFRAGE VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""AdminDispatch"",[format[""%1 hat ein Admin angefordert"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Gesendet von Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>An Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Du hast eine Nachricht von einem Admin erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call lhm_adminlevel) > 0) then {systemChat _admin;};
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Gesendet von Admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>den Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Du hast eine Nachricht von einem Admin erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call lhm_adminlevel) > 0) then {systemChat _admin;};
		};

		case 5: {
			private[""_message""];
			_message = format[""EMS ANFRAGE: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>EMS ANFRAGE<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""EMS ANFRAGE von %1"",_from]]] call bis_fnc_showNotification;
		};

		case 6: {
			private[""_message""];
			_message = format[""!!!SECURITY ANFRAGE: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>SECURITY-SERVICE ANFRAGE<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Einheiten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachrichten:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""SECURITY ANFRAGE von %1"",_from]]] call bis_fnc_showNotification;
		};
	};
";

lhm_fnc_setTimeGlobal =
compileFinal
 "
	if (daytime < 6 || daytime > 18) then {
	diag_log ""Server changed to Day"";
	_timeToSkipTo = 13;
	skipTime (_timeToSkipTo - daytime + 24 ) mod 24;
	} else {
	diag_log ""Server changed to Night"";
	_timeToSkipTo = 23;
	skipTime (_timeToSkipTo - daytime + 24 ) mod 24;
   };
";

// Baseshield Dmg Off
lhm_fnc_PlayertriggerDamageOff =
compileFinal
 "
	private [""_args""];
	_args = _this select 0;
	_args allowDamage false;
	diag_log format[""Server: Damage Off for %1"",name _args];

";

// Baseshield Dmg On
lhm_fnc_PlayertriggerDamageOn =
compileFinal
 "
	private [""_args""];
	_args = _this select 0;
	_args allowDamage true;
	diag_log format[""Server: Damage On for %1"",name _args];
";

// Invisible Player On
lhm_fnc_invisibleOn =
compileFinal
 "
	private [""_args""];
	_args = _this select 0;
	_args hideObjectGlobal true;
	diag_log format[""Server: Invisible On for %1"",name _args];
";

// Invisible Player Off
lhm_fnc_invisibleOff =
compileFinal
 "
	private [""_args""];
	_args = _this select 0;
	_args hideObjectGlobal false;
	diag_log format[""Server: Invisible Off for %1"",name _args];
";

// clear cargo from object global
lhm_fnc_init_clearCargo =
compileFinal
 "
	private [""_args""];
	_args = _this select 0;
	clearWeaponCargoGlobal _args;
	clearMagazineCargoGlobal _args;
	clearBackpackCargoGlobal _args;
	clearItemCargoGlobal _args;
	diag_log format[""Server: Clear Cargo for %1"",_args];
";

[
"lhm_fnc_sidechat",
"TON_fnc_player_query",
"TON_fnc_index",
"TON_fnc_clientWireTransfer",
"TON_fnc_isnumber",
"TON_fnc_clientGangKick",
"TON_fnc_clientGetKey",
"TON_fnc_clientGangLeader",
"TON_fnc_cell_textmsg",
"TON_fnc_cell_textcop",
"TON_fnc_cell_textadmin",
"TON_fnc_cell_adminmsg",
"TON_fnc_cell_adminmsgall",
"TON_fnc_cell_emsrequest",
"TON_fnc_clientMessage",
"lhm_fnc_init_clearCargo"
] spawn lhm_fnc_streamFunction;