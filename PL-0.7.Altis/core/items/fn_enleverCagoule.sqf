#include "..\..\script_macros.hpp"
/*
	Auteur : Skrow / ShanyWoozen
	Description: mettre une cagoule sur une personne
*/
player SVAR ["cagoule",false,true];
removeGoggles player;
cutText["On vient de vous enlever la cagoule sur votre tête.","BLACK IN",10];