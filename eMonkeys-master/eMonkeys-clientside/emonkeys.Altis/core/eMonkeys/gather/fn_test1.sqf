
[] execVM "core\eMonkeys\objects\init_obj.sqf";

EMonkeys_fnc_sidechat =
compileFinal "
	if(EMonkeys_sidechat) then {EMonkeys_sidechat = false;} else {EMonkeys_sidechat = true;};
	[[player,EMonkeys_sidechat,playerSide],""TON_fnc_managesc"",false,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_settingsMenu;
";


fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	
	[[EMonkeys_a164,EMonkeys_c164,owner player,player],""EMonkeys_fnc_admininfo"",_ret,false] call EMonkeys_fnc_mp;
";




clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	EMonkeys_a164 = EMonkeys_a164 + _val;
	hint format[""%1 hat dir %2€ überwiesen."",_from,[_val] call EMonkeys_fnc_numberText];
	[1] call SOCK_fnc_updatePartial;
	_text = format [""*** Überweisung | SpielerID Empfänger: %1 | Name Empfänger: %2 | Erhalten von: %3 | Betrag: %4 |"",getPlayerUID player,name player,_from,_val];
	[[4,_text],""TON_fnc_log"",false,false] call EMonkeys_fnc_mp;
";


fnc_isnumber =
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



clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		eM_my_gang = ObjNull;
		switch (playerSide) do
		{
			case civilian: {[player] joinSilent (createGroup civilian)};
			case east: {[player] joinSilent (createGroup east)}
		};
		hint ""Du wurdest aus der Gang geworfen"";
		
	};
";


clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in EMonkeys_vehic164)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 gab dir einen Schlüssel für eine(n) %2"",_giver,_name];
		EMonkeys_vehic164 pushBack _vehicle;
	};
";



clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist der neue Gruppenleiter geworden"";
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
fnc_cell_emsrequest = 
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""EMS Units"";
	if(_msg == """") exitWith {hint ""You must enter a message to send!"";ctrlShow[3022,true];};
		
	[[_msg,name player,7],""clientMessage"",independent,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Nachricht an den Notarzt versendet!"",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Wähle einen Spieler aus, den du anschreiben möchtest!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";ctrlShow[3015,true];};
	
	[[_msg,name player,0],""clientMessage"",_to,false] call EMonkeys_fnc_mp;
	
	[] call EMonkeys_fnc_cellphone;
	hint format[""Du hast %1 folgende SMS geschrieben: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""The Police"";
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""clientMessage"",west,false] call EMonkeys_fnc_mp;

	[] call EMonkeys_fnc_cellphone;
	hint format[""Du hast %1 folgende SMS geschrieben: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""The Admins"";
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";ctrlShow[3017,true];};

	[[_msg,name player,2],""clientMessage"",true,false] call EMonkeys_fnc_mp;

	[] call EMonkeys_fnc_cellphone;
	hint format[""Du hast %1 folgende SMS geschrieben: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call EMonkeys_adminlevel) < 1) exitWith {hint ""Sorry aber du bist kein Admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";};
	
	[[_msg,name player,3],""clientMessage"",_to,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Admin Nachricht an %1: - %2"",name _to,_msg];
";

fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call EMonkeys_adminlevel) < 1) exitWith {hint ""Sorry aber du bist kein Admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";};
	
	[[_msg,name player,4],""clientMessage"",true,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Admin Nachricht an alle: %1"",_msg];
";

fnc_cell_copmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call EMonkeys_coplevel) < 1) exitWith {hint ""Du bist kein Cop!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?!"";};
	
	[[_msg,name player,5],""clientMessage"",true,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Polizeimeldung gesendet: %1"",_msg];
";

//To All ADAC
fnc_cell_textadac =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""ADAC"";
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""clientMessage"",true,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Du hast %1 folgende SMS geschrieben: %2"",_to,_msg];
	ctrlShow[3016,true];
";

//To All lotsen
fnc_cell_textlotse =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""Lotsen"";
	if(_msg == """") exitWith {hint ""Willst du wirklich eine leere Nachricht abschicken?"";ctrlShow[3016,true];};
		
	[[_msg,name player,1],""clientMessage"",true,false] call EMonkeys_fnc_mp;
	[] call EMonkeys_fnc_cellphone;
	hint format[""Du hast %1 folgende SMS geschrieben: %2"",_to,_msg];
	ctrlShow[3016,true];
";

//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
	6 = ADAC
*/
clientMessage =
compileFinal "
	if(!hasInterface && isServer) exitWith {};
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
			if(!(""ItemRadio"" in (assignedItems  player))) exitWith {hint ""Dir hat jemand eine SMS gesendet, da du kein Handy hast kann sie nicht angezeigt werden.""};
			_message = format["">>>NACHRICHT VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			CPE_Last_Message = _from;
			[] call EMonkeys_fnc_cellex_lastcontacts;
			_lmsg = format[""NACHRICHT VON %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;

		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""---110 POLIZEIRUF %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Polizeiruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			CPE_Last_Message = _from;
			[] call EMonkeys_fnc_cellex_lastcontacts;
			_lmsg = format[""110 POLIZEIRUF %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		
		case 2 :
		{
			if((call EMonkeys_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""???ADMIN ANFRAGE VON %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Admin-Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			player say3D ""alert"";
			
			systemChat _message;
			_lmsg = format[""ADMIN ANFRAGE VON %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		
		case 3 :
		{
			private[""_message""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Sender: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>Admin<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			if((call EMonkeys_adminlevel) > 0) then {systemChat _admin;};
			_lmsg = format[""ADMIN NACHRICHT: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		
		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!ADMIN NACHRICHT: %1"",_msg];
			_admin = format[""Sender: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Admins<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			if((call EMonkeys_adminlevel) > 0) then {systemChat _admin;};
			_lmsg = format[""Admin Message :<br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		
		case 5 :
		{
			private[""_message"",""_admin""];
			_message = format[""!!!Polizeimeldung: %1"",_msg];
			_admin = format[""Sender: %1"", _from];
			hint parseText format [""<t color='#00AAFF'><t size='2'><t align='center'>Polizeimeldung<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>Polizei HQ<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			if((call EMonkeys_adminlevel) > 0) then {systemChat _admin;};
			_lmsg = format[""Polizeimeldung: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		
		case 6 :
		{			
			if(([""adac""] call EMonkeys_fnc_permLevel) < 1) exitWith {};
		
			private[""_message""];
			_message = format[""---ADAC %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffff00'><t size='2'><t align='center'>ADAC-Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>ADAC<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			CPE_Last_Message = _from;
			[] call EMonkeys_fnc_cellex_lastcontacts;
			_lmsg = format[""ADAC %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
		case 7 : 
		{
			if(side player != independent) exitWith {};
			private[""_message""];
			_message = format[""---112 Feuerwehr Notruf %1: %2"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Feuerwehr Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Feuerwehrleute<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			
			player say3D ""alert"";
			systemChat _message;
			CPE_Last_Message = _from;
			[] call EMonkeys_fnc_cellex_lastcontacts;
			_lmsg = format[""112 Sanitäter Notruf %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
	
		case 8 :
		{			
			if(([""lotse""] call EMonkeys_fnc_permLevel) < 1) exitWith {};
		
			private[""_message""];
			_message = format[""---Lotse %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffff00'><t size='2'><t align='center'>Lotsen-Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Lotse<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			player say3D ""alert"";
			systemChat _message;
			CPE_Last_Message = _from;
			[] call EMonkeys_fnc_cellex_lastcontacts;
			_lmsg = format[""Lotse %1: <br/> %2"",_from,_msg];
			eM_lastMessage pushBack _lmsg;
		};
};
";

EMonkeys_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

EMonkeys_fnc_removePrice = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	_mode = _this select 2;
	if(_unit != player) exitWith {};
	switch (_mode) do
	{
		case 0:	{EMonkeys_a164 = EMonkeys_a164 - _price;};
		case 1: {EMonkeys_c164 = EMonkeys_c164 - _price;};
	};
	[0] call SOCK_fnc_updatePartial;
";


EMonkeys_impound_inusever = {

eM_impound_inuse = _this 

};

EMonkeys_garage_storever = {

eM_garage_store = _this 

};
EMonkeys_action_inUsever = {

eM_action_inUse = _this ;

};

EMonkeys_fnc_countATM = compileFinal
"
	if(true) exitWith {};
	if(!eM_use_atm) exitWith {};
	_round = 0;
	while {true} do
	{
		uisleep 10;
		_round = _round + 1;
		if(_round >= 12) exitWith {EMonkeys_atmUsed = 0};
		if(EMonkeys_atmUsed >= 5) exitWith
		{
			uisleep 180;
			EMonkeys_atmUsed = 0;
		};
	};
";