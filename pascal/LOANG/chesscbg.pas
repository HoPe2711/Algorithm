var st,st1,f,r:longint;
    x:char ;
    d,queu:array[0..70000] of longint;
procedure nhap;
var i,j:longint;
begin
 for i:=1 to 4 do
 begin
  for j:=1 to 4 do
   begin
    read(x);
    st:=st*2+ord(x)-48;
   end;
  readln;
  end;
  for i:=1 to 4 do
  begin
   for j:=1 to 4 do
    begin
     read(x);
     st1:=st1*2+ord(x)-48;
    end;
    readln;
   end;
end;
function batbit(x,i:longint):longint;
begin
 exit(x or (1 shl i));
end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function tatbit(x,i:longint):longint;
begin
 exit(x xor (1 shl i));
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
procedure BFS(s:longint);
var i,u,v:longint;
begin
 push(s);
 while f<=r do
  begin
   u:=pop;
   for i:=0 to 15 do
    if getbit(u,i)=1 then
     begin
      v:=u;
      if (i<=11) and (getbit(u,i+4)=0) then
       begin
        v:=batbit(u,i+4);
        v:=tatbit(v,i);
        if d[v]=0 then
         begin
          d[v]:=d[u]+1;
          push(v);
         end;
       end;
      if (i mod 4<>3) and (getbit(u,i+1)=0) then
       begin
        v:=batbit(u,i+1);
        v:=tatbit(v,i);
        if d[v]=0 then
         begin
          d[v]:=d[u]+1;
          push(v);
         end;
       end;
      if (i>=4) and (getbit(u,i-4)=0) then
       begin
        v:=batbit(u,i-4);
        v:=tatbit(v,i);
        if d[v]=0 then
         begin
          d[v]:=d[u]+1;
          push(v);
         end;
       end;
      if (i mod 4<>0) and (getbit(u,i-1)=0) then
       begin
        v:=batbit(u,i-1);
        v:=tatbit(v,i);
        if d[v]=0 then
         begin
          d[v]:=d[u]+1;
          push(v);
         end;
       end;
      if v=st1 then exit;
     end;
  end;
end;
procedure xuli;
begin
 f:=1;
 BFS(st);
 write(d[st1]);
end;
begin
 //assign(input,'chesscbg.inp');reset(input);
// assign(output,'chesscbg.out');rewrite(output);
 nhap;
 xuli;
// close(input);
// close(output);
end.
