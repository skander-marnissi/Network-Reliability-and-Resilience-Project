function rods = Rods(adjacency)
  rods = {} ; 
  nbRodes = length(adjacency)
  rnode = 0
  
  for o = 1:nbRodes
    for d = 1:nbRodes
      if d ~= o
        rods(end+1) = Rod(adjacency,o,d) ;
      endif
    endfor   
  endfor
save('Reliability.mat','rods','-append')
endfunction
