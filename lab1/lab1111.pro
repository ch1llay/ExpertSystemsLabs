domains 
    edgeType = edgeType(symbol,symbol)
    cycleT = edgeType*
  predicates
  edge(symbol,symbol)
  nondeterm euler(symbol,symbol,integer,cycleT,cycleT)
  nondeterm get(edgeType)
  len(cycleT,integer)
  has(edgeType,cycleT)
  nondeterm way(symbol,symbol)

clauses
  euler(A,A,1,Cycle,Cycle):-!.
  euler(A,B,Len,Stack,Cycle):-
    way(B,C),not(has(edgeType(B,C),Stack)),Len1=Len-1,
    euler(A,C,Len1,[edgeType(B,C)|Stack],Cycle).
 
get(edgeType(A,B)):-edge(A,B).
 
len([_|Edges],Len):-!,len(Edges,Len1),Len=Len1+1.
len([],0).
 
has(Edge,[Edge|_]):-!.
has(edgeType(A,B),[edgeType(B,A)|_]):-!.
has(Edge,[_|Way]):-has(Edge,Way).
 
way(A,B):-edge(A,B).
way(A,B):-edge(B,A).

 
%edge(a,b).
%edge(a,c).
%edge(a,d).
%edge(a,e).
%edge(a,f).
%edge(a,h).
%edge(b,c).
%edge(d,e).
%edge(f,h).

edge(a, b).
edge(b, c).
edge(a, d).
edge(c, d).

goal
  findall(Edge,get(Edge),Edges),
  len(Edges,Len),
  edge(A,B),
  euler(A,B,Len,[edgeType(A,B)],Cycle),
  write(Cycle).