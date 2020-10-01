[top]
components : nodes

[nodes]
type : cell
dim : (20, 20, 2)
delay : transport
defaultDelayTime  : 100
border : nowrapped

neighbors : 					      nodes(-2,0,0)
neighbors : 			 nodes(-1,-1,0) nodes(-1,0,0)  nodes(-1,1,0)
neighbors : nodes(0,-2,0)  nodes(0,-1,0)  nodes(0,0,0)   nodes(0,1,0) nodes(0,2,0) 
neighbors : 			 nodes(1,-1,0)  nodes(1,0,0)   nodes(1,1,0) 
neighbors :                           nodes(2,0,0) 
neighbors : 					      nodes(-2,0,-1)
neighbors : 			 nodes(-1,-1,-1) nodes(-1,0,-1)  nodes(-1,1,-1)
neighbors : nodes(0,-2,-1)  nodes(0,-1,-1)  nodes(0,0,-1)   nodes(0,1,-1) nodes(0,2,-1) 
neighbors : 			 nodes(1,-1,-1)  nodes(1,0,-1)   nodes(1,1,-1) 
neighbors :                           nodes(2,0,-1) 

initialvalue : 0
initialCellsValue : nodes.val
localtransition : move

[move]

rule : { round(uniform(1,8))}   100		{(0,0,0)=0 and (0,1,0)=5 }
rule : { round(uniform(1,8))}	100  	{(0,0,0)=0 and (-1,1,0)=6}
rule : { round(uniform(1,8))}	100     {(0,0,0)=0 and (-1,0,0)=7}
rule : { round(uniform(1,8))} 	100		{(0,0,0)=0 and (-1,-1,0)=8}
rule : { round(uniform(1,8))} 	100  	{(0,0,0)=0 and (0,-1,0)=1 }
rule : { round(uniform(1,8))} 	100		{(0,0,0)=0 and (1,-1,0)=2 }
rule : { round(uniform(1,8))} 	100		{(0,0,0)=0 and (1,0,0)=3 }
rule : { round(uniform(1,8))} 	100  	{(0,0,0)=0 and (1,1,0)=4 }

%self generate nodes
rule : { round(uniform(1,8))} 	100  	{(0,0,0)=0 and (uniform(0,1)< 0.009) }
%node exits
rule : 0 	100  	{(0,0,0)!=0 and (uniform(0,1)< 0.005) }

rule : 10 	100  	{(0,0,0)>0 and (0,0,0)<9 and (uniform(0,1)< 0.005) }
rule : { round(uniform(1,8))} 	100  	{(0,0,0)=9 and (uniform(0,1)< 0.90) }
%connectivity layer
rule : 11 0 {cellpos(2) = 1 and ((0,0,-1) >0 and (0,0,-1) < 9 ) 
						or     ( ((-2,0,-1)>0 and (-2,0,-1)<9)
								or ((-1,-1,-1)>0 and (-1,-1,-1)<9)  or ((-1,0,-1)>0 and (-1,0,-1)<9)
								or ((-1,1,-1)>0 and (-1,1,-1)<9)    or ((0,-2,-1)>0 and (0,-2,-1)<9)
								or ((0,-1,-1)>0 and  (0,-1,-1)<9)   or ((0,1,-1)>0 and (0,1,-1)<9)
								or ((0,2,-1)>0 and (0,2,-1)<9)     or ((1,-1,-1) >0 and (1,-1,-1)<9)
								or ((1,0,-1)>0 and (1,0,-1)<9)		or ((1,1,-1) >0 and (1,1,-1)<9)
								or ((2,0,-1) >0 and (2,0,-1)<9)
							) }
rule : 10 0 {cellpos(2) = 1 and ((0,0,-1) >0 and (0,0,-1) < 9)}
rule : 0 0 {cellpos(2) = 1 and t}


%border
rule : { round(uniform(1,2))}  100	{((0,0,0)= 4 or (0,0,0)=5 or (0,0,0)=6 )and (-1,-1,0)=? and (0,-1,0)=? and (1,-1,0)=?}
rule : { round(uniform(3,7))}  100	{((0,0,0)= 1 or (0,0,0)=2 or (0,0,0)=8 )and (-1,1,0)=? and (0,1,0)=? and (1,1,0)=?}
rule : { round(uniform(5,8))}  100	{((0,0,0)= 2 or (0,0,0)=3 or (0,0,0)=4 )and (-1,-1,0)=? and (-1,0,0)=? and (-1,1,0)=?}
rule : { round(uniform(1,5))}  100	{((0,0,0)= 6 or (0,0,0)=7 or (0,0,0)=8 )and (1,-1,0)=? and (1,0,0)=? and (1,1,0)=?}

rule : 0 100 {t}