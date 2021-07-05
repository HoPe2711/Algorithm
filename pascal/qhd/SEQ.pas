Uses Math;

VAR
  n,t:longint;
  cnt:array[1..109] of longint;
  a,c,aa,cc:array[0..2001] of longint;
  f:array[0..2001,0..511] of longint;
  dd:array[0..2001,0..511] of boolean;

Function getbit(x,i:longint):longint;
  Begin
    exit(1 and (x shr i-1));
  End;

Function batbit(x,i:longint):longint;
  Begin
    exit(x or (1 shl i-1));
  End;

Function check(x:longint):boolean;
  Begin
    If (getbit(x,1)=1) or (getbit(x,9)=1) or (getbit(x,8)=1) then exit(false);
    exit(true);
  End;

Procedure Doicho(var x,y:longint);
  Var
    tg:longint;
  Begin
    tg:=x;x:=y;y:=tg;
  ENd;

Procedure Qsort(l,r:longint);
  Var
    i,j,mid:longint;
  Begin
    i:=l;
    j:=r;
    mid:=aa[(l+r) div 2];
    Repeat
      While aa[i]<mid do inc(i);
      While aa[j]>mid do dec(j);
      if i<=j then
        Begin
          Doicho(aa[i],aa[j]);
          Doicho(cc[i],cc[j]);
          inc(i); dec(j);
        End;
    Until i>j;
      If i<r then Qsort(i,r);
      If l<j then Qsort (l,j);
  End;

Function stt2(tt,stt,i:longint):longint;
  Var
    res,h,j:longint;
  BEgin
    h:=a[i+1]-a[i];
    res:=0;
    For j:=0 to 9-h do
      If j=0 then
        Begin
          if tt=1 then res:=batbit(stt,j);
        End
      else
        If getbit(stt,j)=1 then res:=batbit(res,h+j);
    exit(res);
  End;

Function cal(i,stt:longint):longint;
  Var
    kq:longint;
  Begin
    If dd[i,stt] then exit(cal(i,stt));
    kq:=high(longint);
    If i=t+1 then kq:=0
      else
        Begin
          kq:=cal(i+1,stt2(0,stt,i))+c[i];
          If check(stt) then kq:=min(kq,cal(i+1,stt2(1,stt,i)));
        End;
    f[i,stt]:=kq;
    exit(f[i,stt]);
  End;

Procedure nhap;
  vAR
    i,j:LONGINT;
  Begin
    Read(n);
    For i:=1 to n do
      Begin
        Read(aa[i]);
        inc(cnt[aa[i]]);
        cc[i]:=cnt[aa[i]];
      End;
    Qsort(1,n);
    a[1]:=aa[1];
    c[1]:=cc[1];
    j:=1;
    For i:=2 to n do
      If aa[i]=aa[i-1] then c[j]:=max(c[j],cc[i])
      else
        Begin
          inc(j);
          a[j]:=aa[i];
          c[j]:=cc[i];
        End;
      t:=j
  end;
BEGIN
  Nhap;
  Write(cal(1,0));
END.