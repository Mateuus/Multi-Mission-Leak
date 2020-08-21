player switchMove "";  
player removeaction life_action_getup;
life_action_getup = nil;
if(!isNil 'life_laydown') then {
	life_laydown setVariable["occupied",false,true];
	life_laydown = nil;
};