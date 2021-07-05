uses math;
var  p,t,n,h:longint;
     a,r1:array[0..200001] of longint;
     free:array[0..10000000] of boolean;
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
  while a[i]>mid do inc(i);
  while a[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(r1[i],r1[j]);
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,j,res:longint; sum:int64;
begin
 read(n,h);
 for i:=1 to n do read(a[i],r1[i]);
 qsort(1,n);
 fillchar(free,sizeof(Free),false);
 sum:=0;      res:=0;
 for j:=1 to n do
 begin
 if (Free[r1[j]]=true) then continue;
 if (sum+a[j]<h) then
  begin
   free[r1[j]]:=true;
   sum:=sum+a[j];
  end
 else
  begin
   res:=j;
   break;
  end;
 end;
 if res=0 then writeln(-1)
 else writeln(res);
end;
begin
 assign(input,'vol.inp');reset(input);
 assign(output,'vol.out');rewrite(output);
 read(t);
 for p:=1 to t do
  begin
   nhap;
  // xuli;
  end;
 close(input); close(output);
end.
