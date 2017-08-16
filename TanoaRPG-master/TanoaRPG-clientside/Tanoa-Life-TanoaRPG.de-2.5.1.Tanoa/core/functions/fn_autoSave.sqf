/* 
	Author: TheTotenkopf für SealDrop.de
*/

while {true} do {
	sleep 900;
	[] call XAS_fnc_updateRequest;
	hint "Deine Spielerinformationen wurden automatisch zum Server gespeichert.\n\n Nächster AutoSave in: 15 Minuten"
};