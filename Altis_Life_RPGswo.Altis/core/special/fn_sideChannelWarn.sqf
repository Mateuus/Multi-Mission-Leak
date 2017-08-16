/*
			fn_initSideChannelWarn.sqf

			Author: MarkusSR1984
			
			Description: 	Warnt und Kickt Spieler die im Side Channel Sprechen nach einer Verwarnung (NUR CIVILISTEN)
							Den Versuch hinzugefügt, das der SideChannel deaktiviert wird bei der ersten Warnung
			
			Installation: 	Init Datei für den Life Server, muss in der init.sqf aufgerufen werden
							Muss beim client in der Init Datei aufgerufen werden mit: "[] spawn DWEV_fnc_initSideChannelWarn;"
							Die Datei core\session\forcequit.sqf muss in die Mission Kopiert werden
			
*/

	private["_counter","_pause","_cooldowncounter","_cooldowntime","_warncounter","_maxwarns","_warntime","_wasKicked"];
	
	_counter = 0;
	_pause = 0.1;
	_cooldowncounter = 0;
	_cooldowntime = 5 * 60;
	_warncounter = 0;
	_maxwarns = 2;
	_warntime = 0.5;
	_wasKicked = false;
	
	while {true} do
		{
			uisleep _pause;
			if (!isNull findDisplay 55 && (ctrlText (findDisplay 63 displayCtrl 101) == localize "str_channel_side" || ctrlText (findDisplay 63 displayCtrl 101) == localize "str_channel_global" || ctrlText (findDisplay 63 displayCtrl 101) IN ["Side Channel","Global"])) then 
				{
					
					_counter = _counter + _pause;
					_cooldowncounter = 0;
					setCurrentChannel 5;
					hint format["!!! WARNUNG !!! \n %1 von %2 \n\n DU DARFST NICHT IM SIDECHANNEL REDEN \n\n WENN DU NICHT AUFHÖRST, WIRST DU VOM SERVER GEKICKT \n\n !!! WARNUNG !!!",_warncounter,_maxwarns];
					playSound "Alarm";
				} 
				else
				{
					_cooldowncounter = _cooldowncounter + _pause;
					
				};
				
				
			if (_cooldowncounter >= _cooldowntime && _warncounter > 0) then {_warncounter = _warncounter - 1 ;/*[[player,DWEV_sidechat,(side player)],"DWF_fnc_managesc",false,false] spawn DWEV_OLD_fnc_MP;*/};
			
			if (_counter > _warntime && _warncounter <= _maxwarns) then 
				{
					_counter = 0;
					_warncounter = _warncounter + 1;
					
					
				};
		
			
		
			if ((_warncounter > _maxwarns) && !_wasKicked) then 
			{
							
							[player,"Reden im SideChannel"] remoteExec ["CLIENT_fnc_kickMe",2];
							_wasKicked = true;
				
			};
				
		};