/*
Player Status Bar with Icons v 1.36
Author: Dart_Rogue
Mod: Epoch
https://github.com/DarthRogue/Status_Bar
Transfered to Altis Life + add   SBUserhy
*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
_rscLayer = "live_Anzeige" call BIS_fnc_rscLayer;
_rscLayer cutRsc["live_Anzeige","PLAIN"];
[] spawn {
    sleep 2;
        _counter = 360;
        _timeSinceLastUpdate = 0;
        _colourDefault  = parseText "#ADADAD"; //set your default colour here
		_colour100 		= parseText "#33FF00";
		_colour90 		= parseText "#33FF00";
		_colour80 		= parseText "#33FF00";
		_colour70 		= parseText "#33FF00";
		_colour60 		= parseText "#66FF00";
		_colour50 		= parseText "#CCFF00";
		_colour40 		= parseText "#FFFF00";
		_colour30 		= parseText "#FFFF00";
		_colour20 		= parseText "#CC0000";
		_colour10 		= parseText "#CC0000";
		_colour0 		= parseText "#CC0000";
		_colourDead 	= parseText "#000000";
        _colourUpTimeHUD  = parseText "#CCCCCC";
while {true} do 
	{
		sleep 1;
		//moved the creation of the status bar inside the loop and create it if it is null,
		//this is to handle instance where the status bar is disappearing 
		if(isNull ((uiNamespace getVariable "liveAnzeige")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			_rscLayer = "liveAnzeige" call BIS_fnc_rscLayer;
			_rscLayer cutRsc["liveAnzeige","PLAIN"];
		};
        //initialize variables and set values
        //neu
        _CivplayHUD = count playableUnits;
        _grid = mapGridPosition  player;
        _xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
        _UpTimeHUD = [serverTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
        //neu ende
		_players = (count playableUnits -1);
        //Colour coding
    ((uiNamespace getVariable "live_Anzeige")displayCtrl 555556)ctrlSetStructuredText parseText 
            format["<t><img size='1.6'   image='icons\live_Anzeige\players.paa' color='#FFFFFF'/>%1  | <img size='1.5'   image='icons\live_Anzeige\ico_map.paa'/>%2  |  <  color='%6'/>island-of-liberty.com  | </t><img size='1.6'    image='icons\live_Anzeige\restart.paa' color='%4'/>%3</t>", _CivplayHUD, format["%1/%2",_xx,_yy], _UpTimeHUD, _colourUpTimeHUD,_players,_colourDefault];
    }; 
};