function res = LineIntersection(x11,y11,z11,x12,y12,z12,x21,y21,z21,x22,y22,z22)

    m1 = [x12-x11,y12-y11,z12-z11];
    m2 = [x22-x21,y22-y21,z22-z21];
    
    m = cross(m1,m2);

    d2 = (y21 - y11);
    d1 = (x21 - x11);

    my1 = (y12 - y11);
    my2 = (y22 - y21);
    mx1 = (x12 - x11);
    mx2 = (x22 - x21);
    mz1 = (z12 - z11);
    mz2 = (z22 - z21);

%     t1 = ((d2/my2) - (d1/mx2))/((my1/my2) - (mx1/mx2));
%     t2 = ((d2/my1) - (d1/mx1))/((mx2/mx1) - (my2/my1));

    t1 = (m(1) - m(2) + d2/my2 - d1/mx2)/(my1/my2 - mx1/mx2);
    t2 = (m(1) - m(2) + d2/my1 - d1/mx1)/(mx2/mx1 - my2/my1);

    a = [mx1*t1+x11,my1*t1+y11,mz1*t1+z11];
    b = [mx2*t2+x21,my2*t2+y21,mz2*t2+z21];

    x1 = [];
    y1 = [];
    z1 = [];
    x2 = [];
    y2 = [];
    z2 = [];
    
    for t = -10:10
        x1 = [x1,(x12-x11)*t+x11];
        y1 = [y1,(y12-y11)*t+y11];
        z1 = [z1,(z12-z11)*t+z11];
        
        x2 = [x2,(x22-x21)*t+x21];
        y2 = [y2,(y22-y21)*t+y21];
        z2 = [z2,(z22-z21)*t+z21];
    end    
    hold on;
    plot3(x1,y1,z1,'Color','blue');
    plot3(x2,y2,z2,'Color','red');
    plot3([a(1),b(1)],[a(2),b(2)],[a(3),b(3)],'LineWidth',2,'Color','black');
    legend('Line 1','Line 2','Common Normal');
    xlabel('X Axis');
    ylabel('Y Axis');
    zlabel('Z Axis');
    
    res = [a,b];
end