function [shortestPath, cost] = dijkstra(adjacency, o, d)
n = length(adjacency);
visited(1:n) = false;
distance(1:n) = inf;
distance(o) = 0;
path(1:n) = 0;

for i = 1:(n-1),
    list = [];
    for h = 1:n,
         if visited(h) == false
             list=[list distance(h)];
         else
             list=[list inf];
         end
     end;
     [_, posmin] = min(list); %posmin = la position du min
     visited(posmin) = true; %posmin est maintenant visité
     for neig = 1:n, %ici on applique la formule théorique de Dijkstra
         if ((adjacency(posmin, neig)+distance(posmin))< distance(neig))
             distance(neig) = distance(posmin) + adjacency(posmin, neig);
             path(neig) = posmin;
         end;             
     end;
end;

shortestPath = [];
Prev = [1:n];
Next = [1:n];
if path(d) ~= 0
    t = d;
    shortestPath = [d];
    while t ~= o
        shortestPath = [path(t) shortestPath];
        if adjacency(t, Prev(t)) < adjacency(t, path(t))
            Prev(t) = path(t);
        end;
        if adjacency(path(t), Next(path(t))) < adjacency(path(t), t)
            Next(path(t)) = t;
        end;

        t = path(t);      
    end;
end;

cost = distance(d);
