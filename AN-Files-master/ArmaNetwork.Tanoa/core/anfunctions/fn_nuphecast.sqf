if(isServer) exitWith {};
private["_msg","_from", "_type"];
_msg = _this select 0;
_from = _this select 1;
_type = _this select 2;
if(_from isEqualTo "") exitWith {};
switch (_type) do
	{
		case 0 :
		{
			private["_message"];
			_message = format["::::::MESSAGE FROM %1: %2",_from,_msg];
			systemChat _message;
			if(life_silentMode) exitWith {};
			hintSilent parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>New SMS<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			if((call life_coplevel) < 0) exitWith {};
			private["_message"];
			_message = format["::::::POLICE DISPATCH FROM %1: %2",_from,_msg];
			systemChat _message;
			if(life_silentMode) exitWith {};
			hintSilent parseText format ["<t color='#316dff'><t size='2'><t align='center'>New Dispatch<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Police Units<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		};

		case 2:
		{
			if(side player != independent) exitWith {};
			if((call life_medicLevel) < 0) exitWith {};
			private["_message"];
			_message = format["::::::EMS REQUEST: %1",_msg];
			systemChat _message;
			if(life_silentMode) exitWith {};
			hintSilent parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>EMS Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>EMS Units<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		};

		case 3:
		{
			if(side player != east) exitWith {};
			private["_message"];
			_message = format["::::::MECHANIC REQUEST: %1",_msg];
			systemChat _message;
			if(life_silentMode) exitWith {};
			hintSilent parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>MECHANIC Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>You<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		};

		case 4:
		{
			if((call life_adminlevel) < 1) exitWith {};
			private["_message"];
			_message = format[":::::::ADMIN REQUEST FROM %1: %2",_from,_msg];
			systemChat _message;
			hintSilent parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Admin Request<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Admins<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		};

		case 5:
		{
			private["_message","_admin"];
			_message = format[":::::::ADMIN MESSAGE: %1",_msg];
			_admin = format["Sent by admin: %1", _from];
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
			hintSilent parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Admin Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Players<br/><t color='#33CC33'>From: <t color='#ffffff'>The Admins<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];
			["AdminMessage",["You Have Received A Message From An Admin!"]] call bis_fnc_showNotification;
		};

		case 6:
		{
			private["_message","_tsf"];
			_message = format[":::::::POLICE Announcement: %1",_msg];
			_tsf = format["Sent by Police Unit: %1", _from];
			hintSilent parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Police Announcement<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Citizens<br/><t color='#33CC33'>From: <t color='#ffffff'>TSO Command<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];
			["PoliceAN",["You Have Received A Message From The TSO!"]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_coplevel) > 0) then {systemChat _tsf;};
		};
		case 7:
		{
			private["_message"];
			_message = "::::::PUBLIC ANNOUNCEMENT FROM THE GOVERNMENT";
			hintSilent parseText format ["<t color='#316dff'><t size='2'><t align='center'>PUBLIC ANNOUNCEMENT<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>Citizens<br/><t color='#33CC33'>From: <t color='#ffffff'>Government<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];
			systemChat _message;
		};
		case 8:
		{
			if(side player != west) exitWith {};
			private["_message"];
			_message = format["::::::BACKUP REQUEST FROM %1",_from];
			hintSilent parseText format ["<t color='#316dff'><t size='2'><t align='center'>BACKUP REQUESTED<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>All Available Units<br/><t color='#33CC33'>From: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>Backup has been requested by a unit at coordinates: %2! Check map for location",_from,_msg];
			["BackupRequest",[format["BACKUP REQUESTED: %1",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};
	};
