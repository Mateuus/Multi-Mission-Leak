_this enableSimulation false;
_this allowDamage false;
_this addAction["Réserve federale - Entrée de devant",life_fnc_fedCamDisplay,"front"];
_this addAction["Réserve federale - Entrée latérale",life_fnc_fedCamDisplay,"side"];
_this addAction["Réserve federale - Entrée arrière",life_fnc_fedCamDisplay,"back"];
_this addAction["Réserve federale - Coffre",life_fnc_fedCamDisplay,"vault"];
_this addAction["Désactiver l'affichage",life_fnc_fedCamDisplay,"off"];
_this addAction["Liberer un prisonnier",life_fnc_p_prisionbreak,"computer"];