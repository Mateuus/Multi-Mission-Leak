life_oldBleedRemaining = _this select 0;

life_bloodActionPlaying = true;
[]spawn {
	private ["_display", "_texLower", "_texMiddle", "_texUpper", "_x", "_y", "_w", "_h"];

	disableSerialization;
	if (isnil {uinamespace getvariable "RscHealthTextures"}) then {uinamespace setvariable ["RscHealthTextures",displaynull]};
	if (isnull (uinamespace getvariable "RscHealthTextures")) then {(["HealthPP_blood"] call bis_fnc_rscLayer) cutrsc ["RscHealthTextures","plain"]};
	_display = uinamespace getvariable "RscHealthTextures";

	_texLower = _display displayctrl 1211;
	_texLower ctrlsetfade 1;
	_texLower ctrlcommit 0;
	
	_texMiddle = _display displayctrl 1212;
	_texMiddle ctrlsetfade 1;	
	_texMiddle ctrlcommit 0;
	
	_texUpper = _display displayctrl 1213;
	_texUpper ctrlsetfade 1;	
	_texUpper ctrlcommit 0;
     
    _x = ((0 * safezoneW) + safezoneX) + ((safezoneW - (2.125 * safezoneW * 3/4)) / 2);
    _y = (-0.0625 * safezoneH) + safezoneY;
    _w = 2.125 * safezoneW * 3/4;
    _h = 1.125 * safezoneH;
    
    _texLower ctrlsetposition [_x, _y, _w, _h];
    _texMiddle ctrlsetposition [_x, _y, _w, _h];
    _texUpper ctrlsetposition [_x, _y, _w, _h];
    
    _texLower ctrlcommit 0;
    _texMiddle ctrlcommit 0;
    _texUpper ctrlcommit 0;
	   
    //lower
    if((life_oldBleedRemaining > 5) && (life_oldBleedRemaining < 25)) then
    {
        _texLower ctrlsetfade 0.2;	 //0 --changed
        _texLower ctrlcommit 0.2;
        waituntil {ctrlcommitted _texLower};
		
		//fade-out
		sleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texLower ctrlcommit 0.8;
    };
    
    //lower, 50% middle
    if ((life_oldBleedRemaining >= 25) && (life_oldBleedRemaining < 40)) then
    {
        _texLower ctrlsetfade 0.2;	 //0 --changed
        _texMiddle ctrlsetfade 0.85;  //0 --changed
        
        _texLower ctrlcommit 0.2;
        _texMiddle ctrlcommit 0.2;
        waituntil {ctrlcommitted _texMiddle};
		
		//fade-out
		sleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;

		_texMiddle ctrlcommit 0.5;
		sleep 0.5;
		_texLower ctrlcommit 0.4;
    };
    
    //lower, middle
    if ((life_oldBleedRemaining >= 40) && (life_oldBleedRemaining < 55)) then
    {
        _texLower ctrlsetfade 0.2;	 
        _texMiddle ctrlsetfade 0.7;  
        
        _texLower ctrlcommit 0.2;
        _texMiddle ctrlcommit 0.2;
        waituntil {ctrlcommitted _texMiddle};
		
		//fade-out
		sleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texMiddle ctrlcommit 0.5;
		sleep 0.5;
		_texLower ctrlcommit 0.4;
    };
    
    //lower, middle, 50% upper
    if ((life_oldBleedRemaining >= 55) && (life_oldBleedRemaining < 70)) then
    {
        _texLower ctrlsetfade 0.2;	 
        _texMiddle ctrlsetfade 0.7;  
        _texUpper ctrlsetfade 0.85;  
        
        _texLower ctrlcommit 0.2;
        _texMiddle ctrlcommit 0.2;
        _texUpper ctrlcommit 0.2;
        waituntil {ctrlcommitted _texUpper};
		
		//fade-out
		sleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texUpper ctrlcommit 0.75;
		sleep 1;
		_texMiddle ctrlcommit 0.5;
		sleep 0.5;
		_texLower ctrlcommit 0.4;
    };
    
    //lower, middle, upper
    if (life_oldBleedRemaining >= 70) then
    {
        _texLower ctrlsetfade 0.2;	 
        _texMiddle ctrlsetfade 0.7;  
        _texUpper ctrlsetfade 0.7;   
        
        _texLower ctrlcommit 0.2;
        _texMiddle ctrlcommit 0.2;
        _texUpper ctrlcommit 0.2;
        waituntil {ctrlcommitted _texUpper};
		
		//fade-out
		sleep 0.25;
		
		_texLower ctrlsetfade 1;
		_texMiddle ctrlsetfade 1;
		_texUpper ctrlsetfade 1;

		_texUpper ctrlcommit 0.75;
		sleep 1;
		_texMiddle ctrlcommit 0.5;
		sleep 0.5;
		_texLower ctrlcommit 0.4;
    };    
    waitUntil {(ctrlCommitted _texUpper && ctrlCommitted _texMiddle && ctrlCommitted _texLower)}; //Wait for the effects to be done!
    life_bloodActionPlaying = false;
};