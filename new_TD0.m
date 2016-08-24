% slove maze problem based on reinforcement learning(epsilon-greedy TD0)
%
%  author: luyujia

%initial
maze=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1;
      1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 1 0 0 1;
      1 0 0 1 0 1 0 0 0 0 1 1 0 1 0 0 1 1 0 1;
      1 1 0 1 0 1 0 0 0 1 1 1 0 0 0 0 0 0 0 1;
      1 1 0 1 0 0 0 0 0 1 0 0 0 0 1 1 1 1 0 1;
      1 0 0 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 1;
      1 1 1 1 1 0 1 0 1 0 1 0 0 0 1 1 1 0 1 1;
      1 0 0 0 0 0 1 0 1 0 0 0 0 0 1 1 1 0 1 1;
      1 0 1 1 1 1 1 0 1 0 1 0 1 0 1 1 1 0 1 1;
      1 0 0 0 0 1 0 0 1 0 0 1 1 0 0 0 1 0 0 1;
      1 0 0 1 0 0 0 0 1 0 0 1 0 0 0 1 1 0 1 1;
      1 0 0 1 0 0 0 1 1 1 0 1 1 0 1 1 1 0 1 1;
      1 0 0 1 1 0 0 0 0 1 0 1 0 0 0 1 1 0 0 1;
      1 0 1 1 1 0 0 1 0 1 0 1 0 0 0 0 1 0 0 1;
      1 0 1 1 1 0 0 1 0 1 0 1 0 0 1 0 1 0 1 1;
      1 0 0 1 1 0 0 1 0 1 0 1 0 0 1 0 1 0 0 1;
      1 1 0 1 0 0 0 1 0 1 0 1 0 1 1 0 1 0 1 1;
      1 1 0 1 1 0 1 0 0 1 0 1 0 1 1 0 0 0 0 1;
      1 0 0 0 0 0 1 0 0 0 0 1 0 1 1 1 1 0 2 1;
      1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

epsilon=1; gama=0.95; alpha=0.3;
step_data1=zeros(1,200);
V=zeros(20,20);

for i=1:200
    disp(i);
    position=[2 2];
    if i>10
        epsilon=0.2;
    end
    while maze(position(1),position(2))~=2
        %policy
        temp_x=-1;
        temp_y=-1;
        
        if rand > epsilon
            temp_V=-100;
            if maze(position(1)-1,position(2))==0||maze(position(1)-1,position(2))==2
                if V(position(1)-1,position(2))>temp_V
                    temp_V=V(position(1)-1,position(2));
                    temp_x=position(1)-1;
                    temp_y=position(2);
                end
            end
            if maze(position(1)+1,position(2))==0||maze(position(1)+1,position(2))==2
                if V(position(1)+1,position(2))>temp_V
                    temp_V=V(position(1)+1,position(2));
                    temp_x=position(1)+1;
                    temp_y=position(2);
                end
            end
            if maze(position(1),position(2)-1)==0||maze(position(1),position(2)-1)==2
                if V(position(1),position(2)-1)>temp_V
                    temp_V=V(position(1),position(2)-1);
                    temp_x=position(1);
                    temp_y=position(2)-1;
                end
            end
            if maze(position(1),position(2)+1)==0||maze(position(1),position(2)+1)==2
                if V(position(1),position(2)+1)>temp_V
                    temp_V=V(position(1),position(2)+1);
                    temp_x=position(1);
                    temp_y=position(2)+1;
                end
            end
        else
            while temp_x==-1
                num=ceil(rand*4);
                switch num
                    case 1
                        if maze(position(1)-1,position(2))==0||maze(position(1)-1,position(2))==2
                            temp_x=position(1)-1;
                            temp_y=position(2);
                        end
                    case 2
                        if maze(position(1)+1,position(2))==0||maze(position(1)+1,position(2))==2
                            temp_x=position(1)+1;
                            temp_y=position(2);
                        end
                    case 3
                        if maze(position(1),position(2)-1)==0||maze(position(1),position(2)-1)==2
                            temp_x=position(1);
                            temp_y=position(2)-1;
                        end
                    case 4
                        if maze(position(1),position(2)+1)==0||maze(position(1),position(2)+1)==2
                            temp_x=position(1);
                            temp_y=position(2)+1;
                        end
                end
            end
        end
%---------------TD0-----------------
        %reward
        
        if maze(temp_x,temp_y)==2
            r=1;
        else
            r=0;
        end
        
        %update value function
        V(position(1),position(2))=V(position(1),position(2))+alpha*(r+gama...
            *V(temp_x,temp_y)-V(position(1),position(2)));
        
        %update position and step
        position(1)=temp_x;
        position(2)=temp_y;
        step_data1(1,i)=step_data1(1,i)+1;
    end
    
    
end

