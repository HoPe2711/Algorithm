uses math;
type
 node=record
 x,y:longint;
end;
var a:array[0..100000] of node;
    f:array[0..100000]of longint;
    res,n:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  with a[i] do read(x,y);
end;
procedure doicho(var x,y:node);
var
 tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure sort(l,r:longint);
var i,j,mid:longint;
begin
        i:=l;
        j:=r;
        mid:=l+random(r-l+1);
        repeat
         while (a[i].x<a[mid].x) or ((a[i].x=a[mid].x) and (a[i].y<a[mid].y)) do inc(i);
         while (a[j].x>a[mid].x) or ((a[j].x=a[mid].x) and (a[j].y>a[mid].y)) do dec(j);
         if i<=j then
          begin
           doicho(a[i],a[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
end;
procedure xuli;
var i,l:longint;
begin
 sort(1,n);
 l:=low(longint);
 for i:=1 to n do
  if (a[i].x>=l)   then
   begin
    l:=a[i].y;
    inc(res);
   end;
 write(n-res);
end;
begin
 assign(input,'segcover.inp');reset(input);
 assign(output,'segcover.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
