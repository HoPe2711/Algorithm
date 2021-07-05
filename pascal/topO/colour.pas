uses math;
var next,ke:array[-200..200] of longint;
    head,dd:Array[0..200] of longint;
    n,res:longint;
    free:array[1..100] of boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var i,x,k,j:longint;
begin
 k:=0;
 read(n);
 for j:=1 to 2 do
 for i:=1 to n do
  begin
   read(x);
   if dd[x]=0 then dd[x]:=i
   else
    begin
     inc(k);
     add(k,dd[x],i)
    end;
  end;
end;
procedure DFS(u:longint);
var v,j:longint;
begin
 free[u]:=false;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v] then DFS(v);
   j:=next[j];
  end;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    DFS(i);
   end;
 write(2**res);
end;
begin
 assign(input,'COLOUR.inp');reset(input);
 assign(output,'COLOUR.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
