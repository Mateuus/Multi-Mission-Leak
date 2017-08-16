#include "..\..\script_macros.hpp"
/*
	Auteur : Skrow / ShanyWoozen
	Description: mettre une cagoule sur une personne
*/
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
player SVAR ["cagoule",true,true];
removeGoggles player;
player addGoggles "G_Balaclava_combat";
cutText["Vous avez un sac sur la tete vous ne pouvez rien voir.","BLACK OUT"];