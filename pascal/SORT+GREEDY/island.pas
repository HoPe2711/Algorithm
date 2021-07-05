uses math;
Type
  node= record
  l,r,h: longint;
End;
Var
  p: array[0..1000000] of node;
  a: array[0..1000000] of longint;
  free: array[0..1000000] of boolean;
  n,res,dem: longint;
Procedure nhap;
  Var i: longint;
  Begin
    Read(n);
    For i:=1 to n do
      begin
        read(a[i]);
        p[i].h:=i;
      end;
    For i:=1 to n do
      begin
        If i>1 then p[i].l:=i-1;
        if i<n then p[i].r:=i+1;
      end;
  End;
Procedure doicho(var x,y: longint);
  Var tg: longint;
  Begin
    tg:=x; x:=y; y:=tg;
  End;
Procedure qsort(l,r: longint);
  Var i,j,k,k1: longint;
      tg,k2: node;
  Begin
    i:=l; j:=r; k:=l+ random(r-l+1);
    k1:=a[k]; k2:=p[k];
    Repeat
      While (a[i]>k1) or ((a[i]=k1) and (p[i].h>k2.h)) do inc(i);
      While (a[j]<k1) or ((a[j]=k1) and (p[j].h<k2.h)) do dec(j);
      If i<=j then
        begin
          doicho(a[i],a[j]);
          tg:=p[i]; p[i]:=p[j]; p[j]:=tg;
          inc(i);
          dec(j);
        end;
    Until i>j;
    If l<j then qsort(l,j);
    If i<r then qsort(i,r);
  End;
Procedure xuli;
  Var i: longint;
  Begin
    qsort(1,n);
    dem:=0;   res:=0;
    fillchar(free,sizeof(free),true);
    For i:=1 to n do
      begin
        If free[p[i].l]= false then inc(dem);
        If free[p[i].r]=false then inc(dem);
        inc(dem);
        free[p[i].h]:=false;
        If a[i]<>a[i+1] then
        res:=max(res,dem);
      end;
    Write(res);
  End;
Begin
  assign(input,'island.inp'); reset(input);
  assign(output,'island.out'); rewrite(output);
  nhap;
  xuli;
  close(input); close(output);
End.
