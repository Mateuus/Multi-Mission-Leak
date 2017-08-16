#include "..\..\macros.hpp"
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "Wolf_Tablet";
disableSerialization;
/*
switch((side player)) do
{
	case west: 
	{
//		ctrlShow[505054,false]; // gang grafik
		ctrlShow[505044,false]; // gang button
//		ctrlShow[505057,false]; // brooker grafik
		ctrlShow[505040,false]; // brooker button
	};
	
	case civilian:
	{
//		ctrlShow[505063,false]; // Fahndungsliste Grafik
		ctrlShow[505043,false]; // Fahndungsliste Button
//		ctrlShow[505059,false]; // Wantend+ grafik
		ctrlShow[505049,false]; // Wantend+ button
//		ctrlShow[505055,false]; // backup grafik
		ctrlShow[505045,false]; // backup button
//		ctrlShow[505057,false]; // brooker grafik
		ctrlShow[505040,false]; // brooker button
	};
	
		case independent:
	{
//		ctrlShow[505054,false]; // gang grafik
		ctrlShow[505044,false]; // gang button
//		ctrlShow[505055,false]; // backup grafik
		ctrlShow[505045,false]; // backup button
//		ctrlShow[505063,false]; // Fahndungsliste Grafik
		ctrlShow[505043,false]; // Fahndungsliste Button
//		ctrlShow[505059,false]; // Wantend+ grafik
		ctrlShow[505049,false]; // Wantend+ button
//		ctrlShow[505057,false]; // brooker grafik
		ctrlShow[505040,false]; // brooker button
	};
	
		case east:
	{
//		ctrlShow[505054,false]; // gang grafik
		ctrlShow[505044,false]; // gang button
//		ctrlShow[505055,false]; // backup grafik
		ctrlShow[505045,false]; // backup button
//		ctrlShow[505063,false]; // Fahndungsliste Grafik
		ctrlShow[505043,false]; // Fahndungsliste Button
//		ctrlShow[505059,false]; // Wantend+ grafik
		ctrlShow[505049,false]; // Wantend+ button
//		ctrlShow[505057,false]; // brooker grafik
		ctrlShow[505040,false]; // brooker button
	};

};

if(__GETC__(DWEV_adminlevel) < 1) then
{
	ctrlShow[2020,false]; // unbekannt
//	ctrlShow[505064,false]; // admin grafik
	ctrlShow[505042,false]; // admin button
};

if(__GETC__(DWEV_coplevel) < 3) then
{
//	ctrlShow[505059,false]; // Wantend+ grafik
	ctrlShow[505049,false]; // Wantend+ button
};

[] call DWEV_fnc_p_updateMenu;

if(__GETC__(DWEV_adminlevel) < 1) then
{
	ctrlShow[2020,false]; // unbekannt
//	ctrlShow[505064,false]; // admin grafik
	ctrlShow[505042,false]; // admin button
};
*/