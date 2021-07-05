{$H+}
var st:string;
    m,n:longint;
    res,cnt:int64;
    next:array[0..500000,#0..#255] of longint;
    c,c2:array[0..500000] of int64;
procedure add(s:string);
var i:longint;  u:int64;
begin
 u:=1;
 for i:=1 to length(s) do
  begin
   if next[u,s[i]]=0 then
    begin
     inc(cnt);
     next[u,s[i]]:=cnt;
    end;
   u:=next[u,s[i]];
   inc(c[u]);
  end;
 inc(c2[u]);
end;
function find(s:string):int64;
var i:longint;   u:int64;
begin
 u:=1;
 for i:=1 to length(S) do
  begin
   if (next[u,s[i]]=0) then exit(0);
   u:=next[u,s[i]];
  end;
 exit(c2[u]);
end;
function find1(s:string):int64;
var i:longint;     u:int64;
begin
 u:=1;
 for i:=1 to length(S) do
  begin
   if (next[u,s[i]]=0) and (c[next[u,s[i]]]=0) then exit(0);
   u:=next[u,s[i]];
  end;
 exit(c[u]);
end;
procedure nhap;
var  i,j,l,x:longint;
     s:string;
begin
 read(m,n);  cnt:=1;
 for i:=1 to m do
  begin
   read(l);  st:='';
   for j:=1 to l do
    begin
     read(x);
     str(x,s);
     st:=st+s;
    end;
   add(St);
  end;
end;
procedure xuli;
var l,i,j,x:longint;
    s:string;
begin
 for i:=1 to n do
  begin
   read(l);  st:='';   res:=0;
   for j:=1 to l do
    begin
     read(x);
     str(x,s);
     st:=st+s;
     res:=res+find(st);
    end;
   res:=res+find1(st)-find(st);
   writeln(res);
  end;
end;
begin
// assign(input,'sec.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.
