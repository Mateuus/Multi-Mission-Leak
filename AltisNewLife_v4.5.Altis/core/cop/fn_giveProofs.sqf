_cop = cursorTarget;
if(isNull _cop) exitWith {};
if(!(isPlayer _cop)) exitWith {};
if((side _cop) != west) exitWith {titleText["Vous ne pouvez donner des preuves qu'à un Gendarme","PLAIN"]};
if(actualProofs isEqualTo []) exitWith {titleText["Vous n'avez pas de preuves sur vous","PLAIN"]};

_proofs = actualProofs;
[[_proofs],"life_fnc_receiveProofs",_cop,false] spawn life_fnc_MP;
titleText["Vous avez donné les preuves au gendarme","PLAIN"];
actualProofs = [];