function sizeAdj = ComputeSizeAdj(ROUTES);
  listeStop = {};
  % create en empty list to remember the index attribuate to each stop
  for itinerary = 1:size(ROUTES,2)
    %for each itinerary in ROUTES
    for stop = 1:size(ROUTES{itinerary},2)
      %for each stop in the itinerary
      [~,listeStop] = SearchIndex(listeStop,ROUTES{itinerary}{stop});
      % call SearchIndex for each stop to construct listeStop
    endfor
  endfor
  sizeAdj=size(listeStop,2)
  % the adjacency matrice have the size of the number of different stop
endfunction