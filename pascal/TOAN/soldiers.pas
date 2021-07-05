{$H+}
uses math;
var n,k,m:longint;
    st:string;
    res:int64;
    pp:array[0..2] of longint;
procedure nhap;
var i:longint;
begin
 readln(n,m);
 readln(k);
 readln(st);
 for i:=1 to k do
  begin
   if st[i]='L' then inc(pp[1]);
   if st[i]='R' then inc(pp[2]);
   if (pp[1]+pp[2]) mod 2=1 then inc(res);
  end;
 if (m=0) or (m=n) then res:=0;
 write(res);
end;
begin
 assign(input,'soldiers.inp');reset(input);
 assign(output,'soldiers.out');rewrite(output);
 nhap;
 close(input); close(output);
end.