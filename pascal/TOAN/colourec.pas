uses math;
var n,res:longint;
    a:array[-200..200,-200..200] of longint;
    dem:array[0..4,0..4] of longint;
procedure nhap;
var i,x,y:longint;
begin
 read(n);
 for i:=1 to n do read(x,y,a[x,y]);
end;
procedure xuli;
var i,j,y:longint;
begin
 for i:=-200 to 199 do
  for j:=i+1 to 200 do
   begin
    fillchar(dem,sizeof(dem),0);
    y:=-200;
    while y<=200 do
     begin
      if (a[i,y]<>a[j,y]) and (a[i,y]*a[j,y]<>0) then inc(dem[min(a[i,y],a[j,y]),max(a[i,y],a[j,y])]);
      inc(y);
     end;
    res:=res+dem[1,2]*dem[3,4]+dem[1,3]*dem[2,4]+dem[1,4]*dem[2,3];
   end;
  write(res);
end;
begin
 nhap;
 xuli;
end.