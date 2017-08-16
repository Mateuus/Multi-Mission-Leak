#include <macro.h>
private["_message"];
if(GETC(bitch_level) < 3) exitWith {closeDialog 0; hint "Vous devez etre Admin pour faire ca !";};
_message = "Ceci n'est pas un exercice. Notre système de diffusion d'urgence vous annonçe le début de la purge annuelle mise en place par notre gouvernement. Si vous ne voulez pas participer, quitter la ville et courez vous cacher. Tous les services d'urgence doivent terminer leurs services et rentrer à la maison.";
[[_message,name player,7],"TON_fnc_clientMessage",true,false] spawn life_fnc_MP;
[[Tower1, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower2, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower3, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower4, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower5, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower6, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower7, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower8, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower9, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[Tower10, "purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;