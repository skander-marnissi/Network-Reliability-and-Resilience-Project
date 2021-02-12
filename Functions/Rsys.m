function rsys = Rsys (adjacency)
nbNodes = length(adjacency);
list = Rods(adjacency);
somme = 0  ; 
  
for i = 1:length(list)
   somme=somme+list{i} ;
end 
  
rsys = 1/(nbNodes*(nbNodes-1))*somme ; 
save('Reliability.mat','rsys','-append')

endfunction
