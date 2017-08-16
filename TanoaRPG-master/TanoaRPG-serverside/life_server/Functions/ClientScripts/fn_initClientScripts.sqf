/* 
 File: fn_initClientScripts.sqf 
 Author: CooliMC 
  
 Description: Version 1.0 DONT STEEL MY SCRIPTS ANYMORE FUCKING EISENSCHMIEDE ;( 
*/ 
private["_scripts","_path","_filename"]; 
_scripts = []; 
 
_scripts = [] call TEX_fnc_ClientScriptsConfig; 
if((count _scripts) == 0) exitWith {}; 
 
{ 
 _scriptname = [_x, 0, "", [""]] call BIS_fnc_param; 
 _filename = [_x, 1, "", [""]] call BIS_fnc_param; 
 _path = [_x, 2, "", [""]] call BIS_fnc_param; 
  
 if((_scriptname != "") && (_filename != "") && (_path != "")) then 
 { 
  _script = loadFile (_path + _filename); 
  _script = [_script] call TEX_fnc_FileWithoutComments; 
  _tocompile = format['%1 = {%2}; publicVariable "%1"', _scriptname, _script]; 
  [] call compile _tocompile; 
 } else { 
  [[-1, "SERVER"], [-1, "SERVER"], 4, "[ScriptInit]", "Fehler in bei der Script Initialisierung"] spawn TEX_fnc_logIt; 
 }; 
} forEach _scripts;