uses math;
var res,n:longint;
    a:array[1..300] of longint;
    l:array[0..300,0..300] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var  i,j,k:longint;
begin
 for k:=1 to n do
  begin
   //res:=0;
   fillchar(l,sizeof(l),0);
   for i:=1 to k do
    for j:=k+1 to n do
     if a[j]>a[i] then
      begin
       l[i,j]:=l[i-1,j-1]+1;   res:=max(res,l[i,j]);
      end
     else l[i,j]:=max(l[i-1,j],l[i,j-1]);
  end;
 write(res);
end;
begin
 assign(input,'kseq1.inp');reset(input);
 assign(output,'kseq1.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.