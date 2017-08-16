/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Informs a player that the police would like him to pullover his vehicle
*/

if(DS_pullOver)exitwith{hint "You have used this too recently, please wait......"};
DS_pullOver = true;
if((vehicle player) isKindOf "Air")then
	{
	titleText [" !! ~~ The Police are requesting that you land immediately, failure to comply could result in your air vehicle being disabled ~~ !! ","PLAIN DOWN"];
	hint "The Police are requesting that you land immediately, failure to comply could result in your air vehicle being disabled";
	systemchat "The Police are requesting that you land immediately, failure to comply could result in your air vehicle being disabled";
	}
	else
	{
	titleText [" !! ~~ The Police are requesting that you pullover immediately, failure to comply could result in your vehicle being disabled ~~ !! ","PLAIN DOWN"];
	hint "The Police are requesting that you pullover immediately, failure to comply could result in your vehicle being disabled";
	systemchat "The Police are requesting that you pullover immediately, failure to comply could result in your vehicle being disabled";
	};
player say3D "pullOver";
titleCut ["","WHITE OUT",0];
sleep 0.5;
titleCut ["","WHITE IN",0];
sleep 30;
DS_pullOver = false;