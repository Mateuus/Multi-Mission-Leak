_fnc_scriptName = "Player Synchronization";
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time && _manuelSync == "0") exitWith {hint "Vous avez déjà utilisé l'option de synchronisation, vous ne pouvez utiliser cette fonction une fois toutes les 5 minutes.";};

[] call SOCK_fnc_updateRequest;
hint "Synchronisation des informations de joueur sur le serveur.\n\nS'il vous plaît veuiller attendre 20 secondes avant de quitter";

[] spawn {
		life_session_time = true;
		uiSleep (5 * 60);
		life_session_time = false;
};
