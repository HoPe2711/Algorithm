var
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];

end;
procedure nhap;
var
begin
 read(n,m);
 for i:=1 to m do read(a[i],b[i]);
 qsort(1,m);
 for i:=1 to n do t1[i]:=oo;
 for i:=1 to m do
  begin
   t[a[i]]:=max(t[a[i]],b[i]);
   t1[a[i]]:=min(t1[a[i]],b[i]);
  end;
 for i:=1 to n do left[i]:=max(left[i-1],t[i]);
 right[n+1]:=n+1;
 for i:=n downto 1 do right[i]:=min(right[i+1],t1[i]);
end;
procedure xuli;
var
begin
 for i:=n downto 1 do
  begin
   l:=max(left[i],i+1); r:=right[i+1];
   trans:=get(1,1,n,l,r);
   d[i]:=trans+1;
   update(1,1,n,i,d[i]);
  // res:=max(Res,d[i]);
  end;
// write(Res);
end;
begin
 assign(input,'meeting.inp');reset(input);
 assign(output,'meeting.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.