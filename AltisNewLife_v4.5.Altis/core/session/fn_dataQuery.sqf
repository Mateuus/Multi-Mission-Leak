private["_uid","_side","_sender"];
if(life_session_completed) exitWith {};
_sender = player;
_uid = getPlayerUID _sender;
_side = playerSide;
cutText[format["Envoi de la requête au serveur pour obtenir des informations pour [%1]",_uid],"BLACK FADED"];
0 cutFadeOut 999999999;
[[_uid,_side,_sender],"DB_fnc_queryRequest",false,false] call life_fnc_MP;