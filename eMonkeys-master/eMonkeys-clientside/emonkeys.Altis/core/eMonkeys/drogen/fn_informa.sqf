/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
	e-monkeys.com
*/

private["_red"];
if(eM_drogen_active) exitWith {hint "Die Position wurde bereits übermittelt!"};

_red = round(random 13);




switch(true) do
		{
			case (_red < 1) : 
			{
			Dealer_1 hideObject false;
			"Dealer_1" setMarkerAlphaLocal 1;
			"kreis_8" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist für 30 Minuten in der Kavala Bucht, nähe des Goldhändler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;
			
           };
		   case (_red < 2) : 
		   {
             Dealer_2 hideObject false;
			"Dealer_1_4" setMarkerAlphaLocal 1;
			"kreis_7" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist für 30 Minuten in Gravia bei Athira."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
		
			eM_drogen_active = true;			
            };
			case (_red < 3) : 
			{
            Dealer_3 hideObject false;
			"Dealer_1_3" setMarkerAlphaLocal 1;
			"kreis_9" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten in Pyrgos, Richtung Diamantenmine."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;

			eM_drogen_active = true;			
            };	
			case (_red < 4) : 
			{
            Dealer_1_1 hideObject false;
			"Dealer_1_1" setMarkerAlphaLocal 1;
			"kreis_1_1" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten bei DP5 in Galati."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
	
			eM_drogen_active = true;			
            };
			
			case (_red < 5) : 
			{
            Dealer_1_1_1 hideObject false;
			"Dealer_1_1_1" setMarkerAlphaLocal 1;
			"kreis_1_1_1" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten beim Einwohnermeldeamt."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			
			case (_red < 6) : 
			{
            Dealer_1_1_2 hideObject false;
			"Dealer_1_1_2" setMarkerAlphaLocal 1;
			"kreis_1_1_2" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten in der nähe der Müllhalde."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			
			case (_red < 7) : 
			{
            Dealer_1_1_3 hideObject false;
			"Dealer_1_1_3" setMarkerAlphaLocal 1;
			"kreis_1_1_3" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten beim Zementhändler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			
			case (_red < 8) : 
			{
            Dealer_1_1_4 hideObject false;
			"Dealer_1_1_4" setMarkerAlphaLocal 1;
			"kreis_1_1_4" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist für 30 Minuten bei der Ölraffinerie."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage	;
			eM_drogen_active = true;			
            };
			
			case (_red < 9) : 
			{
            Dealer_1_1_5 hideObject false;
			"Dealer_1_1_5" setMarkerAlphaLocal 1;
			"kreis_1_1_5" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten beim Sägewerk."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			
			case (_red < 10) : 
			{
            Dealer_1_1_6 hideObject false;
			"Dealer_1_1_6" setMarkerAlphaLocal 1;
			"kreis_1_1_6" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten bei der Brauerei."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;

			eM_drogen_active = true;			
            };
			
			case (_red < 11) : 
			{
            Dealer_1_1_7 hideObject false;
			"Dealer_1_1_7" setMarkerAlphaLocal 1;
			"kreis_1_1_7" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten beim Schmuckhändler."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			case (_red < 12) : 
			{
            Dealer_1_1_8 hideObject false;
			"Dealer_1_1_8" setMarkerAlphaLocal 1;
			"kreis_1_1_8" setMarkerAlphaLocal 1; 
			_text = "Der Drogendealer ist für 30 Minuten bei der Treibstoffraffinerie."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			case (_red < 13) : 
			{
            Dealer_1_1_9 hideObject false;
			"Dealer_1_1_9" setMarkerAlphaLocal 1;
			"kreis_1_1_9" setMarkerAlphaLocal 1;
			_text = "Der Drogendealer ist für 30 Minuten bei der Silberschmelze."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
			eM_drogen_active = true;			
            };
			
			
		};

[] spawn 
{

uisleep 1800;

Dealer_1 hideObject true;
"Dealer_1" setMarkerAlphaLocal 0;
"kreis_8" setMarkerAlphaLocal 0;

Dealer_2 hideObject true;
"Dealer_1_4" setMarkerAlphaLocal 0;
"kreis_7" setMarkerAlphaLocal 0;

Dealer_3 hideObject true;
"Dealer_1_3" setMarkerAlphaLocal 0;
"kreis_9" setMarkerAlphaLocal 0;


Dealer_1_1 hideObject true;
"Dealer_1_1" setMarkerAlphaLocal 0;
"kreis_1_1" setMarkerAlphaLocal 0;

Dealer_1_1_1 hideObject true;
"Dealer_1_1_1" setMarkerAlphaLocal 0;
"kreis_1_1_1" setMarkerAlphaLocal 0;


Dealer_1_1_2 hideObject true;
"Dealer_1_1_2" setMarkerAlphaLocal 0;
"kreis_1_1_2" setMarkerAlphaLocal 0;



Dealer_1_1_3 hideObject true;
"Dealer_1_1_3" setMarkerAlphaLocal 0;
"kreis_1_1_3" setMarkerAlphaLocal 0;



Dealer_1_1_4 hideObject true;
"Dealer_1_1_4" setMarkerAlphaLocal 0;
"kreis_1_1_4" setMarkerAlphaLocal 0;



Dealer_1_1_5 hideObject true;
"Dealer_1_1_5" setMarkerAlphaLocal 0;
"kreis_1_1_5" setMarkerAlphaLocal 0;


Dealer_1_1_6 hideObject true;
"Dealer_1_1_6" setMarkerAlphaLocal 0;
"kreis_1_1_6" setMarkerAlphaLocal 0;



Dealer_1_1_7 hideObject true;
"Dealer_1_1_7" setMarkerAlphaLocal 0;
"kreis_1_1_7" setMarkerAlphaLocal 0;



Dealer_1_1_8 hideObject true;
"Dealer_1_1_8" setMarkerAlphaLocal 0;
"kreis_1_1_8" setMarkerAlphaLocal 0;



Dealer_1_1_9 hideObject true;
"Dealer_1_1_9" setMarkerAlphaLocal 0;
"kreis_1_1_9" setMarkerAlphaLocal 0;


_text = "Der Drogendealer musste seine Position wechseln."; _absender = "Der Informant"; [_text,_absender,0] spawn clientMessage;
eM_drogen_active = false;
};






