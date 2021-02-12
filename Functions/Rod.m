function rod = Rod(adjacency,o,d)
[pb, pth] = probabilityF(adjacency, o,d)
E = []
nbArc = length(pth)

if nbArc>0
for (i=1:nbArc)
    nodes = size(pth(1,i){1},2)
    E(i)= probabilityF(adjacency, o,d)**(nodes-1)
endfor

D = ones(1, length(E))
D(1) = E(1)

for k=2:length(E)
  D(k) = E(k)
  for i=1:k-1
    D(k) = D(k) * (1-E(i))
  endfor
endfor

rod = sum(D)
else
rod = 0
endif
endfunction
