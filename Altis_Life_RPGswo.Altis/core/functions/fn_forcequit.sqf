/*
	File: 	fn_forcequit.sqf
	Autor: 	MarkusSR1984
	
	Description:	Tötet den Spieler und wirft ihn aus dem Spiel
				
*/			
			
			player setDamage 1;
							
			uiNamespace setVariable ["BIS_fnc_guiMessage_status", false];
			_msgbox = ["Du hast die maximale Anzahl an Warnungen überschritten", _this] spawn BIS_fnc_guiMessage;
			_counter = 0;
			while  {!scriptDone _msgbox} do
				{
					sleep 1;
					_counter = _counter + 1;
							
					if (_counter > 10) exitWith {};
						
				};
			deleteVehicle DWEV_corpse;
			preprocessFile "core\session\forcequit.sqf";
					