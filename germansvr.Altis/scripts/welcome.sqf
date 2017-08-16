*/ 
 Script: Welcome Notification
 Author: Exodoos
 Beschreibung: 
 Zeigt einem nach dem Spawn evtl. Server Infos, oder alle Team Namen usw.
/*
[] spawn {
 sleep 15; //WARTESCHLEIFE IN SEKUNDEN
 [
 [
 ["Willkommen bei","<t align = 'center' size = '0.7'>%1</t><br/>"], //OBERE ZEILE
 ["NextGeneration","<t align = 'center' size ='1'>%1</t><br/>"] //UNTERE ZEILE
 ]
 ] spawn BIS_fnc_typeText; //TEXT TYP
 sleep 12;
 [
 [
 ["Derzeitige Version","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["2.0.0"<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
 sleep 12;
 [
 [
 ["Neue Funktionen","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["Gesten, Neue Spawn Auswahl, Überarbeitung der Karte, Überarbeitung von Cops/Medics/Eliterebellen","<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
 sleep 12;
 [
 [
 ["Projektleitung","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["ReaZzn, Jodie, Heidel","<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
 sleep 20;
 [
 [
 ["Projektmanager","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["Hermes Hundert","<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
 sleep 12;
 [
 [
 ["Admins","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["Jay Veljeta, Tom Beck","<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
 sleep 12;
 [
 [
 ["Supporter","<t align = 'center' size = '0.7'>%1</t><br/>"],
 ["Peter Quill","<t align = 'center' size ='1'>%1</t><br/>"]
 ]
 ] spawn BIS_fnc_typeText;
};