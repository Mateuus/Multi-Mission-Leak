
_Info = InfoText;
_Color = InfoColor;

_Text = format ["<t align='left' color='#%1'>%2</t>",_Color,_Info];

((uiNamespace getVariable "Status_Bar")displayCtrl 1000)ctrlSetStructuredText parseText _Text;



waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

4 cutRsc ["osefStatusBar","PLAIN"];

[] spawn {
    sleep 2;
        _counter = 240;
        _timeSinceLastUpdate = 0;
        _colourDefault  = parseText "#ABABAB";
		_colour100 		= parseText "#09FF00";
		_colour90 		= parseText "#09FF00";
		_colour80 		= parseText "#09FF00";
		_colour70 		= parseText "#B7FF00";
		_colour60 		= parseText "#D1FF00";
		_colour50 		= parseText "#D5FF00";
		_colour40 		= parseText "#FFF700";
		_colour30 		= parseText "#FFF700";
		_colour20 		= parseText "#CF0000";
		_colour10 		= parseText "#CF0000";
		_colour0 		= parseText "#CF0000";
		_colourDead 	= parseText "#030101";
        _colourUpTimeHUD  = parseText "#CECECE";

while {true} do 
	{
		sleep 1;
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			4 cutRSC ["osefStatusBar","PLAIN"];
		};
        _CivplayHUD = civilian countSide playableUnits;
        _WestplayHUD = west countSide playableUnits;
        _IndepplayHUD = independent countSide playableUnits;
        _grid = mapGridPosition  player;
        _xx = (format[_grid]) select  [0,3];
        _yy = (format[_grid]) select  [3,3];
        _hunger = round(ES_hunger);
		_cash = [ES_cash] call ES_fnc_numberText;
		_bank = [ES_atmbank] call ES_fnc_numberText;
        _thirst = round(ES_thirst);
        _damage = round ((1 - (damage player)) * 100);
        _FpsHud = round (diag_fps);
		_UpTime = 14400 - serverTime;
        _UpTimeHUD = [_UpTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
        //neu ende
		_toxPercent = round(ES_thirst);
		_energy = round(ES_thirst);
		_energyPercent =  floor((_energy / 2500 ) * 100);
		_players = (count playableUnits -1);
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
			case(_FpsHud >= 50) : {_colourFps = _colour70;};
			case((_FpsHud >= 20) && (_FpsHud < 40)) : {_colourFps =  _colour30;};
			case((_FpsHud >= 1) && (_FpsHud < 15)) : {_colourFps =  _colour0;};
			case(_FpsHud < 1) : {_colourFps =  _colourDead;};
		};
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555556)ctrlSetStructuredText parseText 		
		format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='icons\Statusbar\players.paa' color='#FFFFFF'/>%1 <img size='1.6' shadowColor='#000000' image='Images\Icons\policeonline.paa' color='#3399FF'/>%2 <img size='1.6' shadowColor='#000000' image='Images\Icons\fireguys.paa' color='#009933'/>%3 <img size='1.6' shadowColor='#000000' image='Images\Icons\ico_map.paa'/>%4 <img size='1.6' shadowColor='#000000' image='Images\Icons\food.paa' color='%6'/>%5 <img size='1.6' shadowColor='#000000' image='Images\Icons\water.paa' color='%8'/>%7 <img size='1.6' shadowColor='#000000' image='Images\Icons\health.paa' color='%10'/>%9 <img size='1.6' shadowColor='#000000' image='icons\Statusbar\monitor_fps.paa' color='%12'/>%11 <img size='1.6' shadowColor='#000000' image='Images\Icons\xp.paa' color='%14'/>%18 <img size='1.6' shadowColor='#000000' image='Images\Icons\backpack.paa' color='%14'/>%19</t>",
		_CivplayHUD,
		_WestplayHUD,
		_IndepplayHUD,
		format["%1/%2",_xx,_yy],
		_hunger,
		_colourHunger,
		_thirst,
		_colourThirst,
		_damage, 
		_colourDamage,
		_FpsHud, 
		_colourFps, 
		_UpTimeHUD, 
		_colourUpTimeHUD,
		_players,
		_energyPercent,
		_colourDefault,
		ES_xp_lvl,
		ES_carryWeight];			
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555557)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='Images\Icons\money.paa'/>%1",_cash];
			
    ((uiNamespace getVariable "osefStatusBar")displayCtrl 555558)ctrlSetStructuredText parseText 
            format["<t shadow='1' shadowColor='#000000'><img size='1.6' shadowColor='#000000' image='Images\Icons\bank.paa'/>%1",_bank];
    }; 
};