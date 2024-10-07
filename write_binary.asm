
.ORIG x3000
 
 TRAP x29                     


AND R6, R6, #0                
AND R5 , R5 , #0
ADD R6 , R6 , #1
LD R4 , NUM                  

LOOP                          
AND R5 , R5 , #0
LD R5 , NUMBER_TO_CONVERT      
AND R5 , R5 , R6               
BRnp ONE

ADD R0 , R0 , #1             
LD R3 , AIR_BLOCK              
TRAP x2C                     
BR CLOSE

ONE    
ADD R0 , R0 , #1              
LD R3 , STONE_BLOCK               

TRAP x2C                      

CLOSE

AND R3 , R3 , #0             
ADD R6 , R6 , R6             
ADD R4 , R4 , #-1            
BRp LOOP                     

HALT
NUMBER_TO_CONVERT .FILL #237
AIR_BLOCK .FILL #0              
STONE_BLOCK .FILL #1              
NUM .FILL #16                 

.END