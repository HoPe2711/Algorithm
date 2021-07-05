uses math;
var n,dem,limit,dem1:longint;
    a,b,pos,dd,tt,t,k,l,r,tin,tout,trace:array[0..400000] of longint;
procedure nhap;
var i:longint;
    ch:char;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(ch);
   if ch='+' then
    begin
     inc(dem);
     read(a[dem]);
     dd[i]:=dem;   pos[dem]:=dem;
    end
   else
    if ch='-' then
     begin
      inc(dem);
      read(a[dem]);
      dd[i]:=dem;   pos[dem]:=dem; tt[i]:=1;
     end
    else
     begin
      inc(dem1);
      read(k[dem1],l[dem1],r[dem1]);
      inc(dem); pos[dem]:=dem; a[dem]:=l[dem1];  tin[i]:=dem;
      inc(dem); pos[dem]:=dem; a[dem]:=r[dem1];  tout[i]:=dem;
      dd[i]:=dem1;  tt[i]:=2;
     end;
    readln;
  end;
end;

procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   t[i]:=t[i]+x;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
 x:=0;
 while i>0 do
  begin
    x:=x+t[i];
    i:=i - (i and (-i));
  end;
 exit(x);
end;

function find(x,le,ri:longint):longint;
var  kq,mid,rush:longint;
begin
 kq:=0;  rush:=le;
 while le<=ri do
  begin
   mid:=(le+ri) div 2;
   if get(mid)-get(rush-1)>=x then
    begin
     kq:=mid;
     ri:=mid-1;
    end
   else  le:=mid+1;
  end;
 exit(kq);
end;

procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i:longint;
begin
 qsort(1,dem);
 limit:=1;
 b[pos[1]]:=limit;
 trace[limit]:=a[1];
 for i:=2 to dem do
 begin
  if a[i]<>a[i-1] then inc(limit);
  b[pos[i]]:=limit;
  trace[limit]:=a[i];
 end;

 for i:=1 to n do
  if tt[i]=0 then update(b[dd[i]],1)
  else if tt[i]=1 then update(b[dd[i]],-1)
  else writeln(trace[find(k[dd[i]],b[tin[i]],b[tout[i]])]);
end;
begin
// assign(input,'focus.inp');reset(input);
 nhap;
 xuli;
// close(input);
end.
