disableSerialization;
private["_phone","_bool"];
_bool = _this select 0;
_mode = _this select 1;

_dialog = finddisplay 3700;
_callpic = _dialog displayCtrl 3701;
_decallpic = _dialog displayCtrl 3708;
_buttoncall = _dialog displayCtrl 3706;
_buttondecall = _dialog displayCtrl 3709;
_eingabe = _dialog displayCtrl 3704;
_calltext = _dialog displayCtrl 3707;

if((player getvariable "life_callactive1") OR (player getvariable "life_callactive2")) exitWith {hint "Du führst bereits ein Gespräch!"};

If(!_bool) exitWith {
	_calltext ctrlSetText "Der Anruf wurde unterdrückt.";
	[1,"Anruf unterdrückt."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
	playsound "CallDenied";
	sleep 0.5;
	_calltext ctrlSetText "";
	sleep 0.5;
	_calltext ctrlSetText "Der Anruf wurde unterdrückt.";
	sleep 0.5;
	_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
};

switch(_mode) do {

	case 0: {
	life_guthaben = life_guthaben - 1000;
	
		if(!life_callinUse1) exitWith {
			life_callinUse1 = true;
			PublicVariable "life_callinUse1";
			life_radio_call1 radioChannelAdd [player, life_smartphoneTarget];
			setCurrentChannel 10;
			[10] remoteExecCall ["life_fnc_setChannel",life_smartphoneTarget];
			
			_callpic ctrlShow false;
			_buttoncall ctrlShow false;
			_decallpic ctrlShow true;
			_buttondecall ctrlShow true;
			_calltext ctrlSetText "Anruf im Gange...";

			player setVariable ["life_callactive1", true];
			["life_callactive1",true,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			
			hint format ["Anruf mit %1 gestartet, Sie haben 5 Minuten zum Telefonieren!",name life_smartphoneTarget];
			[1,"Anruf angenommen. Verbleibende Gesprächszeit: 5 Minuten."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];

			sleep (4 * 60);
			if!(player getvariable "life_callactive1") exitWith {};
			
			hint "Dir bleibt noch 1 Minute zum Telefonieren!";
			[1,"Verbleibende Gesprächszeit: 1 Minute."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			life_battery = life_battery - round(random 20);
			if(life_battery < 0) then {life_battery = 0};
			[] call life_fnc_hudUpdate;
			
			sleep 60;
			if!(player getvariable "life_callactive1") exitWith {};
			
			hint "Anruf beendet.";
			_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
			[1,"Anruf beendet Gesprächszeit abgelaufen."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			
			life_battery = life_battery - round(random 10);
			if(life_battery < 0) then {life_battery = 0};
			[] call life_fnc_hudUpdate;
			
			life_radio_call1 radioChannelRemove [player, life_smartphoneTarget];
			life_callinUse1 = false;
			PublicVariable "life_callinUse1";
			
			player setVariable ["life_callactive1", false];
			["life_callactive1",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		};

		if(!life_callinUse2) exitWith {
			life_callinUse2 = true;
			PublicVariable "life_callinUse2";
			life_radio_call2 radioChannelAdd [player, life_smartphoneTarget];
			setCurrentChannel 11;
			[11] remoteExecCall ["life_fnc_setChannel",life_smartphoneTarget];
			
			_callpic ctrlShow false;
			_buttoncall ctrlShow false;
			_decallpic ctrlShow true;
			_buttondecall ctrlShow true;
			_calltext ctrlSetText "Anruf im Gange...";

			player setVariable ["life_callactive2", true];
			["life_callactive2",true,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			
			hint format ["Anruf mit %1 gestartet, Sie haben 5 Minuten zum Telefonieren!",name life_smartphoneTarget];
			[1,"Anruf angenommen. Verbleibende Gesprächszeit: 5 Minuten."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			
			sleep (4 * 60);
			if!(player getvariable "life_callactive2") exitWith {};
			
			hint "Dir bleibt noch 1 Minute zum Telefonieren!";
			[1,"Verbleibende Gesprächszeit: 1 Minute."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget,false];
			life_battery = life_battery - round(random 20);
			if(life_battery < 0) then {life_battery = 0};
			[] call life_fnc_hudUpdate;
			
			sleep 60;
			if!(player getvariable "life_callactive2") exitWith {};
			
			hint "Anruf beendet.";
			_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
			[1,"Anruf beendet Gesprächszeit abgelaufen."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			life_battery = life_battery - round(random 10);
			if(life_battery < 0) then {life_battery = 0};
			[] call life_fnc_hudUpdate;
			
			
			life_radio_call2 radioChannelRemove [player, life_smartphoneTarget];
			life_callinUse2 = false;
			PublicVariable "life_callinUse2";
			
			player setVariable ["life_callactive2", false];
			["life_callactive2",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		};
	};

	case 1: {
		life_beatgeld = life_beatgeld - 1000;
		
		if(!life_callinUse1) exitWith {
			life_callinUse1 = true;
			PublicVariable "life_callinUse1";
			life_radio_call4 radioChannelAdd [player, life_smartphoneTarget]; 
			setCurrentChannel 12;
			[12] remoteExecCall ["life_fnc_setChannel",life_smartphoneTarget];
			
			_callpic ctrlShow false;
			_buttoncall ctrlShow false;
			_decallpic ctrlShow true;
			_buttondecall ctrlShow true;
			_calltext ctrlSetText "Anruf im Gange...";
			
			player setVariable ["life_callactive1", true];
			["life_callactive1",true,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];

			hint format ["Anruf mit %1 gestartet, Sie haben 2 Minuten zum Telefonieren!",name life_smartphoneTarget];
			[1,"Anruf angenommen. Verbleibende Gesprächszeit: 2 Minuten."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];

			sleep 60;
			if!(player getvariable "life_callactive1") exitWith {};
			
			hint "Dir bleibt noch 1 Minute zum Telefonieren!";
			[1,"Verbleibende Gesprächszeit: 1 Minute."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget,false];

			sleep 60;
			if!(player getvariable "life_callactive1") exitWith {};
			
			hint "Anruf beendet.";
			_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
			[1,"Anruf beendet Gesprächszeit abgelaufen."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			
			life_radio_call4 radioChannelRemove [player, life_smartphoneTarget];
			life_callinUse1 = false;
			PublicVariable "life_callinUse1";
			
			sleep 0.3;
			
			player setVariable ["life_callactive1", false];
			["life_callactive1",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		};

		if(!life_callinUse2) exitWith {
			life_callinUse2 = true;
			PublicVariable "life_callinUse2";
			life_radio_call5 radioChannelAdd [player, life_smartphoneTarget]; 
			setCurrentChannel 13;
			[13] remoteExecCall ["life_fnc_setChannel",life_smartphoneTarget];
			
			_callpic ctrlShow false;
			_buttoncall ctrlShow false;
			_decallpic ctrlShow true;
			_buttondecall ctrlShow true;
			_calltext ctrlSetText "Anruf im Gange...";
			
			player setVariable ["life_callactive2", true];
			["life_callactive2",true,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];

			hint format ["Anruf mit %1 gestartet, Sie haben 2 Minuten zum Telefonieren!",name life_smartphoneTarget];
			[1,"Anruf angenommen. Verbleibende Gesprächszeit: 2 Minuten."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];

			sleep 60;
			if!(player getvariable "life_callactive2") exitWith {};
			
			hint "Dir bleibt noch 1 Minute zum Telefonieren!";
			[1,"Verbleibende Gesprächszeit: 1 Minute."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget,false];

			sleep 60;
			if!(player getvariable "life_callactive2") exitWith {};
			
			hint "Anruf beendet.";
			_calltext ctrlSetText format["Eigene Nummer: %1",(player getvariable "phone")];
			[1,"Anruf beendet Gesprächszeit abgelaufen."] remoteExecCall ["life_fnc_broadcast",life_smartphoneTarget];
			
			life_radio_call5 radioChannelRemove [player, life_smartphoneTarget];
			life_callinUse2 = false;
			PublicVariable "life_callinUse2";
			
			sleep 0.3;
			
			player setVariable ["life_callactive2", false];
			["life_callactive2",false,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
			["life_smartphoneCaller",ObjNull,false] remoteExecCall ["life_fnc_setVar",life_smartphoneTarget];
		};
	};
};