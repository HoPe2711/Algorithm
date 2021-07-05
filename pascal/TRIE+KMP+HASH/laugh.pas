{$H+}
uses math;
var n,res,cnt,l,tt:longint;
    st:string;
    st1:array[0..1000] of string;
    next:array[0..100000,'a'..'z'] of longint;
    c2:array[0..100000] of boolean;
    f:Array[0..100000] of longint;
procedure add(s:string);
var  u,i:longint;
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
  end;
 c2[u]:=true;
end;
function find(s:String):boolean;
var i,u:longint;
begin
 u:=1;
 for i:=1 to length(s) do
  begin
   if next[u,s[i]]=0 then exit(false);
   u:=next[u,s[i]];
  end;
 exit(c2[u]);
end;
function check(x,y:longint):boolean;
var stt:string;
begin
 stt:=copy(st,x,y);
 if find(stt) then exit(true);
 exit(false);
end;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(st);  l:=length(st);
 cnt:=1;
 for i:=1 to n do
  begin
   readln(st1[i]);
   add(st1[i]);
   tt:=max(tt,length(st1[i]));
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=0 to l do
  for j:=1 to tt do
  if i+j<=l then
   if check(i+1,j) then f[i+j]:=max(f[i+j],f[i]+j);
 for i:=1 to l do res:=max(res,f[i]);
 write(res);
end;
begin
 assign(input,'laugh.inp');reset(input);
 assign(output,'laugh.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.















{procedure xuli;
var n,n1,i,dem,tt,o,k:longint;
begin
 n:=length(st);
 n1:=length(st1[1]);
 for i:=1 to n-n1+1 do
  if st[i]=st1[1][1] then
   begin
    dem:=0; o:=0;
    tt:=i;
    while tt<=n-n1+1 do
     begin
      inc(o);
      for k:=1 to n1 do
       if st[tt+k-1]=st1[1][k] then inc(dem);
      if dem<n1*o then
       begin
          res:=max(res,n1*(o-1));
          break;
       end
      else
       begin
        tt:=tt+n1;
        res:=max(res,n1*o);
       end;
     end;
   end;
 write(res);
end; }
