uses math;
type arr=array[0..40] of longint;
    matrix=array[0..3,0..3] of int64;
var t,base,dem:longint;
    a,b,c,d,kq1,kq2,kq3,kq4,kq5:arr;
    res:int64;
    n:qword;
    m:matrix;
    dd:array[-400..400,-400..400,0..200] of boolean;
    f:array[-400..400,-400..400,0..200] of longint;
procedure nhap;
begin
 read(t);
 if t=2 then read(n,base)
 else read(n);
end;
function cal(x,y,k:longint):longint;
var tg:longint;
begin
 tg:=0;
 if dd[x,y,k] then exit(0);
 dd[x,y,k]:=true;
 if n=k then exit(1);
 tg:=tg+cal(x+1,y+2,k+1)+cal(x+2,y+1,k+1)+cal(x+2,y-1,k+1)+cal(x+1,y-2,k+1)+cal(x-1,y-2,k+1)+cal(x-2,y-1,k+1)+cal(x-2,y+1,k+1)+cal(x-1,y+2,k+1);
 f[x,y,k]:=tg;
 exit(f[x,y,k]);
end;
operator *(m1,m2:matrix)m:matrix;
var i,j,k:longint;
begin
 for i:=1 to 3 do
  for j:=1 to 3 do
   begin
    m[i,j]:=0;
    for t:=1 to 3 do m[i,j]:=(m[i,j] mod base + (m1[i,t]*m2[t,j]) mod base) mod base;
   end;
end;
function luythua(a:matrix;x:qword):matrix;
var tg:matrix;
begin
 if x=1 then exit(a);
 tg:=luythua(a,x div 2);
 tg :=tg*tg;
 if x mod 2 = 1 then exit(tg*a)
 else exit(tg);
end;
procedure xuli;
var i:longint;
begin
 m[1,1]:=2;
 m[1,2]:=-1;
 m[1,3]:=1;
 m[2,1]:=1;
 m[2,2]:=0;
 m[2,3]:=0;
 m[3,1]:=0;
 m[3,2]:=0;
 m[3,3]:=1;
 m:=luythua(m,n-6);
 res:=(((277*m[1,1]+196*m[1,2]+14*m[1,3]) mod base) + base) mod base ;
 write(res mod base);
end;
function cong(a,b : arr)  : arr;
  var
    nho,i,x : longint;
    c : arr;
  begin
    dem  :=  0;
    nho :=  0;
    for i :=  max(a[0],b[0]) downto 1 do
      begin
        x :=  a[i]  + b[i]  + nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
        inc(dem);
      end;
    c[0]  :=  nho;
    exit(c);
  end;
function nhan(a,b : arr)  : arr;
  var
    i,j,dem,x,nho, m,n  : longint;
    c : arr;
  begin
    fillchar(c,sizeof(c),0);
    m :=  a[0]; n :=  b[0];
    for i :=  m downto 1 do
      for j :=  n downto 1 do
        c[i+j-1]  :=  c[i+j-1]  + a[i]  * b[j];
    nho := 0;
    for i :=  m+n-1 downto 1 do
      begin
        x :=  c[i]+nho;
        nho :=  x div 10;
        x :=  x mod 10;
        c[i]  :=  x;
      end;
    c[0]  :=  nho;
    exit(c);
  end;
procedure xuli_add1;
  var
    i : longint;
    q4:arr;
  begin
    q4:=cong(kq3,kq2);
    if kq4[0] <>  0  then
     begin
      for i :=  0 to dem do kq4[i+1]:=q4[i];
       kq4[0]:=dem+1;
     end
    else kq4[0]:=dem;
  end;
procedure xuli_add2;
  var
    i : longint;
  begin
    if kq5[0] <>  0  then
     for i :=  0 to dem do write(kq5[i])
    else
     begin
      for i :=  1 to dem do write(kq5[i]);
     end;
  end;

procedure xuli_nhan1;
  var
    i : longint;
    q:arr;
  begin
    q:=nhan(a,a);
    if kq1[0] <> 0 then
    begin
     for i :=  0 to a[0]+a[0]-1 do kq1[i+1]:=q[i];
    kq1[0]:=a[0]+a[0];
    end
    else kq1[0]:=a[0]+a[0]-1;
  end;
procedure xuli_nhan2;
  var
    i : longint;
    q1:arr;
  begin
    q1:=nhan(kq1,b);
    if kq2[0] <> 0 then
     begin
      for i :=  0 to kq1[0]+b[0]-1 do kq2[i+1]:=q1[i];
      kq2[0]:=kq1[0]+b[0];
     end
    else kq2[0]:=kq1[0]+b[0]-1;
  end;
procedure xuli_nhan3;
  var
    i : longint;
    q2:arr;
  begin
    q2:=nhan(a,c);
    if kq3[0] <> 0 then
     begin
      for i :=  0 to a[0]+c[0]-1 do kq3[i+1]:=q2[i];
      kq3[0]:=a[0]+c[0];
     end
    else kq3[0]:=a[0]+c[0]-1;
  end;

procedure xuli3;
var i,x,y,h:longint;
    st1:string;
begin
    str(n,st1);
    a[0]  :=  length(st1);
    for i :=  1 to a[0] do
      begin
        val(st1[i],x,y);
        a[i]  :=  x;
      end;
    b[1]:=7;
    b[0]:=1;
    c[1]:=4;
    c[0]:=1;
    kq1:=nhan(a,a);
    xuli_nhan1;
    kq2:=nhan(kq1,b);
    xuli_nhan2;
    kq3:=nhan(a,c);
    xuli_nhan3;
    if kq3[0]>kq2[0] then
     begin
      h:=kq3[0]-kq2[0];
      for i:=kq2[0] downto 1 do kq2[i+h]:=kq2[i];
      for i:=1 to h do kq2[i]:=0;
     end;
    if kq3[0]<kq2[0] then
     begin
      h:=kq2[0]-kq3[0];
      for i:=kq3[0] downto 1 do kq3[i+h]:=kq3[i];
      for i:=1 to h do kq3[i]:=0;
     end;
    kq4:=cong(kq3,kq2);
    xuli_add1;
    d[kq4[0]]:=1;
    d[0]:=1;
    kq5:=cong(kq4,d);
    xuli_add2;
end;
begin
 assign(input,'knight.inp');reset(input);
 assign(output,'knight.out');rewrite(output);
 nhap;
 if (t=3) and (n>=7) then xuli3
 else if (t=3) and (n<7) then write(cal(0,0,0));
 if (t=2) and (n>=7) then xuli
 else if (t=2) and (n<7) then write(cal(0,0,0) mod base);
 if t=1 then write(cal(0,0,0));
 close(input);
 close(output);
end.
