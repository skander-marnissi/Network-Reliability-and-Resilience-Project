function [pb, pth] = probabilityF(adjacency, o, d)
adjacency(adjacency==0)=Inf;
if o > size(adjacency,1) || d > size(adjacency,1)
    Paths=[];
else
    k=1;
    [path cost] = dijkstra(adjacency, o, d);
    if isempty(path)
        Paths=[];
    else
        pathNum = 1; 
        P{pathNum,1} = path; P{pathNum,2} = cost; 
        current_P = pathNum;
        size_X=1;  
        X{size_X} = {pathNum; path; cost};
        S(pathNum) = path(1);
        Paths{k} = path ;
        while (size_X ~= 0 )
            for i=1:length(X)
                if  X{i}{1} == current_P
                    size_X = size_X - 1;
                    X(i) = [];
                    break;
                end
            end
            P_ = P{current_P,1}; 
            w = S(current_P);
            for i = 1: length(P_)
                if w == P_(i)
                    w_index_in_path = i;
                end
            end
            for index_dev_vertex= w_index_in_path: length(P_) - 1   
                temp_adjacency = adjacency;
                for i = 1: index_dev_vertex-1
                    v = P_(i);
                    temp_adjacency(v,:)=inf;
                    temp_adjacency(:,v)=inf;
                end
                SP_sameSubPath=[];
                index =1;
                SP_sameSubPath{index}=P_;
                for i = 1: length(Paths)
                    if length(Paths{i}) >= index_dev_vertex
                        if P_(1:index_dev_vertex) == Paths{i}(1:index_dev_vertex)
                            index = index+1;
                            SP_sameSubPath{index}=Paths{i};
                        end
                    end            
                end       
                v_ = P_(index_dev_vertex);
                for j = 1: length(SP_sameSubPath)
                    next = SP_sameSubPath{j}(index_dev_vertex+1);
                    temp_adjacency(v_,next)=inf;   
                end
               
                sub_P = P_(1:index_dev_vertex);
                cost_sub_P=0;
                for i = 1: length(sub_P)-1
                    cost_sub_P = cost_sub_P + adjacency(sub_P(i),sub_P(i+1));
                end    
                [dev_p c] = dijkstra(temp_adjacency, P_(index_dev_vertex), d);
                if ~isempty(dev_p)
                    pathNum = pathNum + 1;
                    P{pathNum,1} = [sub_P(1:end-1) dev_p] ;
                    P{pathNum,2} =  cost_sub_P + c ;
                    S(pathNum) = P_(index_dev_vertex);
                    size_X = size_X + 1; 
                    X{size_X} = {pathNum;  P{pathNum,1} ;P{pathNum,2} };
                end      
            end
            if size_X > 0
                shortestXCost= X{1}{3};
                shortestX= X{1}{1};
                for i = 2 : size_X
                    if  X{i}{3} < shortestXCost
                        shortestX= X{i}{1};
                        shortestXCost= X{i}{3};
                    end
                end
                current_P = shortestX;
                k = k+1;
                Paths{k} = P{current_P,1};
            end
        end
    end
end 
pth = Paths
ls = {} ; 
if(size(Paths,2) >0 ) 
for  k =1:size(Paths,2) 
     for f = 1:(length(Paths{1,k})-1 ) 
    x= strcat(int2str(Paths{1,k}(f)),int2str(Paths{1,k}(f+1))) ; 
   
  ls(end+1)= x ; 
  endfor
endfor   
 v= length(unique(ls) );
 pb =1-(1/v)  
else 
 pb=0 
endif

endfunction

