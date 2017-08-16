if !(player getVariable["DWEV_paintball_transfer",false]) then 
{
	player setVariable["DWEV_paintball_outofarena",true];
	DWEV_outofarena_counter = 10;
	[] spawn 
	{
		while {player getVariable["DWEV_paintball_outofarena",false]} do 
		{
			if (player getVariable["DWEV_paintball_transfer",false]) exitWith {};
			
			_tmpText = parseText format ["%1<br/><br/><t size='3' color='#ff0000'>%2</t>","<t size='1' color='#ffff00'>DU DARFST DAS SPIELFELD NICHT VERLASSEN</t>",DWEV_outofarena_counter];
			//titleText[_tmpText,"PLAIN"];
			hint _tmpText;
			titleText [_tmpText,"PLAIN"];
			
			DWEV_outofarena_counter = DWEV_outofarena_counter -1;
			sleep 1;
			
			if (DWEV_outofarena_counter <= 0) exitWith 
			{
				["Du hast die Arena verlassen"] call DWEV_fnc_paintballLeafArena;
					
			};
		};
	};
};