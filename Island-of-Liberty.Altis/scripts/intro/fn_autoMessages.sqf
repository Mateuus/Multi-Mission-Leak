[] spawn {
	_messages = [ 
		 "<br/><br/>Wir sind eine neue Altis Life und Multigaming Community <br/><br/>Hier findest du gleichgesinnte Gamerfreunde. Wenn du fragen hast, besuche uns doch auf unserer Website oder im TeamSpeak <br/><br/> <t color='#FF0000' size='1.3'>www.Island-of-Liberty.com</t>"
	];

	_refreshTime = 4500;

	_i = 0;
	while {true} do {
		_count = count _messages;
		_message = _messages select _i;
		hint parseText format["<t color='#ff9900' size='2'>Island of Liberty</t><br/><t color='#ff9900' size='2'>Begrüßt dich!</t><br/><br/><img shadown='false' size='6' image='textures\allgemein\bilder\logo.jpg'/><br/><br/>%1", _message];
		sleep _refreshTime;
		if (_i == (_count - 1)) then {
			_i = 0;
		} else {
			_i = _i + 1;
		};
	};
};