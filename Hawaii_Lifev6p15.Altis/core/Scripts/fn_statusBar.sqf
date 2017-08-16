/*waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

4 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
	sleep 5;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText
    format["FPS: %1 | COP: %2 | CIV: %3 | MED: %4 | SPIELER: %5 | GELD: %6 | BANK: %7 |", round diag_fps, 
    west countSide playableUnits, civilian countSide playableUnits,
    independent countSide playableUnits, east countSide playableUnits, count playableUnits,[life_cash] call life_fnc_numberText,[life_atmcash] call life_fnc_numberText];
	}; 
};*/
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

4 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
    sleep 2;
        _counter = 240;
        _timeSinceLastUpdate = 0;
        _colourDefault  = parseText "#ADADAD";
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
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			4 cutRSC ["osefStatusBar","PLAIN"];
		};
        //initialize variables and set values
        //neu
        _CivplayHUD = civilian countSide playableUnits;
        _WestplayHUD = west countSide playableUnits;
        _IndepplayHUD = independent countSide playableUnits;
        _grid = mapGridPosition  player;
        _xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
        _hunger = round(life_hunger);
		_cash = [life_cash] call life_fnc_numberText;
		_bank = [life_atmbank] call life_fnc_numberText;
        _thirst = round(life_thirst);
        _damage = round ((1 - (damage player)) * 100);
        _FpsHud = round (diag_fps);
		_UpTime = 14390 - serverTime;
        _UpTimeHUD = [_UpTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
        //neu ende
		_toxPercent = round(life_thirst);
		_energy = round(life_thirst);
		_energyPercent =  floor((_energy / 2500 ) * 100);
		_players = (count playableUnits -1);
        //Colour coding
		//Hunger
		_colourHunger = _colourDefault;
		switch true do {
			case(_hunger >= 100) : {_colourHunger = _colour70;};
			case((_hunger >= 90) && (_hunger < 100)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 80) && (_hunger < 90)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 70) && (_hunger < 80)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 60) && (_hunger < 70)) :  {_colourHunger =  _colour60;};
			case((_hunger >= 50) && (_hunger < 60)) :  {_colourHunger =  _colour50;};
			case((_hunger >= 40) && (_hunger < 50)) :  {_colourHunger =  _colour40;};
			case((_hunger >= 30) && (_hunger < 40)) :  {_colourHunger =  _colour30;};
			case((_hunger >= 20) && (_hunger < 30)) :  {_colourHunger =  _colour20;};
			case((_hunger >= 10) && (_hunger < 20)) :  {_colourHunger =  _colour10;};
			case((_hunger >= 1) && (_hunger < 10)) :  {_colourHunger =  _colour0;};
			case(_hunger < 1) : {_colourHunger =  _colourDead;};
		};
		//Thirst
		_colourThirst = _colourDefault;		
		switch true do{
			case(_thirst >= 100) : {_colourThirst = _colour70;};
			case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour60;};
			case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour50;};
			case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour40;};
			case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour30;};
			case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
			case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
			case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
			case(_thirst < 1) : {_colourThirst =  _colourDead;};
		};
        //Damage
		_colourDamage = _colourDefault;
		switch true do {
			case(_damage >= 100) : {_colourDamage = _colour70;};
			case((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour70;};
			case((_damage >= 80) && (_damage < 90)) : {_colourDamage =  _colour70;};
			case((_damage >= 70) && (_damage < 80)) : {_colourDamage =  _colour70;};
			case((_damage >= 60) && (_damage < 70)) : {_colourDamage =  _colour60;};
			case((_damage >= 50) && (_damage < 60)) : {_colourDamage =  _colour50;};
			case((_damage >= 40) && (_damage < 50)) : {_colourDamage =  _colour40;};
			case((_damage >= 30) && (_damage < 40)) : {_colourDamage =  _colour30;};
			case((_damage >= 20) && (_damage < 30)) : {_colourDamage =  _colour20;};
			case((_damage >= 10) && (_damage < 20)) : {_colourDamage =  _colour10;};
			case((_damage >= 1) && (_damage < 10)) : {_colourDamage =  _colour0;};
			case(_damage < 1) : {_colourDamage =  _colourDead;};
		};
        //FPS
        _colourFps = _colourDefault;
        switch true do {
			case(_FpsHud >= 60) : {_colourFps = _colour70;};
			case((_FpsHud >= 30) && (_FpsHud < 60)) : {_colourFps =  _colour30;};
			case((_FpsHud >= 1) && (_FpsHud < 30)) : {_colourFps =  _colour0;};
			case(_FpsHud < 1) : {_colourFps =  _colourDead;};
		};
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555556)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#FFFFFF'/>%1 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#3399FF'/>%2 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#009933'/>%3 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\ico_map.paa'/>%4 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\hunger.paa' color='%6'/>%5 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\thirst.paa' color='%8'/>%7 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\damage.paa' color='%10'/>%9 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\monitor_fps.paa' color='%12'/>%11 <img size='1.6'  shadowColor='#000000' image='icons\Statusbar\restart.paa' color='%14'/>%13</t>",_CivplayHUD,_WestplayHUD,_IndepplayHUD, format["%1/%2",_xx,_yy], _hunger, _colourHunger, _thirst, _colourThirst, _damage, _colourDamage, _FpsHud, _colourFps, _UpTimeHUD, _colourUpTimeHUD,_players,_energyPercent,_colourDefault];
			
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555557)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='icons\money.paa'/>%1",_cash];
			
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555558)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='icons\bank.paa'/>%1",_bank];
    }; 
};