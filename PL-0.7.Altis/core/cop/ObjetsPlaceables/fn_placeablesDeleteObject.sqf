/*
  File: fn_placeablesDeleteObject.sqf
  Author: Skrow & Skyfezzer
  Description:
    Permet de supprimer un seul placeables à la fois.
*/

if (life_bar_placey find cursorTarget != -1 && getPos player distance cursorTarget < 5) then {
  deleteVehicle cursorTarget;
  hint "L'objet à bien été supprimé.";
} else {
  hint "Il faut viser l'objet à supprimer et vous trouver à moins de 5 mètres.";
};
