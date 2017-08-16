/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/

//Close inventory
closeDialog 0;

//Little hint then wait a litle before starting drugs effects
hint "Ich glaub ich werd besoffen...PROST!";
sleep 3;

//Activate ppEffects we need
"chromAberration" ppEffectEnable true;
"radialBlur" ppEffectEnable true;
enableCamShake true;

"chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
"chromAberration" ppEffectCommit 1;   
"radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
"radialBlur" ppEffectCommit 1;
addCamShake [75, 40, 0.3];	
	sleep (7); 			
	addCamShake [62, 50, 0.2];	
	sleep (8); 					
	addCamShake [23, 60, 0.1];
	sleep (10); 

//Stop effects
"chromAberration" ppEffectAdjust [0,0,true];
"chromAberration" ppEffectCommit 5;
"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"chromAberration" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;