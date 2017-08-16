/*
	Autor: Felix von Studsinske
	Dateiname: fn_persoErgebnis.sqf
	Beschreibung:
		Überprüft die Personalausweisdaten auf das richtige Format (Strings) und weist den Personalausweis dem Spieler zu.
*/
_text = [_this,0,[],[[]]] call BIS_fnc_param;
if(_text isEqualTo []) exitWith {0 cutText ["Fehler: Personalausweis muss angelegt werden","BLACK FADED"]; 0 cutFadeOut 9999999; [] call life_fnc_persoNeu};
if((count _text) < 11 || (count _text) > 11 || !(_this isEqualType [])) exitWith {endMission "fehlerprof";};
_textgt = _text select 0;
/*_name = "";
if (_textgt isEqualTo "-") then {
	_name = [_text select 1,_text select 2] joinString " ";
} else {
	_name = [_text select 0,_text select 1,_text select 2] joinString " ";
};
if(!(_name isEqualTo profileName)) exitWith {
	[_name] spawn {
		[
			format["Du hast dich versucht mit einem anderem Profilname (%1) anzumelden, aber '%2' ist für den Personalausweis hinterlegt! Ändere deinen Namen im Profil oder melde dich beim Support im Teamspeak auf ts.german-epic.life oder im Forum unter <a href='http://german-epic.life'>german-epic.life</a></t>",profileName, _this select 0],
			"Personalausweis - Falscher Name - Case-Sensitive (Groß-/Kleinschreibung)",
			"Verstanden",
			false
		] call BIS_fnc_guiMessage;
		endMission "falschprof";
	};
};*/
if (typeName _text != "ARRAY") exitWith {endMission "fformatprof";};


_side = side Player;
if (_side == west) then {
	switch (call life_coplevel) do {
		case 1 : {_text set [0,"Polizeimeisteranwärter"]};
		case 2 : {_text set [0,"Polizeimeister"]};
		case 3 : {_text set [0,"Polizeiobermeister"]};
		case 4 : {_text set [0,"Polizeihauptmeister"]};
		case 5 : {_text set [0,"Erster Polizeihauptmeister"]};
		case 6 : {_text set [0,"Polizeikommissarsanwärter"]};
		case 7 : {_text set [0,"Polizeikommissar"]};
		case 8 : {_text set [0,"Polizeioberkommissar"]};
		case 9 : {_text set [0,"Polizeihauptkommissar"]};
		case 10 : {_text set [0,"Erster Polizeihaubtkommissar"]};
		case 11 : {_text set [0,"SEK Anwärter"]};
		case 12 : {_text set [0,"SEK Beamter"]};
		case 13 : {_text set [0,"SEK Direktor"]};
		case 14 : {_text set [0,"Erster SEK Direktor"]};
		case 15 : {_text set [0,"Leitender Polizeidirektor"]};
		default {_text set [0,"ERROR"]};
	};
};


player setVariable ["personaltext",_text,true];
life_persoReady = true;