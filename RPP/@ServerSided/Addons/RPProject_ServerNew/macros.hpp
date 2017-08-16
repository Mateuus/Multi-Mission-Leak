#define CONSTVAR(var) var = compileFinal (if(var isEqualType "") then {var} else {str(var)})
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define FETCH_CONST(var) (call var)
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)
#define EXTDB "extDB2" callExtension
#define CONST(var1,var2) var1 = compileFinal (if(var2 isEqualType "") then {var2} else {str(var2)})