var n,m,sr:longint;
    a,k,g,f,next:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,m);
 sr:=trunc(sqrt(n));
 for i:=1 to n do
  begin
   read(a[i]);
   k[i]:=i div sr+(i mod sr);
  end;
end;
procedure fix(u,v:longint);
var i:longint;
begin
 for i:=v downto u do
  if i+a[i]>v then
   begin
    next[i]:=i+a[i];
    f[i]:=1;
    g[i]:=i;
   end
  else
   begin
    next[i]:=next[i+a[i]];
    g[i]:=g[i+a[i]];
    f[i]:=f[i+a[i]]+1;
   end;
end;
procedure xuli;
var i,x,y,l,dem,tt,qq:longint;
begin
  fix(1,n);
  for i:=1 to m do
   begin
    read(x);
    if x=1 then
     begin
      dem:=0;
      read(y);
      tt:=y;
      while tt<=n do
       begin
        inc(dem,f[tt]);
        qq:=g[tt];
        tt:=next[tt];
       end;
      writeln(qq,' ',dem);
     end
    else
     begin
      read(y,l);
      a[y]:=l;
      fix(y,k[y]*sr);
     end;
   end;
end;
begin
 assign(input,'spring.inp'); reset(input);
 assign(output,'spring.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.







{procedure xuli;
var  tt,x,y,kk,dem,i:longint;
begin
 for i:=1 to m do
  begin
   read(tt);
   if tt=0 then
    begin
     read(x,y);
     a[x]:=y;
    end;
   if tt=1 then
    begin
     dem:=0;
     read(x);
     while x<=n do
      begin
       kk:=x;
       x:=x+a[x];
       inc(dem);
      end;
     writeln(kk,' ',dem);
    end;
  end;
end;
                 }
