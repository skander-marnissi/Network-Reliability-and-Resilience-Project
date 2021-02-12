function rnode = Rnode(adjacency)

nodes = length(adjacency)
rnode = []
for o = 1:nodes
  r = 0
  for d = 1:nodes
   if d ~= o
      r = r + Rod(adjacency, o, d)
   endif
  endfor
rnode(end+1)= 1/(nodes-1)*r
endfor

save('Reliability.mat','rnode','-append')
endfunction
