/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Outprints the licenses.
*/
private["_licenses","_civ"];
_civ = param [0,"",[""]];
_licenses = param [1,"Keine Lizenzen</br>",[""]];

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1'>Lizenzen:</t></t><br/><t size='0.7'>%2</t>",_civ,_licenses];