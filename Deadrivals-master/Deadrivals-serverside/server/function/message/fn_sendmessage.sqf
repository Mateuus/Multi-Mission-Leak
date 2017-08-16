while{true} do { 
sleep 600; 
_query = "SELECT message FROM messagesystem"; 
 
_queryresult = [_query,2,true] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_ATAC_MESSAGE = (_queryresult select 0) select 0; 
publicVariable "NOCRIS_ATAC_MESSAGE"; 
 
if (NOCRIS_ATAC_MESSAGE != "") then { 
[format["%1",NOCRIS_ATAC_MESSAGE],"ATAC Nachrichtendienst",12] remoteExec ["GUI_fnc_requestmessage",0]; 
}; 
};