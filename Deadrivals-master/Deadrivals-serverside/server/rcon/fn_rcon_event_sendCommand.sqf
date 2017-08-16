private["_command","_password","_return"]; 
_command = _this; 
_password = getText(configFile >> "CfgSettings" >> "RCON" >> "serverPassword"); 
if(_password isEqualTo "")then{_password = "empty";};  
_return = _password serverCommand _command; 
_return