scriptName "fn_displayText";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_displayText.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_displayText.sqf"

disableSerialization;

4999 cutRsc ["maverick_dialog_tuning_text","PLAIN"];

_display = uiNamespace getVariable ["maverick_dialog_tuning_text",displayNull];
_ctrl = _display displayCtrl 0;

_ctrl ctrlSetStructuredText parseText (param[0,"",[""]]);