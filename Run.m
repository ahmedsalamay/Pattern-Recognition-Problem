function [ Result ] = Run( Img )

[centrs names] = StartTrain();
Img = im2bw (Img ) ;
Dis  =TestMyCode(Img);
size(centrs)
[element indxs] = min (Dis);
s = ( names(:,indxs) ) ;
Result = s ;
disp( ' Test  Done ...  ' );
if (s<=10   && s >=1)
    disp ( 'Result :  Zero  ' )
    
end
if (s<=20   && s >=11)
    disp ( 'Result :  One  ' )
    
end
if (s<=30   && s >=21)
    disp ( 'Result :  Two  ' )
    
end
if (s<=40   && s >=31)
    disp ( 'Result :  Three ' )
    
end
if (s<=50   && s >=41)
    disp ( 'Result :  Four ' )
    
end
if (s<=60   && s >=51)
    disp ( 'Result :  Five  ' )
end 
if (s<=70   && s >=61)
    disp ( 'Result :  Six  ' )
end 
if (s<=80   && s >=71)
    disp ( 'Result :  Seven ' )
end 
if (s<=90   && s >=81)
    disp ( 'Result :  Eight ' )
end 
if (s<=100   && s >=91)
    disp ( 'Result :  Nine  ' )
end 
    
    
    
    
end 


