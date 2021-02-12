function range = Range(adjacency)
nodes = length(adjacency)
range = []

for o=1:nodes
    list= []
  for i=1:nodes
    if i~=o
       list(end+1) = Rod(adjacency, o, i);
    endif
  endfor
  
range(end+1) = abs(max(list)-min(list));
endfor

save('Reliability.mat','range','-append')
endfunction
