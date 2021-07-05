uses math;
const oo=high(int64);
var n,m,k:longint; reS,sum:int64;
    a:array[0..500] of longint;
    ff:array[0..500,0..500] of int64;
procedure nhap;
var i:longint;
begin
 read(n,m,k);
 for i:=1 to n do
  begin
   read(a[i]);
   sum:=sum+a[i];
  end;
end;
procedure xuli1;
var length,i,j:longint;
begin
 for length:=0 to m do
  begin
   fillchar(ff,sizeof(ff),0);
   for i:=1 to n do
    for j:=0 to length do
    if j<i then
     begin
      if (i-j) mod k<>0 then ff[i,j]:=max(ff[i,j],ff[i-1,j])
      else ff[i,j]:=max(ff[i,j],ff[i-1,j]+a[i]);

      if j<length then
       begin
        if (n-length+j+1) mod k<>0 then ff[i,j+1]:=max(ff[i,j+1],ff[i-1,j])
        else ff[i,j+1]:=max(ff[i,j+1],ff[i-1,j]+a[i]);
       end;
     end;
    res:=max(res,ff[n,length]);
  end;
 write(sum-Res);
end;
begin
 assign(input,'wseq.inp');reset(input);
 assign(output,'wseq.out');rewrite(output);
 nhap;
 xuli1;
 close(input); close(output);
end.
