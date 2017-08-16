/* 
    File: fn_FileWithoutComments.sqf 
    Author: CooliMC 
     
    Description: 
    Holt die Comments aus den Texten 
*/ 
private["_input","_return","_InOut"]; 
_input = [_this,0,"",[""]] call BIS_fnc_param; 
_return = ""; 
_InOut = false; 
 
if((count _input) > 0) then 
{ 
 _input = (_input splitString (toString [13,10])); 
 
 { 
  _ds = (_X find "//"); 
  _ca = (_X find "/*"); 
  _ce = (_X find "*/"); 
 
  if(_ca != -1) then 
  { 
   _InOut = true; 
   if(_ca > 0) then 
   { 
    _return = (_return + ([_X, 0, (_ca-1)] call BIS_fnc_trimString)); 
   }; 
  } else { 
   if(_ce != -1) then 
   { 
    _inOut = false; 
    if((count _X) > 2) then 
    { 
     if(_ce < ((count _X) - 2)) then 
     { 
      _return = (_return + ([_X, (_ce + 2), ((count _X) - 1)] call BIS_fnc_trimString)); 
     }; 
    }; 
   } else { 
    if(!_InOut) then 
    { 
     if(_ds != -1) then 
     { 
      if(_ds > 0) then 
      { 
       _return = (_return + ([_X, 0, (_ds-1)] call BIS_fnc_trimString)); 
      }; 
     } else { 
      _return = _return + _X; 
     }; 
    }; 
   }; 
  }; 
 } forEach _input; 
}; 
 
_return;