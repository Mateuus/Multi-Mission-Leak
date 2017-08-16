/*

	Author: Nox
	Description: Magic happens...

*/
if (roentgen_request_accepted) exitWith { hint "Das Roentgengeraet wurde bereits freigegeben, bitte warte bis die Untersuchung beendet ist."; };
if (roentgen_in_progress) exitWith { hint "Derzeit findet bereits eine Untersuchung statt." };
if (playerside != independent) exitWith { hint "Du bist kein Arzt und kannst daher das Roentgengeraet nicht bedienen!" };
if (vehicle player != player) exitWith {};

roentgen_request_accepted = true;
publicVariable "roentgen_request_accepted";