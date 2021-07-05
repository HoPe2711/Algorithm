{$H+}
var k,f1,r,dem,kq,n:longint;
    res:int64;
    st:String;
    queu:array[0..1000001] of longint;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f1];
 inc(f1);
end;
procedure nhap;
var i,j,t,last:longint;
begin
 readln(k);
 read(st);
 f1:=1; r:=0;
 n:=length(st);
 if k>=1 then
  begin
   kq:=n;
   for i:=1 to n do
   if st[i]='1' then
    begin
     push(i);
     inc(dem);
     if dem=k then
      begin
       kq:=i;
       break;
      end;
    end;
   t:=0;
   if dem=k then res:=res+queu[f1]-t;
   for i:=kq+1 to n do
    begin
     if st[i]='1' then
      begin
       t:=pop;
       push(i);
       res:=res+queu[f1]-t;
      end;
     if (st[i]='0') then res:=res+queu[f1]-t;
    end ;
  end
 else
  begin
   last:=0;
   st:=st+'2';
   for i:=1 to n do
    if st[i]='0' then res:=res+i-last
    else
    if (st[i]='1') and (st[i+1]='0') then last:=i;
  end;
 write(res);
end;
BEGIN
  assign(input,'substr.inp');reset(input);
  assign(output,'substr.out');rewrite(output);
  nhap;
  close(input);close(output);
END.
