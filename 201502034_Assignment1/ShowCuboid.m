function res = ShowCuboid(x,y,z,len,wid,hei,xangle,yangle,zangle)
    cuboid = [];
    cuboid = [cuboid,[x;y;z]];
    cuboid = [cuboid,[x+wid;y;z]];
    cuboid = [cuboid,[x;y+hei;z]];
    cuboid = [cuboid,[x;y;z+len]];
    cuboid = [cuboid,[x+wid;y+hei;z]];
    cuboid = [cuboid,[x;y+hei;z+len]];
    cuboid = [cuboid,[x+wid;y;z+len]];
    cuboid = [cuboid,[x+wid;y+hei;z+len]];
    
    rotMat = rotx(xangle)*roty(yangle)*rotz(zangle);
    rot1 = rotMat*cuboid;
  
    edges = [1,2 ; 1,3 ; 1,4 ; 2,5 ; 2,7 ; 3,6 ; 3,5 ; 4,6 ; 4,7 ; 5,8 ; 6,8 ; 7,8];
    hold on;
    
    for i=1:size(edges,1)
        if i==1
            p1 = plot3(cuboid(1,[edges(i,1),edges(i,2)]),cuboid(2,[edges(i,1),edges(i,2)]),cuboid(3,[edges(i,1),edges(i,2)]), ...
                'LineWidth', 2, 'Color','green');
        else
            plot3(cuboid(1,[edges(i,1),edges(i,2)]),cuboid(2,[edges(i,1),edges(i,2)]),cuboid(3,[edges(i,1),edges(i,2)]), ...
                'LineWidth', 2, 'Color','green');
        end
    end

    for i=1:size(edges,1)
        if i==1
            p2 = plot3(rot1(1,[edges(i,1),edges(i,2)]),rot1(2,[edges(i,1),edges(i,2)]),rot1(3,[edges(i,1),edges(i,2)]), ...
                'LineWidth', 2, 'Color','blue');
        else
            plot3(rot1(1,[edges(i,1),edges(i,2)]),rot1(2,[edges(i,1),edges(i,2)]),rot1(3,[edges(i,1),edges(i,2)]), ...
                'LineWidth', 2, 'Color','blue');
        end
    end
    
    xlabel('X-Axis');
    ylabel('Y-Axis');
    zlabel('Z-Axis');
    title('Rotation Transformations on Cuboid');
    legend([p1 p2],{'Initial Position','Final Position'});
    
    res = rot1;
end