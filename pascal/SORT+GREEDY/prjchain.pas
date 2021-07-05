uses math;
type   node=record
       x,y,z,pos:longint;
end;
var tmp,res:int64;
    n:longint;
    a:Array[0..200000] of node;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i].x);
 for i:=1 to n do
  begin
   read(a[i].y);
   a[i].pos:=i;
   a[i].z:=a[i].y-a[i].x;
  end;
end;
procedure doicho(var x,y:node);
var tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ccw(i,j:node):longint;
begin
 if (i.z>=0) and (j.z>=0) then
  begin
   if i.x<j.x then exit(1)
   else exit(-1);
  end;
 if (i.z<0) and (j.z<0) then
  begin
   if i.y>j.y then exit(1)
   else exit(-1);
  end;
 if (i.z>=0) and (j.z<0) then exit(1);
 exit(-1);
end;
procedure qsort(l,r:longint);
var i,j:longint;  mid:node;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while ccw(a[i],mid)=1 do inc(i);
  while ccw(mid,a[j])=1 do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var  i:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   tmp:=tmp+a[i].x;
   res:=max(res,tmp);
   tmp:=tmp-a[i].y;
  end;
 writeln(res);
 for i:=1 to n do write(a[i].pos,' ');
end;
begin
 assign(input,'prjchain.inp');reset(input);
 assign(output,'prjchain.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
