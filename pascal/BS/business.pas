uses math;
const oo=10000000;
var ke,next,head:array[-300000..300000] of longint;
    queu,dd,d,a:Array[0..300000] of longint;
    n,k,f,r:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,k);
 for i:=1 to k do read(a[i]);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
   adD(-i,v,u);
  end;
end;

procedure DFS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     dd[v]:=dd[u]+1;
     DFS(v,u);
    end;
   j:=next[j];
  end;
end;

procedure push(u:longint);
begin
 inc(r);
 queu[r]:=u;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
function check(x:longint):boolean;
var i,j,v,u,kq,tmp:longint;
begin
 for i:=1 to n do d[i]:=oo;
 //fillchar(queu,sizeof(queu),0);
 f:=1; r:=0;
 for i:=1 to k do
  begin
   push(a[i]);
   d[a[i]]:=0;
  end;
 while f<=r do
  begin
   u:=pop;
   if d[u]=x then continue;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]>d[u]+1 then
      begin
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
 tmp:=0;
 for i:=1 to n do
  if d[i]=oo then
   begin
    tmp:=i;
    break;
   end;
 if tmp=0 then exit(true);
 fillchar(dd,sizeof(dd),0);
 DFS(tmp,-1);
 kq:=0;
 for i:=1 to n do
  if (d[i]=oo) and (dd[i]>kq) then
   begin
    kq:=dd[i];
    tmp:=i;
   end;
 fillchar(dd,sizeof(dd),0);
 DFS(tmp,-1);
 kq:=0;
 for i:=1 to n do
  if (d[i]=oo) and (dd[i]>kq) then kq:=dd[i];
 if (kq mod 2+kq div 2)<=x then exit(true);
 exit(FalsE);
end;


procedure xuli;
var  l,r,mid,res:longint;
begin
 res:=0;
 l:=0;
 r:=n-1;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(res);
end;
begin
 assign(input,'business.inp');reset(input);
 assign(output,'business.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.