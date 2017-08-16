/////////////////////////////////////////////////////////

//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
	if(isServer) exitWith {};
	private["_msg","_from", "_type"];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	_msgPacket = _this select 3;
	_fromSide = param [4,civilian,[civilian]];
	if(_from == "") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private["_message"];
			switch (_fromSide) do
				{
					case civilian:
					{
						_message = format[">>>Nachricht Von %1: %2",_from,_msg];
						hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

						["TextMessage",[format["Du hast eine neue Nachricht von %1",_from]]] call bis_fnc_showNotification;
						systemChat _message;

						if (isNil "DWEV_smartfone_messages") then {DWEV_smartfone_messages = [];};
						if (isNil "_msgPacket") exitwith {};
						DWEV_smartfone_messages pushback _msgPacket;

					};

					case west:
					{
						_message = format[">>>Nachricht Von %1: %2",_from,_msg];
						hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\Polizei128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

						["PoliceMessage",["Du hast eine Nachricht von einem Polizisten erhalten!"]] call bis_fnc_showNotification;
						systemChat _message;

						if (isNil "DWEV_smartfone_messages") then {DWEV_smartfone_messages = [];};
						if (isNil "_msgPacket") exitwith {};
						DWEV_smartfone_messages pushback _msgPacket;

					};

					case independent:
					{

						_message = format[">>>Nachricht Von %1: %2",_from,_msg];
						hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\Feuerwehr128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

						["feuernachricht",["Du hast eine Nachricht von der Feuerwehr erhalten!"]] call bis_fnc_showNotification;
						systemChat _message;

						if (isNil "DWEV_smartfone_messages") then {DWEV_smartfone_messages = [];};
						if (isNil "_msgPacket") exitwith {};
						DWEV_smartfone_messages pushback _msgPacket;

					};

					case east:
					{

						_message = format[">>>Nachricht Von %1: %2",_from,_msg];
						hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Neue Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\Sicherheit128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

						["OpforMessage",["Du hast eine Nachricht vom Sicherheitsdienst erhalten!"]] call bis_fnc_showNotification;
						systemChat _message;

						if (isNil "DWEV_smartfone_messages") then {DWEV_smartfone_messages = [];};
						if (isNil "_msgPacket") exitwith {};
						DWEV_smartfone_messages pushback _msgPacket;
					};
				};
		};

		case 1:
		{
			if(side player != west) exitWith {};
			private["_message"];
			_message = format["---110 Notruf von %1: %2",_from,_msg];
			hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Neuer Notruf<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Polizisten<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\polizeianfrage64.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

			["PoliceDispatch",[format["Eine neue Polizei Meldung von: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2:
		{
			if((call DWEV_adminlevel) < 2) exitWith {}; //Ab S
			private["_message"];
			_message = format["???ADMIN Anfrage von %1: %2",_from,_msg];
			hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Admins<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];

			["AdminDispatch",[format["%1 bittet um einen Admin.",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3:
		{
			private["_message"];
			_message = format["!!!ADMIN NACHRICHT: %1",_msg];
			_admin = format["gesendet von einem Admin: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\adminwolf.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["AdminMessage",["Du hast eine Nachricht von einem Admin erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			if((call DWEV_adminlevel) > 1) then {systemChat _admin;};  //Ab S
		};

		case 4:
		{
			private["_message","_admin"];
			_message = format["!!!ADMIN NACHRICHT: %1",_msg];
			_admin = format["gesendet von einem admin: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\adminwolf.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["AdminMessage",["Du hast eine Nachricht von einem Admin erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _admin;
		};

		case 5:
		{
			private["_message"];

				_message = format["!!!Feuerwehr Anfrage: %1",_msg];
				hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Feuerwehr Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\feueranfrage.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
				systemChat _message;
				["feuernachricht",[format["Eine neue Feuerwehr Anfrage von: %1",_from]]] call bis_fnc_showNotification;
		};

		case 6:
		{
			private["_message","_feuer"];
			_message = format["!!!Feuerwehr NACHRICHT: %1",_msg];
			_feuer = format["gesendet von einem Feuerwehrmann: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Feuerwehr Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\Feuerwehr128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["feuernachricht",["Du hast eine Nachricht von der Feuerwehr erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _feuer;
		};

		case 7:
		{
			private["_message","_polizei"];
			_message = format["!!!POLIZEI NACHRICHT: %1",_msg];
			_polizei = format["gesendet von einem Polizist: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Polizei Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\Polizei128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["PoliceMessage",["Du hast eine Nachricht von einem Polizisten erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _polizei;
		};

		case 8:
		{
			private["_message"];

				_message = format["!!!Sicherheitsdienst Anfrage: %1",_msg];
				hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Sicherheitsdienst Anfrage<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Dich<br/><t color='#33CC33'>Von: <t color='#ffffff'>%1<br/><br/><img image='icons\Sicherheit128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%2",_from,_msg];
				systemChat _message;
				["OpforMessage",[format["Eine neue Sicherheitsdienst Anfrage von: %1",_from]]] call bis_fnc_showNotification;
		};
		
		case 9:
		{
			private["_message","_opfor"];
			_message = format["!!!Sicherheitsdienst NACHRICHT: %1",_msg];
			_opfor = format["gesendet vom Sicherheitsdienst: %1", _from];
			hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Sicherheitsdienst Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\Sicherheit128.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["OpforMessage",["Du hast eine Nachricht vom Sicherheitsdienst erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _opfor;
		};
		//EventMsgAll
		case 10:
		{
			private["_message","_event"];
			_message = format["!!!EVENT-NACHRICHT: %1",_msg];
			_event = format["gesendet vom Eventmanager: %1", _from];

			hint parseText format ["<t color='#FFFF00'><t size='2'><t align='center'>Event-Nachricht<br/><br/><t color='#33CC33'><t align='left'><t size='1'>An: <t color='#ffffff'>Alle Spieler<br/><t color='#33CC33'>Von: <t color='#ffffff'>%2<br/><br/><img image='icons\adminwolf.paa' size='4' align='center'/><br/><t color='#33CC33'>Nachricht:<br/><t color='#ffffff'>%1",_msg, _from];

			["EventMessage",["Du hast eine Nachricht von einem Eventmanager erhalten!"]] call bis_fnc_showNotification;
			systemChat _message;
			systemChat _event;
		};
	};
