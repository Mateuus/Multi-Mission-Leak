 
 
 
 
 
 
A3Log = { 
private["_type","_message"]; 
_message = param [0,""]; 
_type = param [1,""]; 
_return = ""; 
if(_type != "") then { 
_return = "A3Log" callExtension (_type + toString[31] + _message); 
} else { 
_return = "A3Log" callExtension _message; 
}; 
_return 
}; 
 
 
"sendlogfile" addPublicVariableEventHandler {(_this select 1) call A3Log;};