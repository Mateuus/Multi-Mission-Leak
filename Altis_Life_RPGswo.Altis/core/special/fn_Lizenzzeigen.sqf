#include "..\..\macros.hpp"
/*
File : fn_lizenzzeigen.sqf
Create : Black Lagoon
Edit : Division-wolf.de 
*/
if(isServer)exitWith{};
private["_ziel", "_rang", "_marke", "_org", "_message", "_farbe", "_farbeSEK", "_Lizenzen"];
if(vehicle player != player )exitWith{};
_ziel = param[0, player, [player]];
if(isNull _ziel) then {_ziel = player;};    
if(!(_ziel isKindOf "Man")) then {_ziel = player;};  
if(!(alive _ziel)) then {_ziel = player;};
_lizenzen = [];

switch((side player))do{
	case west:
	{
		switch (call DWEV_coplevel) do
		{
		case 1: {_rang = "Ordnungsbeamter";};
		case 2: {_rang = "Wachtmeister";};
		case 3: {_rang = "Oberwachtmeister";};
		case 4: {_rang = "Hauptwachtmeister";};
		case 5: {_rang = "Kommissar";};
		case 6: {_rang = "Oberkommissar";};
		case 7: {_rang = "Hauptkommissar";};
		case 8: {_rang = "Polizeidirektion";};
		case 9: {_rang = "Polizeipräsident";};
		default {_rang =  "Error";};
		};
		_marke = "Polizei128";
		_org = "Polizei Altis";
		_farbe = "#009AFF";
		
			if (lp_swat) then
			{
				_lizenzen pushBack ["SEK Mitglied", "#00FF00"];
			};
	};
	
	case east:
	{
		switch (call DWEV_opforlevel) do
		{
		case 1: {_rang = "WSC Mitarbeiter";};
		case 2: {_rang = "WSC Leitung";};
		default {_rang =  "Error";};
		};
		_marke = "Sicherheit128";
		_org = "Sicherheitsdienst Altis";
		_farbe = "#FFFF00";
	};
	
	case independent:
	{
		switch (call DWEV_mediclevel) do
		{
		case 1: {_rang = "Feuerwehr [An]";};
		case 2: {_rang = "Feuerwehr [H]";};
		case 3: {_rang = "Feuerwehr [AG]";};
		case 4: {_rang = "Feuerwehr [TF]";};
		case 5: {_rang = "Feuerwehr [Ma]";};   
		case 6: {_rang = "Feuerwehr [GF]";};  
		case 7: {_rang = "Feuerwehr [HF]";};
		case 8: {_rang = "Feuerwehr [ZF]";}; 
		case 9: {_rang = "Feuerwehr [Leitung]";}; 
		default {_rang =  "Error";};
		};
		_marke = "feuerwehr128";
		_org = "Feuerwehr Altis";
		_farbe = "#FF0000";
	};
	
	case civilian:
	{
		if((side player) == civilian)then
		{
		_rang = "Zivilist";
		_marke = "wolfkopf128";
		_org = "Republik Altis";
		_farbe = "#FFFFFF";
		
			/*if (lc_driver) then
			{
				_lizenzen pushBack ["Führerschein", "#00FF00"];
			};
			if (lc_truck) then
			{
				_lizenzen pushBack ["LKW Führerschein", "#00FF00"];
			};
			if (lc_air) then
			{
				_lizenzen pushBack ["Flugschein", "#00FF00"];
			};
			if (lc_anwalt) then
			{
				_lizenzen pushBack ["Anwalt", "#00FF00"];
			};
			if (lc_gun) then
			{
				_lizenzen pushBack ["Schusswaffenlizenz", "#00FF00"];
			};
			if (lc_behindert) then
			{
				_lizenzen pushBack ["Behindertenausweis", "#FFC000"];
			}; */
		};
	};  
};


_lizenzenMsg = "";
{
	_lizenzenMsg = 	_lizenzenMsg + format["<br/><t size='1' color='%1'>%2</t>", _x select 1, _x select 0];	
} foreach _lizenzen;
_message = format["<t size='2.2' color='#FFFF00'>Personalausweis</t><br/>
<t size='1'>%4</t><br/><br/>
<img size='5' color='#FFFFFF' image='icons\%1.paa'/><br/><br/>
<t size='2.5'>%2</t><br/><br/><t size='1.7' color='%5'>%3</t><br/>
%6
",_marke, getMyName, _rang, _org, _farbe, _lizenzenMsg];

hint "Du hast deine Ausweise gezeigt";

[player, _message] remoteExec ["DWEV_fnc_Lizenzsehen",_ziel];