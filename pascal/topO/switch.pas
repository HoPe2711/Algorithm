uses math;
var  queu,d:array[0..35000000] of longint;
    k,f,r,a:longint;
function batbit(x,i:longint):longint;
begin
 exit(x or (1 shl i));
end;
function tatbit(stt,i:longint):longint;
 begin
  exit(stt xor (1 shl i));
 end;
function getbit(x,i:longint):longint;
begin
 exit((x shr i) and 1);
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
procedure BFS(st1:longint);
var u,v,i,j,l,r1:longint;
begin
 push(st1);
 while f<=r do
  begin
   u:=pop;
   for j:=0 to k-1 do
    begin
     i:=j;
     if getbit(u,i)=0 then
      begin
       v:=batbit(u,i);
       l:=i;
       r1:=i;
       while (l>=1) and (getbit(v,l-1)=1) do dec(l);
       while getbit(v,r1+1)=1 do inc(r1);
       if r1-l+1>=4 then
        for i:=l to r1 do v:=tatbit(v,i);
       if d[v]=0 then
        begin
         d[v]:=d[u]+1;
         push(v);
        end;
      end;
     if v=0 then exit;
    end;
  end;
end;
procedure xuli;
var i,st:longint;
begin
 r:=0;
 f:=1;
 st:=0;
 readln(k);
 for i:=1 to k do
  begin
   readln(a);
   st:=st+2**(i-1)*a;
  end;
 BFS(st);
 writeln(d[0]);
end;
begin
 assign(input,'SWITCH.inp');reset(input);
 assign(output,'SWITCH.out');rewrite(output);
  xuli;
 close(input);
 close(output);
end.


















