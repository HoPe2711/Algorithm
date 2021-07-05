uses math;
const base=1000000007;
var  a,b,free,stack,dd:array[0..1000001] of longint;
     f:array[0..1000001] of int64;
     n,m,top:longint; res:int64;
procedure stop;
begin
 write(0);
 halt;
end;
procedure nhap;
var  i:longint;
begin
 read(n,m);
 if n mod 2=1 then stop;
 for i:=1 to m do
  begin
   read(a[i],b[i]);
   if b[i]<=a[i] then stop;
   if free[a[i]]=0 then free[a[i]]:=b[i]
   else if free[a[i]]<>b[i] then stop;
   if free[b[i]]=0 then free[b[i]]:=a[i]
   else if free[b[i]]<>a[i] then stop;
   if (b[i]-a[i]+1) mod 2=1 then stop;
  end;
end;

function pow(a,x:longint):int64;
var  tg:int64;
begin
 if x=1 then exit(a);
 tg:=pow(a,x div 2);
 tg:=(tg*tg) mod base;
 if x mod 2=1 then exit(tg*a mod base)
 else exit(tg);
end;
procedure build;
var  i:longint;
begin
 f[0]:=1;
 for i:=0 to n-1 do f[i+1]:=pow(i+2,base-2)*2 mod base;
 for i:=0 to n-1 do f[i+1]:=(f[i]*(2*i+1) mod base)*f[i+1] mod base;
end;

procedure doicho(Var x,y:longint);
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
  while a[j]>mid do dec(J);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure push(x:longint);
begin
 inc(top); stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(top);
end;
procedure xuli;
var  i,maxx,u:longint;
begin
 qsort(1,m);        res:=1;   maxx:=0;
 for i:=1 to m do
  begin
   if (a[i]<maxx) and (b[i]>maxx) then stop;
   if a[i]=a[i-1] then continue;
   maxx:=max(maxx,b[i]);
   while (top>0) and (b[stack[top]]<a[i]) do
    begin
     u:=pop;
     res:=res*f[(b[u]-a[u]-1-dd[u]) div 2] mod base;
     inc(dd[stack[top]],b[u]-a[u]+1);
    end;
   push(i);
  end;
 if top>0 then
  begin
   while top>0 do
    begin
     u:=pop;
     res:=res*f[(b[u]-a[u]-1-dd[u]) div 2] mod base;
     inc(dd[stack[top]],b[u]-a[u]+1);
    end;
  end;
 res:=res*f[(n-dd[0]) div 2] mod base;
 write(REs);
end;

begin
 assign(input,'bracket.inp');reset(input);
 assign(output,'bracket.out');rewrite(output);
 nhap;
 build;
 xuli;
 close(input); close(output);
end.
