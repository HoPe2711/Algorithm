uses math;
const oo=1000000000;
var ke,next,head,ts,d:array[0..1000] of longint;
    k,p,c,f,s,res:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,tt,dd:longint;
begin
 read(k,p,c,f,s);
 for i:=1 to p do
  begin
   read(u,v);
   add(i,u,v,-k);
  end;
 dd:=p;
 for i:=1 to f do
  begin
   read(u,v,tt);
   inc(dd);
   add(dd,u,v,tt-k);
  end;
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to c do d[i]:=oo;
 d[s]:=-k;
end;
procedure BF;
var i,j,u,v:longint;
    stop:boolean;
begin
 for i:=1 to c+1 do
  begin
   stop:=true;
   if i=c+1 then
    begin
     writeln(-1);
     exit;
    end;
   for u:=1 to c do
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
  res:=oo;
  for i:=1 to c do res:=min(res,d[i]);
  write(-res);
end;
begin
 assign(input,'job.inp');reset(input);
 assign(output,'job.out');rewrite(output);
 nhap;
 khoitao;
 BF;
 close(input);close(output);
end.