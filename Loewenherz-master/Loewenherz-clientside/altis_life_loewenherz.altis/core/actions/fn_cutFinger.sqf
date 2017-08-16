/*
	File: fn_cutFinger.sqf
	Author: Teebaron
	
	Description:
	Ermöglicht es einen Spiele den Finger seines Gefangenen abzuschneiden.
	
	Precondition:
	Spieler ist gefesselt. Dieses wird nicht explizit getestet sondern angenommen.
	
	params:
	[Ziel (Player), modus (String), Finger (int)]
	Ziel: Das Opfer. nil wenn man selbst das Opfer ist.
	Modus: 1 Dialog 2 Angreifer 3 Opfer
	Finger: Finger 1: Linke Hand kleiner Finger -> 10 Rechte Hand kleiner Finger
*/
//Nur Temp bis eigener Dialog da ist
#define Btn1 2400
#define Btn2 2401
#define Btn3 2402
#define Btn4 2403
#define Btn5 2404
#define Btn6 2405
#define Btn7 2406
#define Btn8 2407
#define Btn9 2408
#define Btn10 2409
#define Title 37401
/////////////////////////////////////

private ["_finger","_modus","_ziel","_zielFinger","_hand","_effect","_fingerName"];
_ziel   = param [0,nil];
_modus  = param [1,0];
_finger = param [2,0];
lhm_pInact_curTarget = _ziel;

hint format["Funktion Finger wurde aufgerufen: %1, %2, %3",_ziel,_modus,_finger];

switch(_modus) do {
	case 1: {
		closeDialog 0;
		createDialog "interactionmenu_loewenherz";
		disableSerialization;
		_Btn1 ctrlSetText "Daumen";
		_Btn1 buttonSetAction "[lhm_pInact_curTarget,2,1] call lhm_fnc_cutFinger;";
		_Btn2 ctrlSetText "Zeigefinger";
		_Btn2 buttonSetAction "[lhm_pInact_curTarget,2,2] call lhm_fnc_cutFinger;";
		_Btn3 ctrlSetText "Mittelfinger";
		_Btn3 buttonSetAction "[lhm_pInact_curTarget,2,3] call lhm_fnc_cutFinger;";
		_Btn4 ctrlSetText "Ringfinger";
		_Btn4 buttonSetAction "[lhm_pInact_curTarget,2,4] call lhm_fnc_cutFinger;";
		_Btn5 ctrlSetText "Kleiner Finger";
		_Btn5 buttonSetAction "[lhm_pInact_curTarget,2,5] call lhm_fnc_cutFinger;";
		
		_Btn6 ctrlSetText "Daumen";
		_Btn6 buttonSetAction "[lhm_pInact_curTarget,2,6] call lhm_fnc_cutFinger;";
		_Btn7 ctrlSetText "Zeigefinger";
		_Btn7 buttonSetAction "[lhm_pInact_curTarget,2,7] call lhm_fnc_cutFinger;";
		_Btn8 ctrlSetText "Mittelfinger";
		_Btn8 buttonSetAction "[lhm_pInact_curTarget,2,8] call lhm_fnc_cutFinger;";
		_Btn9 ctrlSetText "Ringfinger";
		_Btn9 buttonSetAction "[lhm_pInact_curTarget,2,9] call lhm_fnc_cutFinger;";
		_Btn10 ctrlSetText "Kleiner Finger";
		_Btn10 buttonSetAction "[lhm_pInact_curTarget,2,10] call lhm_fnc_cutFinger;";
	};	
    case 2: {
		closeDialog 0;
		//Check: Ob die Parameter richtig sind
		if(isNil _ziel or _finger < 1 or _finger > 10) exitWith {hint "Hier läuft was gehörig falsch"}; 
		_zielFinger = _ziel getVariable ["lhm_finger", nil];
		//Gibt es die Var?
		if(isNil _zielFinger) exitWith {hint "Hier läuft was gehörig falsch"}; 
		//Finger noch dran?
		if(not (_zielFinger select (_finger-1))) exitWith {hint "Der Finger ist schon ab"}; 
		
		hint "Schnipp schnapp Finger ab!" ;
		
		//Finger entfernen
		_zielFinger set[(_finger-1), false];
		_ziel setVariable ["lhm_finger", _zielFinger, true];
		//Schaden nehmen
		_schaden = (getDammage _ziel) + 14;
		if(_schaden >= 0.9) then {
			_schaden = 0.9;
			hint "Dem Opfer scheint es nicht gut zu gehen. Noch ein Finger und er fällt um";
		};
		_ziel setDamage (_schaden);
		//Opfer informiern
		[[nil,3,_finger],"lhm_fnc_cutFinger",_ziel,false] call lhm_fnc_mp;
	};
	case 3: {
		//Linke oder Rechte Hand ?
		_hand = if(_finger <= 5) then [{"linker"},{"rechter"}];
		//Wähle den Finger aus der fehlt
		_fingerName = ["Daumen","Zeigefinger","Mittelfinger","Ringfinger","kleiner Finger"] select (_finger mod 5);
		//Ausgabe Text.
		hint format ["Dein %1 %2 wurde mit einer rostigen Gartenzange entfernt. Blut strömt aus deiner Hand", _hand, _fingerName];
		//Lauter Schrei in 3D
		_effect = [["scream_short_0"],["scream_short_1"],["scream_short_2"],["scream_short_3"],["scream_short_4"]] call BIS_fnc_selectRandom select 0;
		[[player,_effect],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;

	};
    default { hint "Bin ich jetzt Opfer oder Täter? Da hat wohl jemand einen Fehler im Quellcode hinterlassen"};
}