/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Checks if an officer has completed a cop quest and updates their log
*/

private ["_return"];

//Done in sequence incase it has to pass multiple at once

//play 10 hours
if(((DS_infoArray select 0) > 599)&&((DS_infoArray select 21) == 0))then{[3] call DS_fnc_questCompleted};
//issue 10 tickets
if(((DS_infoArray select 4) > 9)&&((DS_infoArray select 21) == 1))then{[3] call DS_fnc_questCompleted};
//Impound 10 vehicles
if(((DS_infoArray select 3) > 9)&&((DS_infoArray select 21) == 2))then{[3] call DS_fnc_questCompleted};
//5 checkpoint payments
//Done in scripts
//Play 20 hours
if(((DS_infoArray select 0) > 1199)&&((DS_infoArray select 21) == 4))then{[3] call DS_fnc_questCompleted};
//Search a vehicle
//Done in scripts
//Make 10 Arrest
if(((DS_infoArray select 5) > 9)&&((DS_infoArray select 21) == 6))then{[3] call DS_fnc_questCompleted};
//Play for 30 hours
if(((DS_infoArray select 0) > 1799)&&((DS_infoArray select 21) == 7))then{[3] call DS_fnc_questCompleted};
//Defuse Bomb
//Done in scripts
//impound 100 vehicles
if(((DS_infoArray select 3) > 99)&&((DS_infoArray select 21) == 9))then{[3] call DS_fnc_questCompleted};
//50 arrest
if(((DS_infoArray select 5) > 49)&&((DS_infoArray select 21) == 10))then{[3] call DS_fnc_questCompleted};
if(((DS_infoArray select 0) > 3600)&&((DS_infoArray select 21) == 11))then{[3] call DS_fnc_questCompleted};
//play for 100 hours
if(((DS_infoArray select 0) > 5999)&&((DS_infoArray select 21) == 16))then{[3] call DS_fnc_questCompleted};
//Arrest 75 criminals
if(((DS_infoArray select 5) > 74)&&((DS_infoArray select 21) == 18))then{[3] call DS_fnc_questCompleted};
//impound 200 vehicles
if(((DS_infoArray select 3) > 199)&&((DS_infoArray select 21) == 22))then{[3] call DS_fnc_questCompleted};
//play for 200 hours
if(((DS_infoArray select 0) > 11999)&&((DS_infoArray select 21) == 24))then{[3] call DS_fnc_questCompleted};
//Issue 100 tickets
if(((DS_infoArray select 4) > 99)&&((DS_infoArray select 21) == 26))then{[3] call DS_fnc_questCompleted};
//Arrest 150 criminals
if(((DS_infoArray select 5) > 149)&&((DS_infoArray select 21) == 27))then{[3] call DS_fnc_questCompleted};