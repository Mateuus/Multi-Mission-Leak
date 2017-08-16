






publicVariable "life_fnc_sidechat";

SOA_fnc_index =
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
publicVariable "SOA_fnc_index";

SOA_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};
	
	[life_beatbankgeld,life_beatgeld,owner player,player,life_exp,life_level,life_adminlevel] remoteExecCall [""life_fnc_admininfo"",_ret];
";
publicVariable "SOA_fnc_player_query";

SOA_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([_val] call SOA_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	life_beatbankgeld = life_beatbankgeld + (parseNumber(_val));
	hint format[""%1 hat %2€ an dich überwiesen."",_from,[(parseNumber(_val))] call life_fnc_numberText];
	
";
publicVariable "SOA_fnc_clientWireTransfer";

SOA_fnc_isnumber =
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

publicVariable "SOA_fnc_isnumber";

SOA_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent grpNull;
		hint ""Du wurdest aus der Gang geschmissen."";
		
	};
";
publicVariable "SOA_fnc_clientGangKick";

SOA_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 hat dir die Schlüssel zu seinem %2 gegeben."",_giver,_name];
		life_vehicles pushBack _vehicle;
		[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall [""SOA_fnc_keyManagement"",2];
	};
";

publicVariable "SOA_fnc_clientGetKey";

SOA_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Du bist nun Anführer der Gruppierung."";
	};
";

publicVariable "SOA_fnc_clientGangLeader";

SOA_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	if(_type != 2) then {playsound ""notification""};
	switch (_type) do
	{
		case 0 :
		{
			[""TextMessage"",[format[""Du hast eine SMS von %1 erhalten"",_from]]] call bis_fnc_showNotification;

			_ui = uiNameSpace getVariable ['playerHUD',displayNull];
			_phoneicon = _ui displayCtrl 60;

			phonereceived = true;
			_phoneicon ctrlShow true;
		};
		
		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""Notruf: %1"",_msg];
			_person = format[""Anfrage gesendet von: %1"",_from];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Neuer Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""PoliceDispatch"",[format[""Neuer Polizeiruf von: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _person;
		};
		
		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""Supportanfrage von %1: %2"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Supportanfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Support<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""AdminDispatch"",[format[""%1 hat den Support angeschrieben!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 3 :
		{
			private[""_message""];
			_message = format[""Support: %1"",_msg];
			_admin = format[""Von %1 gesendet"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Support<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>Support<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""AdminMessage"",[""Du hast eine Supportnachricht erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""Support: %1"",_msg];
			_admin = format[""Von %1 gesendet"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Support<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle<br/><t color='#33CC33'>Von: <t color='#ffffff'>Support<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""AdminMessage"",[""Du hast eine Supportnachricht erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
		
		case 5: {
			private[""_message""];
			_message = format[""Notruf: %1"",_msg];
			_person = format[""Notruf gesendet von: %1"",_from];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Sanitäter<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""TextMessage"",[format[""Notruf von %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _person;
		};
		
		case 6: {
			private[""_message""];
			_message = format[""ADAC-Anfrage: %1"",_msg];
			_person = format[""Anfrage gesendet von: %1"",_from];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>ADAC-Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>ADAC<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""TextMessage"",[format[""ADAC-Anfrage von %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _person;
		}; 
		
		case 7:
		{
			private[""_message""];
			_message = format[""Polizei: %1"",_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Polizeihinweis<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle<br/><t color='#33CC33'>Von: <t color='#ffffff'>Polizei<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""PoliceDispatch"",[""Du hast einen Polizeihinweis erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 8 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""Hack-Verdacht bei %1: %2"",_from,_msg];
			hint parseText format [""<t color='#F00000'><t size='2'><t align='center'>Hack-Verdacht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Support<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Verwendet:<br/><t color='#ffffff'>%2"",_from,_msg];
			
			[""AdminDispatch"",[format[""Hack-Verdacht bei %1!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 9:
		{
			private[""_message""];
			_message = format[""ADAC: %1"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>ADAC-Hinweis<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle<br/><t color='#33CC33'>Von: <t color='#ffffff'>ADAC<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""ADACDispatch"",[""Du hast einen ADAC-Hinweis erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
		};
		
		case 10:
		{
			private[""_message""];
			_message = format[""Notdienst: %1"",_msg];
			hint parseText format [""<t color='#ff1000'><t size='2'><t align='center'>Notdienst<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle<br/><t color='#33CC33'>Von: <t color='#ffffff'>Notdienst<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1"",_msg];
			
			[""SaniDispatch"",[""Du hast einen Hinweis vom Notdienst erhalten!""]] call bis_fnc_showNotification;
			systemChat _message;
		};
	};
";
publicVariable "SOA_fnc_clientMessage";