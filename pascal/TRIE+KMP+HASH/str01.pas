{$H+}
var cnt,f,r,l,l1,n:longint;
    st:string;
    st1:array[0..1000] of string;
    queu,link,dd,dem,pos,trace:array[0..1000000] of longint;
    c2:array[0..1000000] of boolean;
    next:array[0..1000000,48..49] of longint;
procedure add(s:string;vt:longint);
var u,i,j:longint;
begin
 u:=0;
 for i:=1 to length(S) do
  begin
   j:=ord(s[i]);
   if next[u,j]=0 then
    begin
     inc(cnt);
     next[u,j]:=cnt;
    end;
   u:=next[u,j];
  end;
 c2[u]:=true;
 dd[u]:=vt;
end;


procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure pack;
var u,v,i:longint;
begin
 f:=1; r:=0;
 push(0);
 while f<=r do
  begin
   u:=pop;
   v:= link[u];
   c2[u]:=c2[u] or c2[v];
   for i:=48 to 49 do
    if next[u,i]<>0 then
     begin
      if u<>0 then link[next[u,i]]:=next[v,i]
      else link[next[u,i]]:=0;
      push(next[u,i]);
     end
    else next[u,i]:=next[v,i];
  end;
end;


procedure doicho(var x,y:string);
var tg:string;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ss(x,y:string):longint;
var i:longint;
begin
 if length(x)>length(y) then exit(1)
 else if length(x)<length(y) then exit(0);
 for i:=1 to length(x) do
  if ord(x[i])<ord(y[i]) then exit(0)
  else if ord(x[i])>ord(y[i]) then exit(1);
 exit(2);
end;
procedure qsort(l,r:longint);
var i,j,tg:longint;
    mid:string;
begin
 i:=l;
 j:=r;
 mid:=st1[l+random(r-l+1)];
 repeat
  while ss(st1[i],mid)=0 do inc(i);
  while ss(st1[j],mid)=1 do dec(j);
  if i<=j then
   begin
    doicho(st1[i],st1[j]);
    tg:=pos[i];
    pos[i]:=pos[j];
    pos[j]:=tg;
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;


procedure nhap;
var i:longint;
begin
 readln(l,n);
 readln(st);
 cnt:=1;
 for i:=1 to n do
  begin
   readln(l1);
   readln(st1[i]);
   pos[i]:=i;
  // add(st1[i],i);
  end;
 qsort(1,n);
 st1[0]:='';
 for i:=1 to n do
  if st1[i]<>st1[i-1] then add(st1[i],pos[i])
  else trace[pos[i-1]]:=pos[i];
end;

procedure truyvet(x,id:longint);
begin
 if x=0 then exit;
 dem[x]:=id;
 truyvet(trace[x],id);
end;

procedure xuli;
var i,u,v:longint;
begin
 pack;  u:=0;
 for i:=1 to l do
  begin
   u:=next[u,ord(st[i])];
   v:=u;
   while (c2[v]) do
    begin
     if dd[v]<>0 then inc(dem[dd[v]]);
     v:=link[v];
    end;
  end;
 for i:=1 to n do
  if dem[i]<>0 then truyvet(i,dem[i]);
 for i:=1 to n do writeln(dem[i]);
end;
begin
 assign(input,'str01.inp');reset(input);
 assign(output,'str01.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
