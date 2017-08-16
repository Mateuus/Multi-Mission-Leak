/*
	File: fn_licensesRead.sqf
	Author: Bryan "Tonic" Boardwine
	modified by Division Wolf e.V. (MarkusSR1984)
	
	Description:
	Outprints the Alcohol level
*/
private["_promille","_civ"];
_civ = param [0,"",[""]];
_promille = param [1,"0.00</br>",[""]];

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1'>Drugomat:</t></t><br/>%2",_civ,_promille];