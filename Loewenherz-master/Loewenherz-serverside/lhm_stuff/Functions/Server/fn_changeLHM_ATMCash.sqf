#include <macro.h> 
#define DEBUG 
 
Private ["_oldvalue","_addorremove","_amount","_reason","_newvalue","_index","_tempATMVar1","_tempATMVar2","_tempATMVar3"]; 
_oldvalue = param [0,0,[0]]; 
if (isNil "LHM_ATMCASH_CACHE_VAR") then { 
 LHM_ATMCASH_CACHE_VAR = _oldvalue; 
}; 
_addorremove = param [1,false,[false]]; 
_amount = param [2,0,[0]]; 
_reason = param [3,"",[""]]; 
_newvalue = _oldvalue; 
if(_addorremove) then { 
 _amount = 0 + _amount; 
  
} else { 
 _amount = 0 - _amount; 
};  
_newvalue = _oldvalue + _amount; 
LHM_ATMCASH_CACHE_VAR = LHM_ATMCASH_CACHE_VAR + _amount; 
LHM_ATMCASH_CACHE_VAR = _newvalue; 
_newvalue 
 
