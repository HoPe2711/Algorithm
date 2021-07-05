{$H+}
var n,m:longint;
    st:array[0..501] of string;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   readln(st[i]);
   for j:=1 to length(st[i]) do
    if st[i][j]='X' then b[i,j]:=1;
  end;
end;
function check(x,y,u,v:longint):longint;
begin
 exit(f[u,v]-f[x-1,v]-f[u,y-1]+f[x-1,y-1]);
end;
procedure xuli;
var i,j,k,minx,maxx,miny,maxy:longint;
begin
 for i:=1 to n do
  for j:=1 to m do f[i,j]:=f[i-1,j]+f[i,j-1]-f[i-1,j-1]+b[i,j];
 for k:=1 to m do
  begin
   ok:=true;
   for i:=1 to n do
    for j:=k to m do
     if (st[i,j]=st[i,j-k+1]) and (st[i,j]='X') then ok:=false;
   if ok=false then continue;
   minx:=501; maxx:=0; miny:=501; maxy:=0;
   for i:=1 to n do
    for j:=1 to k-1 do
    if st[i,j]='X' then
     begin
      minx:=min(minx,i);
      maxx:=max(maxx,i);
      miny:=min(miny,j);
      maxy:=max(maxy,j);
     end;
   for i:=1 to n do
    for j:=k to m do
     if st[i,j-k+1]='X' then
      begin
        minx:=min(minx,i);
        maxx:=max(maxx,i);
        miny:=min(miny,j);
        maxy:=max(maxy,j);
      end;
   if check(minx,miny,maxx,maxy)=(maxx-minx+1)*(maxy-miny+1) then
    begin
     writeln('YES');
     halt;
    end;
  end;
 for k:=1 to n do
  begin
   ok:=true;
   for j:=1 to m do
    for i:=k to n do
     if (st[i,j]=st[i,j-k+1]) and (st[i,j]='X') then ok:=false;
   if ok=false then continue;
   minx:=501; maxx:=0; miny:=501; maxy:=0;
   for j:=1 to m do
    for i:=1 to k-1 do
    if st[i,j]='X' then
     begin
      minx:=min(minx,i);
      maxx:=max(maxx,i);
      miny:=min(miny,j);
      maxy:=max(maxy,j);
     end;
   for j:=1 to m do
    for i:=k to n do
     if st[i,j-k+1]='X' then
      begin
        minx:=min(minx,i);
        maxx:=max(maxx,i);
        miny:=min(miny,j);
        maxy:=max(maxy,j);
      end;
   if check(minx,miny,maxx,maxy)=(maxx-minx+1)*(maxy-miny+1) then
    begin
     writeln('YES');
     halt;
    end;
  end;
 writeln('NO');
end;
begin
 assign(input,'b745.inp');reset(input);
 assign(output,'b745.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.