/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Hud.sqf

Description:
Hud
*/
["RPP_Hud", {
  [] spawn {
      private ["_text","_line","_Cash","_bank","_Hunger","_thirst","_Weight","_maxWeight","_id","_health"];
   	 	1 cutRsc ["RPP_HudDialog", "PLAIN"];
   	 	disableSerialization;
   	 	_text = uiNameSpace getVariable ["RPP_HudDialog",displayNull];
		  _line = _text displayCtrl 1000;
    	while {true} do
    	{
    	    _Cash = [] call RPP_Lib_FormatNumber_Cash;
    		  _bank = [] call RPP_Lib_FormatNumber_Bank;
    		  _Hunger = RPP_Hunger;
    		  _thirst = RPP_Thirst;
    		  _Weight = RPP_Weight;
    		  _maxWeight = RPP_MaxWeight;
    		  _id = getPlayerUID player;
    		  _health = 100-(round((damage player) * 100));
       	 	_line ctrlSetStructuredText parseText format["
       	 	<t align='center'><t shadow='1'shadowColor='#000000'><t color='#08A300'>Cash: <t color='#68C900'>$%1 <t
       	 	color='#FFFFFF'>-<t color='#68C900'> Bank: $%2<t color='#FFFFFF'> - <t 
       	 	color='#ED9A00'>Weight: %3/%4 <t color='#FFFFFF'>-<t 
       	 	color='#40B6FF'> Health: %5/100 <t 
       	 	color='#FFFFFF'>-<t color='#D62B2B'> Hunger: %6/100 <t 
       	 	color='#FFFFFF'>-<t color='#E8E06F'> Thirst: %7/100</t> <t 
       	 	color='#FFFFFF'>-</t> <t 
       	 	color='#BD94C9'>UID: %8 </t>-</t> <t 
       	 	color='#BD94C9'> [Community website here] </t>",
       	 	_Cash,_bank,_Weight,_maxWeight,_health,_Hunger,_thirst,_id];
        	sleep 1;
      };
  };
}] call RPP_Function;
publicVariable "RPP_Hud";

["RPP_ProgressBar", {
  disableSerialization;
  private["_ui","_progress"];
  5 cutRsc ["RPP_ProgressBar","PLAIN"];
  _ui = uiNameSpace getVariable "RPP_ProgressBar";
  _progress = _ui displayCtrl 38201;
  _progress progressSetPosition 0.5;
}] call RPP_Function;
publicVariable "RPP_ProgressBar";