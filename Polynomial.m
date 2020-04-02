%a*x^(5)+b*x^(4)+c*x^(3)+d*x^(2)+e
function [f]= Polynomial(x,y,plo,degree)
switch degree
    case 1
        f= fit(x,y,'poly1');    %straight line
    case 2
        f= fit(x,y,'poly2');    %parabola
    case 3
        f= fit(x,y,'poly3');    %cubic
    case 4
        f= fit(x,y,'poly4');    
    case 5
        f= fit(x,y,'poly5');
    case 6
        f= fit(x,y,'poly6');
    case 7
        f= fit(x,y,'poly7');
    case 8
        f= fit(x,y,'poly8');
    case 9
        f= fit(x,y,'poly9');
end
if (plo==1)
    plot(f,'r')
    hold on
    plot(x,y,'bo')
end    
end