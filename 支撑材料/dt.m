
function [a]=dt(x,y)
c=floor((x+1)/2);
d=floor((y+1)/2);
a=abs(c-d);
switch(a)
    case 0 
        a=0;
    case 1 
        a=10;
    case 2
        a=16;
    case 3
        a=23;
        
end

end