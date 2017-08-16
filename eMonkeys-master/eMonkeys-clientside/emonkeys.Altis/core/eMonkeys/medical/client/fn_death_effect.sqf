"dynamicBlur" ppEffectEnable true;       
"dynamicBlur" ppEffectAdjust [5];        
"dynamicBlur" ppEffectCommit 0;         
"dynamicBlur" ppEffectAdjust [2];      
"dynamicBlur" ppEffectCommit 3; 
while {true} do
{
	if (!(player getVariable["onkill",FALSE])) exitWith {};
	[] spawn {
	titleCut ["", "BLACK Out", 6];      
	playsound "jhmedsys_heartbeat";
};

	uisleep 11.5;
	if (!(player getVariable["onkill",FALSE])) exitWith {};
	cutText ["","Black In",6];
	uisleep 6;
};
"dynamicBlur" ppEffectEnable false;  