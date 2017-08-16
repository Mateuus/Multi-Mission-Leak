/*
	File: fn_shutUpChannel.sqf
	Author: Barney
	
	Description:
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
	
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.

*/
Private[];

disableSerialization;


if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
	{
		if(currentchannel == 7) then {
		
			switch(LHM_Side_Warnings) do {
			case 0: {
					LHM_Side_Warnings = LHM_Side_Warnings + 1;
					systemchat format["Rede nicht im Side Channel, dies ist deine erste Warnung"];
					titletext["REDE NICHT IM SIDE CHANNEL","PLAIN"];
					[[0,format["Der Spieler %1 redet im Side Channel",name player]],"lhm_fnc_broadcast",true,false] spawn lhm_fnc_mp;
					setCurrentChannel 4;
					
			
						};
			case 1: {
					
					LHM_Side_Warnings = LHM_Side_Warnings + 1;
					cutText["","BLACK FADED"];
					systemchat format["Rede nicht im Side Channel, dies ist deine zweite Warnung"];
					titletext["REDE NICHT IM SIDE CHANNEL","PLAIN"];
					[[0,format["Der Spieler %1 redet im Side Channel",name player]],"lhm_fnc_broadcast",true,false] spawn lhm_fnc_mp;
					setCurrentChannel 4;
					0 cutFadeOut 5;
				
					
					};
			case 2: {
					
					LHM_Side_Warnings = LHM_Side_Warnings + 1;
					cutText["","BLACK FADED"];
					systemchat format["Rede nicht im Side Channel, dies ist deine dritte und letzte Warnung"];
					titletext["REDE NICHT IM SIDE CHANNEL, LETZTE WARNUNG!","PLAIN"];
					[[0,format["Der Spieler %1 redet im Side Channel",name player]],"lhm_fnc_broadcast",true,false] spawn lhm_fnc_mp;
					setCurrentChannel 4;
					playSound "kackofant";
					0 cutFadeOut 3;
					sleep 3;
					cutText["","WHITE OUT"];
					0 cutFadeOut 3;
					sleep 3;
					cutText["","BLACK OUT"];
					0 cutFadeOut 3;
					sleep 3;
					cutText["","WHITE OUT"];
					0 cutFadeOut 3;
					sleep 3;
					cutText["","BLACK OUT"];
					0 cutFadeOut 3;
					
					};
			case 3: {
					LHM_Side_Warnings = LHM_Side_Warnings + 1;
					setCurrentChannel 4;
					cutText["","BLACK FADED"];
					playSound "pussylover";
					systemchat format["Jetzt ist aber schluss"];
					titletext["Du solltest nicht im Side reden, wir haben dich gewarnt......","PLAIN"];
					sleep 10;
					[[0,format["Der Spieler %1 hat zu oft im Side-Channel geredet und wurde daher entfernt",name player]],"lhm_fnc_broadcast",true,false] spawn lhm_fnc_mp;
					disableUserInput true;
					0 cutFadeOut 1;
					sleep 1;
					startLoadingScreen ["You are being disconnected"];
						
					progressLoadingScreen 0.4;sleep 2.25;
						
					progressLoadingScreen 0.8;sleep 2.25;
						
					endLoadingScreen;sleep 0.5;
					disableUserInput false;
					endMission "LOSER";
					};
		
		
			};
		
		};
		
	};
		
		