function [adjacency,weightedAdjacency] = ComputeAdjacency(ROUTES,TravelLinkTime)
  listeStop={}; % create en empty list to remember the index attribuate to each stop
  sizeAdj = ComputeSizeAdj(ROUTES);% get the number of stop in routes
  adjacency=zeros(sizeAdj);% create an empty adjacency matrix
  weightedAdjacency = zeros(sizeAdj); % create an mepty weighted adjacency matrix
  for itinerary = 1:size(ROUTES,2)% for each itinerary
    [lastIndexStop,listeStop] = SearchIndex(listeStop,ROUTES{itinerary}{1});
    % what is index of the first stop of the itinerary
    for stop = 2:size(ROUTES{itinerary},2)
      %for each following stop in the itinerary
      [indexStop,listeStop] = SearchIndex(listeStop,ROUTES{itinerary}{stop});
      % get the index of this stop
      adjacency(lastIndexStop,indexStop) = 1;
      % fill the adjacency matrix
      weightedAdjacency(lastIndexStop,indexStop) = TravelLinkTime{itinerary}{stop-1};
      % fill the weighted adjacency matrix
      lastIndexStop=indexStop;
      % this stop will be the previous stop
    endfor
  endfor
endfunction