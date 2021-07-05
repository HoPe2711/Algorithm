uses math;
var n,k:longint;
    res:int64;
    u,v,w,lab,free:Array[0..1000000] of longint;
function getrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=getrout(lab[u]);
 exit(lab[u]);
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
 mid:=w[l+random(r-l+1)];
 repeat
  while w[i]>mid do inc(i);
  while w[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(w[i],w[j]);
    doicho(u[i],u[j]);
    doicho(v[i],v[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,x:longint;
begin
 read(n,k);
 for i:=0 to n-1 do lab[i]:=i;
 for i:=1 to n-1 do read(u[i],v[i],w[i]);
 qsort(1,n-1);
 for i:=1 to k do
  begin
   read(x);
   free[x]:=1;
  end;
end;
procedure xuli;
var i,p,q,tmp,tg:longint;
begin
 for i:=1 to n-1 do
  begin
   p:=getrout(u[i]); q:=getrout(v[i]);
   if (free[p]=1) and (free[q]=1) then res:=res+w[i]
   else
   if p<>q then
    begin
     lab[lab[u[i]]]:=lab[v[i]];
     tmp:=max(free[p],free[q]);
     tg:=getrout(u[i]);
     free[tg]:=tmp;
    end;
  end;
 write(Res);
end;
begin
 assign(input,'treek.inp');reset(input);
 assign(output,'treek.out');rewrite(output);
 nhap;
 Xuli;
 close(input); close(output);
end.