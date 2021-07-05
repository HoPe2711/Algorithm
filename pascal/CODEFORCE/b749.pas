var x1,y1,x2,y2,x3,y3:longint;
    kq,kq1:real;
procedure check(x,y,z,t,k,q:longint);
var hhx,hhy:real;
begin
 hhx:=(x+z)/2; hhy:=(y+t)/2;
 kq:=2*hhx-k; kq1:=2*hhy-q;
end;
procedure nhap;
begin
 read(x1,y1);
 read(x2,y2);
 read(x3,y3);
 writeln(3);
 check(x1,y1,x2,y2,x3,y3);
 writeln(kq:0:0,' ',kq1:0:0);
 check(x3,y3,x1,y1,x2,y2);
 writeln(kq:0:0,' ',kq1:0:0);
 check(x3,y3,x2,y2,x1,y1);
 writeln(kq:0:0,' ',kq1:0:0);
end;
begin
 //assign(input,'b749.inp');reset(input);
 nhap;
// close(input);
end.