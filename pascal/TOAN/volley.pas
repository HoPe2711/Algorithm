uses math;
type node=record
     x,y:int64;
end;
var n,q:longint;
    a,b:array[0..200000] of int64;
    res:array[0..200000] of node;
    trans:int64;
procedure nhap;
var i,last,dem:longint;
begin
 read(n); dem:=0;
 for i:=1 to n do
  begin
   read(A[i]);
   trans:=max(trans,a[i]);
  end;
 a[n+1]:=min(a[1],a[2]);
 res[1].x:=a[1];
 res[1].y:=a[2];
 last:=3;
 for i:=2 to n do
  begin
   inc(Dem);
   b[dem]:=min(Res[i-1].x,res[i-1].y);
   res[i].x:=max(Res[i-1].x,res[i-1].y);
   res[i].y:=a[last];
   inc(last);
  end;
 b[0]:=b[dem];
end;
procedure xuli;
var  i:longint; u:int64;
begin
 read(q);
 for i:=1 to q do
  begin
   read(u);
   if u<=n then writeln(Res[u].x,' ',res[u].y)
   else writeln(trans,' ',b[u mod (n-1)]);
  end;
end;
begin
 assign(input,'volley.inp');reset(input);
 assign(output,'volley.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.