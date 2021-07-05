const oo=1000000000;
var n,m:longint;
    ke,next,head,ts,d:array[0..250000] of longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[1]:=0;
end;
procedure BF;
var i,j,u,v:longint;
    stop:boolean;
begin
 for i:=1 to n+1 do
  begin
   stop:=true;
   if i=n+1 then
    begin
     write('Ciclu negativ!');
     exit;
    end;
   for u:=1 to n do
    begin
     j:=head[u];
     while j<>0 do
      begin
       v:=ke[j];
       if d[v]>d[u]+ts[j] then
        begin
         d[v]:=d[u]+ts[j];
         stop:=false;
        end;
       j:=next[j];
      end;
    end;
   if stop then break;
  end;
 for i:=2 to n do write(d[i],' ');
end;
begin
 assign(input,'bellmanford.inp');reset(input);
 assign(output,'bellmanford.out');rewrite(output);
 nhap;
 khoitao;
 BF;
 close(input);close(output);
end.
