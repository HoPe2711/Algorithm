uses math;
var n,res,p,minn:longint;
    a,sum:Array[0..50000] of longint;
    free:array[0..50000] of boolean;
procedure nhap;
var i:longint;
begin
 minn:=0;
 read(n,p);
 free[0]:=true;
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
   if sum[i]<minn then
    begin
     minn:=sum[i];
     free[i]:=true;
    end;
  end;
end;

procedure xuli;
var i,j:longint;
begin
 j:=n;
 for i:=n downto 0 do
 if free[i] then
   while (j>i) do
     if sum[j]-sum[i]>=p then
      begin
       res:=max(Res,j-i);
       break;
      end
     else dec(j);
 if res=0 then res:=-1;
 write(res);
end;
begin
 assign(input,'nkmaxseq.inp');reset(input);
 assign(output,'nkmaxseq.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
