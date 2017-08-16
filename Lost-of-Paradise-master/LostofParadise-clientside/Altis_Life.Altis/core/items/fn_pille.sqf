/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
closeDialog 0;
hint "Ibuprophet ist nicht immer so gut!!!";


enableCamShake true;	 // enables camera shake
10 fadeSound 1;	 //fades the sound back to normal
addCamShake [75, 40, 0.3];	
			sleep (8); 			
			addCamShake [62, 50, 0.2];	
			sleep (10); 					
			addCamShake [23, 60, 0.1];
			sleep (12); 
10 fadeSound 1;	 

enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues
5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds


sleep 15;
	
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal