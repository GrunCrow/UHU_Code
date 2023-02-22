%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function Optimal_path=A_estrella(MAPA, delta)

% obtiene información de los obstáculos a partir del mapa 
% e introduce coordenadas de inicio y destino.
% Mapa es una imagen bmp y delta el tamaño de las celdas del grid 
% para realizar la busqueda, luego llama a la función principal que
% implementa el algoritmo A* 
% 21/12/15 FGB

f_handle=figure;
image(MAPA);
axis xy
grid on
hold on
set(gca,'xtick',[1:delta:700])
set(gca,'ytick',[1:delta:700])


%MAP stores the coordinates of the map and the 
%Objects in each coordinate

MAP_INI=(int8((MAPA(:,:,1))/255)*3)-1;

MAP=MAP_INI;

limites=size(MAP);

% The new simplified map 
MAPB=2*ones(floor(limites(1)/delta),floor(limites(2)/delta));

%Updating the simplified map
for m=0:(floor(limites(2)/delta))
    for h=0:(floor(limites(1)/delta))
        for  i=(m*delta)+1:(m*delta)+delta
            for  j=(h*delta)+1:((h*delta)+delta)
                if (i>limites(2)|j>limites(1))
                    break
                end
                if MAP(j,i)==-1;
                    MAPB(m+1,h+1)=-1;
                    break
                end
            
            end
           
        end

    end
end

%Writing stars on the origial map

limites2=size(MAPB);

for m=1:limites2(1)
    for h=1:limites2(2)
         if MAPB(m,h)==-1;
            plot(((m-1)*delta)+(delta/2),((h-1)*delta)+(delta/2),'*g');
            %drawnow
         end
    end
end


%The target
xlabel('Please Select the Vehicle initial position using the Left Mouse button','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end

xTarget=floor(xval/delta)+1;%X Coordinate of the Target
yTarget=floor(yval/delta)+1;%Y Coordinate of the Target

MAPB(xTarget,yTarget)=0;%Initialize MAP with location of the target
plot(xval,yval,'rd');
text(xval,yval,'Start');

%The initial position
xlabel('Please Select the Target ','Color','black');
but=0;
while (but ~= 1) %Repeat until the Left button is not clicked
    [xval,yval,but]=ginput(1);
end

xStart=floor(xval/delta)+1;%Starting Position
yStart=floor(yval/delta)+1;%Starting Position

MAPB(xStart,yStart)=1;
plot(xval,yval,'bo');
text(xval,yval,'Target');

tstart=tic;
   Optimal_path_original=Alg_estrella(MAPB, xStart, yStart, xTarget, yTarget); %llama al algoritmo
   Optimal_path_original=[Optimal_path_original;xStart, yStart]; %mete la configuración inicial
   Optimal_path=((Optimal_path_original-1)*delta)+(delta/2); %convierte los indices de las celdas 
                                                             %del mápa básico MAPB en índices de las celdas 
                                                             %del mapa original. Se le resta 1para devolver
                                                             %el origen al (0,0)
   
tfinal=toc(tstart) 

%plot(Optimal_path(:,1), Optimal_path(:,2))


end



function Optimal_path=Alg_estrella(MAP, xStart, yStart, xTarget, yTarget)

[MAX_X, MAX_Y]=size(MAP);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LISTS USED FOR ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OPEN LIST STRUCTURE
%--------------------------------------------------------------------------
%IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
% SI EL PRIMER EL PRIMER TÉRMINO ES 1 EL PUNTO ES FRONTERA.
% SI EL PRIMER EL PRIMER TÉRMINO ES 0 EL PUNTO ES FRONTERA.
%--------------------------------------------------------------------------
OPEN=[]; %lista para el arbol 
%CLOSED LIST STRUCTURE
%--------------
%X val | Y val |
%--------------
% CLOSED=zeros(MAX_VAL,2);
CLOSED=[];  %lista para los puntos interiores y los obstáculos

%Put all obstacles on the Closed list
k=1;%Dummy counter
for i=1:MAX_X
    for j=1:MAX_Y
        if(MAP(i,j) == -1);
            CLOSED(k,1)=i; 
            CLOSED(k,2)=j; 
            k=k+1;
        end
    end
end

CLOSED_COUNT=size(CLOSED,1); %núnero de elementos  en la lista de puntos interiores y obstáculo
%set the starting node as the first node
xNode=xStart;
yNode=yStart;
OPEN_COUNT=1; %cotador de la lista que contiene el arbol
path_cost=0;
goal_distance=distance(xNode,yNode,xTarget,yTarget);
OPEN(OPEN_COUNT,:)=insert_open(xNode,yNode,xNode,yNode,path_cost,goal_distance,goal_distance); 
%inserta el primer punto en la lista del arbol
OPEN(OPEN_COUNT,1)=0;
%lo clasifica com punto interior
CLOSED_COUNT=CLOSED_COUNT+1; %incrementa el contador de la lista de interiores
CLOSED(CLOSED_COUNT,1)=xNode; %incluye el primer punto en la lista de interiores
CLOSED(CLOSED_COUNT,2)=yNode; %incluye el primer punto en la lista de interiores
NoPath=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START ALGORITHM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while((xNode ~= xTarget || yNode ~= yTarget) && NoPath == 1)
%  plot(xNode+.5,yNode+.5,'go');

 exp_array=expand_array(xNode,yNode,path_cost,xTarget,yTarget,CLOSED,MAX_X,MAX_Y); %expande el vertice de mínimo peso
 exp_count=size(exp_array,1); %núero de vértices expandidos
 
 %UPDATE LIST OPEN WITH THE SUCCESSOR NODES
 %OPEN LIST FORMAT
 %--------------------------------------------------------------------------
 %IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
 % SI EL PRIMER EL PRIMER TÉRMINO ES 1 EL PUNTO ES FRONTERA.
 % SI EL PRIMER EL PRIMER TÉRMINO ES 0 EL PUNTO ES FRONTERA.
 %--------------------------------------------------------------------------
 %EXPANDED ARRAY FORMAT
 %--------------------------------
 %|X val |Y val ||h(n) |g(n)|f(n)|
 %--------------------------------
 for i=1:exp_count %se chequean los vértices expandidos
    flag=0; % esta bandera a cero significa que el vértice no está incluido en la lista OPEN
    for j=1:OPEN_COUNT %Mira dentro de la lista OPEN si el vértice ya está incluido
        if(exp_array(i,1) == OPEN(j,2) && exp_array(i,2) == OPEN(j,3) ) %Si está incluido: 
            OPEN(j,8)=min(OPEN(j,8),exp_array(i,5)); %escoge el menor peso 
            if OPEN(j,8)== exp_array(i,5) % si el menor peso es el recien calculado:
                %actualiza el punto  progenitor y los pesos gn,hn 
                OPEN(j,4)=xNode;
                OPEN(j,5)=yNode;
                OPEN(j,6)=exp_array(i,3);
                OPEN(j,7)=exp_array(i,4);
            end;%End of minimum fn check
            flag=1; %pone la bandera a 1: el punto ya estaba en la lista OPEN
        end;%End of node check

    end;%End of j for
    if flag == 0% si la bandera es 0 el punto no estab en la lista OPEN:
        OPEN_COUNT = OPEN_COUNT+1; %incrementa el puntero de OPEN
                                   % incluye el punto en la lista OPEN
        OPEN(OPEN_COUNT,:)=insert_open(exp_array(i,1),exp_array(i,2),xNode,yNode,exp_array(i,3),exp_array(i,4),exp_array(i,5));
     end;%End of insert new element into the OPEN list
 end;%End of i for
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %END OF WHILE LOOP
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %Busca el punto con menor peso en la lista OPEN 
  index_min_node = min_fn(OPEN,OPEN_COUNT,xTarget,yTarget);
  if (index_min_node ~= -1)    
   %Set xNode and yNode to the node with minimum fn
   xNode=OPEN(index_min_node,2);
   yNode=OPEN(index_min_node,3);
   path_cost=OPEN(index_min_node,6);%Update the cost of reaching the parent node
  %Move the Node to list CLOSED
  CLOSED_COUNT=CLOSED_COUNT+1;
  CLOSED(CLOSED_COUNT,1)=xNode;
  CLOSED(CLOSED_COUNT,2)=yNode;
  OPEN(index_min_node,1)=0;
  else
      %No path exists to the Target!!
      NoPath=0;%Exits the loop!
  end;%End of index_min_node check
end;%End of While Loop
%Once algorithm has run The optimal path is generated by starting of at the
%last node(if it is the target node) and then identifying its parent node
%until it reaches the start node.This is the optimal path

i=size(CLOSED,1);
Optimal_path=[];
xval=CLOSED(i,1);
yval=CLOSED(i,2);
i=1;
Optimal_path(i,1)=xval;
Optimal_path(i,2)=yval;
i=i+1;

if ( (xval == xTarget) && (yval == yTarget))
    inode=0;
   %Traverse OPEN and determine the parent nodes
   parent_x=OPEN(node_index(OPEN,xval,yval),4);%node_index returns the index of the node
   parent_y=OPEN(node_index(OPEN,xval,yval),5);
   
   while( parent_x ~= xStart || parent_y ~= yStart)
           Optimal_path(i,1) = parent_x;
           Optimal_path(i,2) = parent_y;
           %Get the grandparents:-)
           inode=node_index(OPEN,parent_x,parent_y);
           parent_x=OPEN(inode,4);%node_index returns the index of the node
           parent_y=OPEN(inode,5);
           i=i+1;
    end;

else
 Optimal_path=[];
 pause(1);
 h=msgbox('Sorry, No path exists to the Target!','warn');
 uiwait(h,5);
end %del if
end %de la función

function dist = distance(x1,y1,x2,y2)
dist=sqrt((x1-x2)^2 + (y1-y2)^2);
end

function exp_array=expand_array(node_x,node_y,hn,xTarget,yTarget,CLOSED,MAX_X,MAX_Y)
    %Function to return an expanded array
    %This function takes a node and returns the expanded list
    %of successors,with the calculated fn values.
    %The criteria being none of the successors are on the CLOSED list.
    %
    %   Copyright 2009-2010 The MathWorks, Inc.
    
    exp_array=[];
    exp_count=1;
    c2=size(CLOSED,1);%Number of elements in CLOSED including the zeros
    for k= 1:-1:-1
        for j= 1:-1:-1
            if (k~=j || k~=0)  %The node itself is not its successor
                s_x = node_x+k;
                s_y = node_y+j;
                if( (s_x >0 && s_x <=MAX_X) && (s_y >0 && s_y <=MAX_Y))%node within array bound
                    flag=1;                    
                    for c1=1:c2
                        if(s_x == CLOSED(c1,1) && s_y == CLOSED(c1,2))
                            flag=0;
                        end;
                    end;%End of for loop to check if a successor is on closed list.
                    if (flag == 1)
                        exp_array(exp_count,1) = s_x;
                        exp_array(exp_count,2) = s_y;
                        exp_array(exp_count,3) = hn+distance(node_x,node_y,s_x,s_y);%cost of travelling to node
                        exp_array(exp_count,4) = distance(xTarget,yTarget,s_x,s_y);%distance between node and goal
                        exp_array(exp_count,5) = exp_array(exp_count,3)+exp_array(exp_count,4);%fn
                        exp_count=exp_count+1;
                    end%Populate the exp_array list!!!
                end% End of node within array bound
            end%End of if node is not its own successor loop
        end%End of j for loop
    end%End of k for loop  
end

function new_row = insert_open(xval,yval,parent_xval,parent_yval,hn,gn,fn)
%Function to Populate the OPEN LIST
%OPEN LIST FORMAT
%--------------------------------------------------------------------------
%IS ON LIST 1/0 |X val |Y val |Parent X val |Parent Y val |h(n) |g(n)|f(n)|
%-------------------------------------------------------------------------
%
%   Copyright 2009-2010 The MathWorks, Inc.
new_row=[1,8];
new_row(1,1)=1;
new_row(1,2)=xval;
new_row(1,3)=yval;
new_row(1,4)=parent_xval;
new_row(1,5)=parent_yval;
new_row(1,6)=hn;
new_row(1,7)=gn;
new_row(1,8)=fn;

end

function i_min = min_fn(OPEN,OPEN_COUNT,xTarget,yTarget)
%Function to return the Node with minimum fn
% This function takes the list OPEN as its input and returns the index of the
% node that has the least cost
%
%   Copyright 2009-2010 The MathWorks, Inc.

 temp_array=[];
 k=1;
 flag=0;
 goal_index=0;
 for j=1:OPEN_COUNT
     if (OPEN(j,1)==1)
         temp_array(k,:)=[OPEN(j,:) j]; %#ok<*AGROW>
         if (OPEN(j,2)==xTarget && OPEN(j,3)==yTarget)
             flag=1;
             goal_index=j;%Store the index of the goal node
         end;
         k=k+1;
     end;
 end;%Get all nodes that are on the list open
 if flag == 1 % one of the successors is the goal node so send this node
     i_min=goal_index;
 end
 %Send the index of the smallest node
 if size(temp_array ~= 0)
  [min_fn,temp_min]=min(temp_array(:,8));%Index of the smallest node in temp array
  i_min=temp_array(temp_min,9);%Index of the smallest node in the OPEN array
 else
     i_min=-1;%The temp_array is empty i.e No more paths are available.
 end;
end

function n_index = node_index(OPEN,xval,yval)
    %This function returns the index of the location of a node in the list
    %OPEN
    %
    %   Copyright 2009-2010 The MathWorks, Inc.
    i=1;
    while(OPEN(i,2) ~= xval || OPEN(i,3) ~= yval )
        i=i+1;
    end;
    n_index=i;
end