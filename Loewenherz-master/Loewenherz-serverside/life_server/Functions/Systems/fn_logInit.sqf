/* 
    Author: Blackd0g 
    File: fn_logInit.sqf 
 
    Description: 
    Inits the extDB logs 
 
*/ 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:GENERAL:general"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ERROR:error"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:MONEY:money"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:KILLS:kills"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:MESSAGES:messages"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:VEHICLE:vehicle"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:SPY:spyglass"; 
"extDB2" callExtension "9:ADD_PROTOCOL:LOG:ADMIN:admin"; 
 
diag_log "extDB2: Adding Logfile Protocols"; 
true