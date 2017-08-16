/*
Status Bar mit Icons
Author: Dart_Rogue und TheFrozenPepper
*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
//_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
3 cutRsc["osefStatusBar","PLAIN"];
systemChat format["Willkommen auf TanoaRPG", 3];
[] spawn {
    sleep 2;
        _counter = 360;
        _timeSinceLastUpdate = 0;
        _colourDefault  = parseText "#ADADAD"; //set your default colour here
		_colour70 		= parseText "#33FF00";
		_colour30 		= parseText "#FFFF00";
		_colour0 		= parseText "#CC0000";
		_colourDead 	= parseText "#000000";
        _colourUpTimeHUD  = parseText "#CCCCCC";
	while {true} do 
	{
		sleep 1;
		//Hier wird festgelegt wie die Statusbar verschwinden spll
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			//_rscLayer = "statusBar" call BIS_fnc_rscLayer;
			3 cutRsc["statusBar","PLAIN"];
		};
        //Variablen
        _CivplayHUD = civilian countSide playableUnits; 
        _WestplayHUD = west countSide playableUnits; 
        _IndepplayHUD = independent countSide playableUnits;
        _EastplayHUD = east countSide playableUnits;
        _grid = mapGridPosition  player;
        _xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
        _cash = [life_cash] call tanoarpg_fnc_numberText;
        _atm = [life_atmcash] call tanoarpg_fnc_numberText;
        _ts = "ts.tanoarpg.de"; 
        _FpsHud = round (diag_fps); 
        _UpTimeHUD = [serverTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
		_Players  = count playableUnits;

		//Farben FPS
        _colourFps = _colourDefault;
        switch true do {
			case(_FpsHud >= 60) : {_colourFps = _colour70;};
			case((_FpsHud >= 30) && (_FpsHud < 60)) : {_colourFps =  _colour30;};
			case((_FpsHud >= 1) && (_FpsHud < 30)) : {_colourFps =  _colour0;};
			case(_FpsHud < 1) : {_colourFps =  _colourDead;};
		};
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555556)ctrlSetStructuredText parseText 
	format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#FFFFFF'/>%1
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#3399FF'/>%2
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#009933'/>%3 
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#CC0000'/>%4 
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\ico_map.paa'/>%5 
			<img size='1.6' shadowColor='#000000' image='icons\money.paa'/>%6 
			<img size='1.6' shadowColor='#000000' image='icons\bank.paa'/>%7 
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\TeamSpeak.paa'/>%8
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\allPlayers.paa'/>%12 
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\monitor_fps.paa' color='%10'/>%9
			<img size='1.6' shadowColor='#000000' image='icons\Statusbar\restart.paa'/>%11
			</t>",_CivplayHUD,_WestplayHUD,_IndepplayHUD,_EastplayHUD, format["%1/%2",_xx,_yy], _cash, _atm, _ts, _FpsHud, _colourFps, _UpTimeHUD, _Players];
    };         //    1             2             3            4                 5                 6      7     8      9        10          11          12 
};