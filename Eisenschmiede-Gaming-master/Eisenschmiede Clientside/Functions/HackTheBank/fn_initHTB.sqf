/*
	HACK THE BANK!
	Autor: stolzerrabe
	
	You are allowed to:
	Use, Share and modify
	You are not allowed to:
	Remove Author or say this script is yours in anyway!
*/
if(isNil "HackBankCam")	then {HackBankCam = 0;};
[]spawn
{
	while {true} do
	{
		// FALLS DAS HACKING BEI ZUGRIFF AUF DIE CAM UNTERBROCHEN WIRD,
		// SOMIT WIRD DIE CAM NICHT DAUERHAFT SICHTBAR!
		waitUntil{HackBankCam == 1};
		sleep (60 * 15);
		HackBankCam = 0;
	};		
};	

[] spawn    
{
	while {true} do
	{
	private["_dehack","_check"];
	_check = 0;	
	waitUntil{ES_ATMhacked == 1};
	
		if(ES_ATMhacked == 1) then 
		{
				_check = 1;	
				hint format["Die Zentralbank wurde gehackt!! Aus Sicherheitsgründen sind alle Geldautomaten 15min nicht nutzbar!"];
				_dehack = (60 * 15);
				sleep _dehack;
						ES_ATMhacked = 0;
						publicVariable "ES_ATMhacked";
						HackBankCam = 0;

		};	
		if((ES_ATMhacked == 1) && (_check == 1)) then 
		{
			_check = 0;
			hint format["Die Bank hat ihr bestes gegeben! Alle Geldautomaten sind wieder nutzbar!"];

		};
	};		
};	
