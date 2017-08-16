/*
	fn_halloweenheal.sqf
	Author: G00golplexian
	
	Description: Heals, well..yes...
*/
if!([false,"skelett",1] call life_fnc_handleinv) exitWith {hint "Gölsahn, der Voodoopriester, hat keinen Rat für dich."};

[[["Quest abgeschlossen:","<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
["Gölsahn Schiniagski","<t align = 'center' shadow = '1' size = '0.7' color='#ff1000'>%1</t><br/>"],
["Du bringst mir also die Leichenteile des ertrunkenen Mädchens? Als Dank für deine Taten, werde ich nun den Fluch von dir nehmen! Ich werde nun meine Voodookünste nutzen, um sie den Göttern der Milch zu übergeben. Ouahahahohououa Wolloloo!","<t align = 'center' shadow = '1' size = '0.5'>%1</t>"]]] spawn BIS_fnc_typeText;

voodoopriester say3d "voodoo";
sleep 24;
["Gesund"] call life_fnc_zustand;
voodoopriester say3d "voodoo";