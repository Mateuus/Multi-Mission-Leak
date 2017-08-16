/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Displays impound request for police and mechanics
*/
if((!(playerside == west))&&(!(player getVariable ["mechanic",false])))exitwith{};

hint "A Security Contractor has requested a vehicle be impounded, the vehicle will be marked on your map";
systemchat "A Security Contractor has requested a vehicle be impounded, the vehicle will be marked on your map";
titleText ["A Security Contractor has requested a vehicle be impounded, the vehicle will be marked on your map","PLAIN"];

