#include "..\..\macros.hpp"
/*
File : fn_lizenzzeigen.sqf
Create : Black Lagoon
Edit : Division-wolf.de 
*/
if(isServer)exitWith{};
private["_ziel", "_schein", "_lizenzen","_lizenzenMsg","_message"];
if(vehicle player != player )exitWith{};
_ziel = param[0, player, [player]];
_schein = param[1, 0, [0]]; //0-PKW, 1-LKW, 2-Flug
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};

_lizenzen = [];
switch(_schein)do{
	default //PKW
	{
		if(lc_driver || lc_truck) then {
			if(lc_driver) then { _lizenzen pushBack ["B, BE", "#00FF00"]; };
			if(lc_truck) then { _lizenzen pushBack ["C1, C1E, C, CE", "#0072FF"]; };
			_lizenzenMsg = "";
			{
				_lizenzenMsg = 	_lizenzenMsg + format["<t size='1' color='%1'>%2</t><br/>", _x select 1, _x select 0];	
			} foreach _lizenzen;
			_message = format["<t size='2.2' color='#FFFF00'>Führerschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, Fahrzeuge der Klasse(n) <br/>
			%2 zu führen!
			", getMyDName, _lizenzenMsg];
			hint "Du hast deinen Führerschein gezeigt";
		} else {
			_message = format["<t size='2.2' color='#FFFF00'>Führerschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist nicht berechtigt, motorisierte Landfahrzeuge zu führen!
			", getMyDName];
			
			hint "Du hast keinen Führerschein";
		};
	};
	
	case 1: //Flugschein
	{
		if(lc_air || lc_airgewerbe || lc_airkampf) then {
			if(lc_air) then { _lizenzen pushBack ["PPL H, PPL A, PPL N", "#00FF00"]; };
			if(lc_airgewerbe) then { _lizenzen pushBack ["CPL/IR A, CPL H, ATPL A, ATPL H", "#0072FF"]; };
			if(lc_airkampf) then { _lizenzen pushBack ["Millitärische Luftkampffahrzeuge", "#FF0000"]; };
			_lizenzenMsg = "";
			{
				_lizenzenMsg = 	_lizenzenMsg + format["<t size='1' color='%1'>%2</t><br/>", _x select 1, _x select 0];	
			} foreach _lizenzen;
			_message = format["<t size='2.2' color='#FFFF00'>Flugschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, Luftfahrzeuge der Klasse(n) <br/>
			%2 zu führen!
			", getMyName, _lizenzenMsg];

			hint "Du hast deinen Flugschein gezeigt";
		} else {
			_message = format["<t size='2.2' color='#FFFF00'>Führerschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist nicht berechtigt, motorisierte Luftfahrzeuge zu führen!
			", getMyName];

			hint "Du hast keinen Flugschein";
		};
	};
	
	case 2: //Bootsschein
	{
		if(lc_boat) then {
			if(lc_boat) then { _lizenzen pushBack ["SBF", "#00FF00"]; };
			_lizenzenMsg = "";
			{
				_lizenzenMsg = 	_lizenzenMsg + format["<t size='1' color='%1'>%2</t><br/>", _x select 1, _x select 0];	
			} foreach _lizenzen;
			_message = format["<t size='2.2' color='#FFFF00'>Flugschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, Wasserfahrzeuge der Klasse(n) <br/>
			%2 zu führen!
			", getMyName, _lizenzenMsg];
			hint "Du hast deinen Bootsschein gezeigt";
		} else {
			_message = format["<t size='2.2' color='#FFFF00'>Führerschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist nicht berechtigt, motorisierte Wasserfahrzeuge mit mehr al 5PS zu führen!
			", getMyName];
			
			hint "Du hast keinen Flugschein";
		};
	};
	
	case 3: //Anwalt
	{
		if(lc_anwalt) then { 
			_message = format["<t size='2.2' color='#FFFF00'>Anwaltslizenz</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, vor Gericht als Rechtsverteidiger aufzutreten, einen Clienten zu vertreten und entsprechende Akteneinsicht zu verlangen!
			", getMyName];
			hint "Du hast deine Anwaltszulassung gezeigt";
		} else {
			hint "Du hast keine Anwaltszulassung";	
		};
	};
	
	case 4: //Waffe
	{
		if(lc_gun) then { 
			_message = format["<t size='2.2' color='#FFFF00'>Waffenschein</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, Signal-, Reizstoff-, Schreckschuss- und Handfeuerwaffen berechtigt. Er ist nicht dazu berechtig, tödliche Gewalt auszuüben. Die genannten Waffen dürfen NICHT auf öffentlichen Versammlungen geführt werden! 
			", getMyName];
			hint "Du hast deinen Waffenschein gezeigt";
		} else {
			hint "Du hast keinen Waffenschein";	
		};
	};
	
	case 5: //Behindert
	{
		if(lc_behindert) then { 
			_message = format["<t size='2.2' color='#FFFF00'>Behindertenausweis</t><br/>
			<t size='2.5'>%1</t><br/><br/>
			ist berechtigt, auf ausgewiesenen Behindertenarkplätzen zu Parken. Des weiteren ist er berechtigt, Nachlässe aufgrund seiner Behinderung in Anspruch zu nehmen!
			", getMyName];
			hint "Du hast deinen Behindertenausweis gezeigt!";
		} else {
			hint "Du hast keinen Behindertenausweis";	
		};
	};
};

[player, _message] remoteExec ["DWEV_fnc_Lizenzsehen",_ziel];