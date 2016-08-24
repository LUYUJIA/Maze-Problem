% slove maze problem based on reinforcement learning(epsilon-greedy Q-learning)
%
%  author: luyujia

%initial
maze=[1 1 1 1 1 1 1 1 1 1 1 1;
    1 0 0 1 0 0 0 0 0 0 0 1;
    1 0 0 1 0 1 0 0 1 1 0 1;
    1 1 0 1 0 1 1 1 1 0 0 1;
    1 0 0 0 0 0 1 0 0 0 0 1;
    1 0 0 0 0 0 1 0 0 0 0 1;
    1 1 1 1 1 0 1 0 1 0 0 1;
    1 0 0 0 0 0 1 0 1 0 0 1;
    1 0 1 1 1 1 1 0 1 0 0 1;
    1 0 0 0 0 1 0 0 1 0 0 1;
    1 0 0 1 0 0 0 0 1 0 2 1;
    1 1 1 1 1 1 1 1 1 1 1 1];

epsilon=1; gama=0.95; alpha=0.3;
step_data=zeros(1,200);
R=ones(144,144);
R=R.*(-1);
Q=zeros(144,144);

%create reward matrix R
for i=1:144
    if maze(i)==0
        if maze(i-12)==0 %¶
            R(i,i-12)=0;
        elseif maze(i-12)==2
            R(i,i-12)=1;
        end
        if maze(i+12)==0 %‰E
            R(i,i+12)=0;
        elseif maze(i+12)==2
            R(i,i+12)=1;
        end
        if maze(i-1)==0 %ã
            R(i,i-1)=0;
        elseif maze(i-12)==2
            R(i,i-1)=1;
        end
        if maze(i+1)==0  %‰º
            R(i,i+1)=0;
        elseif maze(i+1)==2
            R(i,i+1)=1;
        end
    end
end




%-----------------main-------------
for i=1:200
    disp(i);
    position=[2 2];
    if i>5
        epsilon=0.2;
    end
    while maze(position(1),position(2))~=2
        %policy----
        temp_x=-1;
        temp_y=-1;
        
        if rand > epsilon
            temp_Q=-100;
            if maze(position(1)-1,position(2))==0||maze(position(1)-1,position(2))==2 %ã
                if Q(transform(position(1),position(2)),transform(position(1)-1,position(2)))>temp_Q
                    temp_Q=Q(transform(position(1),position(2)),transform(position(1)-1,position(2)));
                    temp_x=position(1)-1;
                    temp_y=position(2);
                end
            end
            if maze(position(1)+1,position(2))==0||maze(position(1)+1,position(2))==2 %‰º
                if Q(transform(position(1),position(2)),transform(position(1)+1,position(2)))>temp_Q
                    temp_Q=Q(transform(position(1),position(2)),transform(position(1)+1,position(2)));
                    temp_x=position(1)+1;
                    temp_y=position(2);
                end
            end
            if maze(position(1),position(2)-1)==0||maze(position(1),position(2)-1)==2 %¶
                if Q(transform(position(1),position(2)),transform(position(1),position(2)-1))>temp_Q
                    temp_Q=Q(transform(position(1),position(2)),transform(position(1),position(2)-1));
                    temp_x=position(1);
                    temp_y=position(2)-1;
                end
            end
            if maze(position(1),position(2)+1)==0||maze(position(1),position(2)+1)==2 %‰E
                if Q(transform(position(1),position(2)),transform(position(1),position(2)+1))>temp_Q
                    temp_Q=Q(transform(position(1),position(2)),transform(position(1),position(2)+1));
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
  %---------------Q learning-----------------------
        
        %update Q 
        Q(transform(position(1),position(2)),transform(temp_x,temp_y))=Q(transform(position(1),position(2)),transform(temp_x,temp_y))+alpha*(R(transform(position(1),position(2)),transform(temp_x,temp_y))+gama...
            *max(Q(transform(temp_x,temp_y),:))-Q(transform(position(1),position(2)),transform(temp_x,temp_y)));
        
        %update position and step
        position(1)=temp_x;
        position(2)=temp_y;
        step_data(1,i)=step_data(1,i)+1;
    end
    
    
end