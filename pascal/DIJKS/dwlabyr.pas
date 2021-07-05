uses math;
const oo=1000000000000000;
var n,m,q:longint;
    free:array[0..400] of longint;
    d:Array[0..400,0..400] of int64;
procedure nhap;
var i,j,u,v,c:longint;
begin
 readln(n,m,q);
 for i:=1 to n do
  for j:=1 to n do d[i,j]:=oo;
 for i:=1 to n do d[i,i]:=0;
 for i:=1 to m do
  begin
   readln(u,v,c);
   d[u,v]:=min(d[u,v],c);
  end;
end;
procedure xuli;
var i,j,k,p,s,t:longint; x:char;
begin
 for i:=1 to q do
  begin
   read(x);
   if x='X' then
    begin
     readln(p);
     if free[p]=0 then
      begin
       free[p]:=1;
       for j:=1 to n do
        for k:=1 to n do
          if (d[j,k]>d[j,p]+d[p,k]) then d[j,k]:=d[j,p]+d[p,k];
      end;
    end
   else
    begin
     readln(s,t);
     if (d[s,t]<>oo) and  (free[s]=1) and (free[t]=1) then writeln(d[s,t])
     else writeln(-1);
    end;
   //readln;
  end;
end;
begin
 assign(input,'dwlabyr.inp');reset(input);
 assign(output,'dwlabyr.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
