_stage = param [0,0,[0]];

switch(_stage) do {
	//severe pains
	case 1: {
		life_action_inUse = true;
		if(!(player getVariable["severeInjuries",FALSE])) then {
			player forceWalk true;
			player setVariable["severeInjuries", true, true];
			["Jestes powaznie ranny! Odwiedz szpital!", false] spawn domsg; 
		};
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
		uiSleep 3;
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 3;
		life_action_inUse = false;
	};

	case 2: {
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.11],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
		uiSleep 2;
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 3;
		uiSleep 2;
	};

	//long black for crash tackle / knockout etc
	case 3: {
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.011],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
		uiSleep 8;
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 3;
		uiSleep 2;
	};
	
	case 4: {
		//effect for a stage 4 pain hit from hunger / thirst
		life_hungerpain = true;
		[7] spawn life_fnc_HudElements;
		_chance = round (random 1000);
		if(_chance < 500) then {
			["Twoj brzuch Cie boli...", false] spawn domsg; 
			[player,"hungry"] spawn life_fnc_nearestSound;
			uiSleep 3;
		};
		life_hungerpain = false;
	};

	//red
	case 5: { 
	    "colorCorrections" ppEffectEnable true;        
        "colorCorrections" ppEffectAdjust [0, 0.4, -0.003, [0.8, 0.1, 0, 0.5], [0.1, 0.1, 0, 0.6],  [1, 1, 1, 0.5]];     
        "colorCorrections" ppEffectCommit 0.25;    
         player forceWalk true;        
         uisleep 0.1;        
        "colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]];         
  		"colorCorrections" ppEffectCommit 0.7;      
  		player forceWalk false; 
	}; 
	//green display
	case 6: {
		"colorCorrections" ppEffectEnable true;           
		"colorCorrections" ppEffectAdjust [0, 0.4, -0.003, [0, 0.45, 0, 0.5], [0.1, 0.1, 0, 0.6],  [0, 0, 0, 0.5]];         
		"colorCorrections" ppEffectCommit 0.35;      
		player forceWalk true;        
		uisleep 0.15;        
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]];          
		"colorCorrections" ppEffectCommit 0.7;      
		player forceWalk false; 
	};
	//white display
	case 7: {
		 "colorCorrections" ppEffectEnable true;                  
		 "colorCorrections" ppEffectAdjust [0, 0.4, -0.003, [1, 1, 1, 1], [0.1, 0.1, 0, 0.6],  [1, 1, 1, 0.5]];               
		 "colorCorrections" ppEffectCommit 0.45;               
		 player forceWalk true;                   
		 uisleep 0.15;                  
		 "colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]];               
		 "colorCorrections" ppEffectCommit 0.7;            
		 player forceWalk false;  
	};

};