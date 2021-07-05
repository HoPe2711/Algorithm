uses math;
var n,res,f,r,v1,v2 : longint;
    queue : array [0..1000000] of longint;
procedure push(x : longint);
begin
 inc(r);
 queue[r] := x;
end;
procedure nhap;
var i,a,r2 : longint;
begin
 read(n);
 f := 1;
 for i := 1 to n do
  begin
   read(a);
   if (a <> v1) and (a <> v2) then
    begin
     v1 := queue[r];
     v2 := a;
     r2 := r;
     while (r2 > 0) and (queue[r2] = v1) do dec(r2);
     f := r2+1;
    end;
   push(a);
   res := max(res,r-f+1);
  end;
 write(res);
end;
begin
 assign(input,'twovals.inp') ; reset(input) ;
 assign(output,'twovals.out') ; rewrite(output) ;
 nhap;
 close(input) ; close(output) ;
end.

