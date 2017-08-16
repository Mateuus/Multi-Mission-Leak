#include <macro.h>
if(life_session_completed) exitWith {};
cutText["Le serveur n'a pas trouvé toutes les informations correspondant à votre identifiant, tentative d'ajout du joueur dans le système.","BLACK FADED"];
0 cutFadeOut 9999999;
[[steamid,profileName,argent_liquide,compte_banque,player],"DB_fnc_insertRequest",false,false] spawn life_fnc_MP;