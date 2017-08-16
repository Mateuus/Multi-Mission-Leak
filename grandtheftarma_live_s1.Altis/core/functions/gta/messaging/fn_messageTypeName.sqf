/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_type";
_type = [ _this, 0, 0, [0] ] call GTA_fnc_param;

[ "Message", "Police Dispatch", "NATO Dispatch", "Paramedic Dispatch", "HATO Dispatch", "Public Announcement", "Vicinity", "Staff Request", "Staff Announcement" ] select _type
