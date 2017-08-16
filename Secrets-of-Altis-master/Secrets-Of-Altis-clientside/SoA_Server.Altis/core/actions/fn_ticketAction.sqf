/*
	File: fn_ticketAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the ticketing process.
*/
private["_mode","_text"];
_mode = _this select 0;
_text = "";
disableSerialization;

switch(_mode) do {

	//Bußgeld schreiben
	case 0: {
		life_ticket_unit = _this select 1;
		if(isNull life_ticket_unit OR !isPlayer life_ticket_unit) exitwith {};
		if(!(createDialog "bussgeld_schreiben")) exitWith {hint localize "STR_Cop_TicketFail"};

		if(side player == independent) then {ctrlSetText[2000,"images\rechnung.paa"]};
		ctrlSetText[2652,format["%1",name life_ticket_unit]];
		ctrlSetText[2653,format["%1",[0] call life_fnc_gettime]];
		ctrlSetText[2654,format["%1",(text (nearestLocations [(getpos player),["NameVillage","NameCity","NameCityCapital"],5000]select 0))]];
	};

	//Bußgeld übergeben
	case 1: {

		_geld = ctrlText 2651;
		_straftat = ctrlText 2655;
		if(parsenumber _geld > 300000) exitWith {hint "Du kannst nicht mehr als 300.000€ ausstellen."};
		if(_straftat == "") exitWith {hint "Du hast keinen Straftatbestand angegeben."};

		[2,(parsenumber _geld),_straftat,player] remoteExecCall ["life_fnc_ticketAction",life_ticket_unit];
	};

	//Bußgeld erhalten
	case 2: {
		if(!(createDialog "bussgeld_erhalten")) exitWith {hint "Fehler beim Aufbau des Dialogs."};
		(finddisplay 2650) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {[4] call life_fnc_ticketAction}"]; 

		_geld = _this select 1;
		_straftat = _this select 2;
		_polizist = _this select 3;
		if(side _polizist == independent) then {ctrlSetText[2000,"images\rechnung.paa"]};

		ctrlSetText[2651,format["%1",[_geld] call life_fnc_numberText]];
		ctrlSetText[2652,format["%1",name player]];
		ctrlSetText[2653,format["%1",[0] call life_fnc_gettime]];
		ctrlSetText[2654,format["%1",life_ausweisdaten select 2]];
		ctrlSetText[2655,format["%1",(text (nearestLocations [(getpos player),["NameVillage","NameCity","NameCityCapital"],5000]select 0))]];
		ctrlSetText[2656,format["%1",life_ausweisdaten select 6]];
		((finddisplay 2650) displayCtrl 2657) ctrlSetStructuredText parseText format["<t color='#000000'>%1</t>",_straftat];

		buttonSetAction[2658,format["[3,%1,%2] call life_fnc_ticketAction;",_geld,_polizist]];
		buttonSetAction[2659,format["[4,%1] call life_fnc_ticketAction;",_polizist]];
	};

	//Bußgeld zahlen
	case 3: {
		closedialog 0;
		_geld = _this select 1;
		_polizist = _this select 2;
		_text = "";
		_rege = 0;
		
		if(side _polizist == west) then {_text = "das Bußgeld"; _rege = (_geld*0.5)} else {_text = "die Rechnung"; _rege = _geld};

		if(life_beatbankgeld < _geld) exitWith {	
			hint format["Du kannst %1 nicht bezahlen, da du das Geld nicht auf dem Konto hast.",_text];
			[1,format["%1 kann sich %2 nicht leisten.",name player,_text]] remoteExecCall ["life_fnc_broadcast",_polizist];
		};

		life_beatbankgeld = life_beatbankgeld - _geld;
		[_rege,name player,2,false] remoteExecCall ["life_fnc_moneytransfer",_polizist];

		hint format["Du hast %1 von %2€ bezahlt.",_text,[_geld] call life_fnc_numberText];
		[0,format["%1 hat %4 (%2€), ausgestellt von %3, bezahlt.",name player,[_geld] call life_fnc_numberText,name _polizist,_text]] remoteExecCall ["life_fnc_broadcast",west];
		[1,format["%1 hat %3 (%2€) bezahlt.",name player,[_geld] call life_fnc_numberText,_text]] remoteExecCall ["life_fnc_broadcast",_polizist];
	};

	//Bußgeld verweigern
	case 4: {
		closedialog 0;
		_text = "";
		_polizist = _this select 1;
		if(side _polizist == west) then {_text = "das Bußgeld"} else {_text = "die Rechnung"};

		hint format["Du hast %1 verweigert.",_text];
		[1,format["%1 hat sich geweigert %2 zu zahlen!",name player,_text]] remoteExecCall ["life_fnc_broadcast",_polizist];
 	};
};