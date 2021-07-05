uses math;
var pp,kq,tt:array[0..10000] of int64;
   // free:array[0..10000] of boolean;
    n,k:longint;
procedure build;
var i:longint;
begin
 pp[0]:=1;
 for i:=1 to 13 do pp[i]:=pp[i-1]*i;
end;
procedure hailong(tungduong:longint);
var i,j,dem,th:longint;
begin
 for i:=1 to tungduong do tt[i]:=i;
 dem:=tungduong;
 for i:=1 to tungduong do
  begin
   for j:=1 to dem do
    if (pp[tungduong-i]*j>=k) then
     begin
      kq[i]:=tt[j];
      th:=j;
      if i<>tungduong then
      k:=k-(j-1)*pp[tungduong-i]
      else k:=k-1;
      break;
     end;
   FOR j:=th to dem-1 do tt[j]:=tt[j+1];
   dec(dem);
  end;
end;
procedure nhap;
var i:longint;
begin
 read(n,k);
 if n<=13 then
  begin
   hailong(n);
   if k<>0 then
    begin
     write(-1);
     halt;
    end;
   for i:=1 to n do write(kq[i],' ');
  end
 else
  begin
   hailong(13);
   for i:=1 to 13 do write(kq[i],' ');
   for i:=14 to n do write(i,' ');
  end;
end;
begin
 assign(input,'permutationlist.inp');reset(input);
 assign(output,'permutationlist.out');rewrite(output);
 build;
 nhap;
 close(input); close(output);
end.
