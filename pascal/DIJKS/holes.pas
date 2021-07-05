const oo=1000000000;
var n,m,w,t,test:longint;
    ke,head,ts,next,d:array[-3000..3000] of longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c,dd:longint;
begin
 fillchar(next,sizeof(next),0);
 fillchar(head,sizeof(head),0);
 fillchar(ts,sizeof(ts),0);
 fillchar(ke,sizeof(ke),0);
 read(n,m,w);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
   add(-i,v,u,c);
  end;
 dd:=m;
 for i:=1 to w do
  begin
   read(u,v,c);
   inc(dd);
   add(dd,u,v,-c);
  end;
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do d[i]:=oo;
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
     writeln('YES');
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
  writeln('NO');
end;
begin
 assign(input,'holes.inp');reset(input);
 assign(output,'holes.out');rewrite(output);
 read(test);
 for t:=1 to test do
  begin
   nhap;
   khoitao;
   BF;
  end;
 close(input);close(output);
end.
