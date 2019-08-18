function caja( n,p,os,e )

if os==0
disp('grax mano')
elseif os==1
close
grid on;

%estadisticos
xm=0;

%C.I.
axis([-200 200 -200 200 -200 200])
X=round(rand(p,1).*100-50);
Y=round(rand(p,1).*100-50);
Z=round(rand(p,1).*100-50);
Vx=round((rand(p,1).*50-25)*0.2);%rand(p,1).*30-15;
Vy=round((rand(p,1).*50-25)*0.2);%rand(p,1).*30-15;
Vz=round((rand(p,1).*50-25)*0.2);

hold on
figure(1);
a=plot(X(:),Y(:),'ro');
pause(0.1)
delete(a)

for j=1:1:n

    for i=1:1:p
      
        X(i)=X(i)+Vx(i);
        Y(i)=Y(i)+Vy(i);
        Z(i)=Z(i)+Vz(i);
        
        
            for c=1:1:p
                
                if X(i)==X(c) && i~=c
                    %disp('casi')
                    if Y(i)==Y(c)
                        %Vxn=ones(p,1);
                        %Vyn=ones(p,1);
                            info=sprintf('antes\nvel.o de a\t%4d %4d %4d\nvel.o de b\t%4d %4d %4d\n',Vx(i),Vy(i),Vz(i),Vx(c),Vy(c),Vz(c));
                            disp(info)
                           % text(X(i),Y(i),'\leftarrow sin(-\pi\div4)','HorizontalAlignment','left')
                            
                            Vx(c)=-( Vx(i)+Vx(c)+e*(Vx(i)-Vx(c)) )*0.5;
                            Vy(c)=-( Vy(i)+Vy(c)+e*(Vy(i)-Vy(c)) )*0.5;
                            Vz(c)=-( Vz(i)+Vz(c)+e*(Vz(i)-Vz(c)) )*0.5;
                            
                            Vx(i)=(Vx(i)+Vx(c)+e*(Vx(i)-Vx(c)))*0.5-e*(Vx(i)-Vx(c));
                            Vy(i)=(Vy(i)+Vy(c)+e*(Vy(i)-Vy(c)))*0.5-e*(Vy(i)-Vy(c));
                            Vx(i)=(Vz(i)+Vz(c)+e*(Vz(i)-Vz(c)))*0.5-e*(Vz(i)-Vz(c));
                            
                            info=sprintf('antes\nvel.f de a\t%4d %4d %4d\nvel.f de b\t%4d %4d %4d\n',Vx(i),Vy(i),Vz(i),Vx(c),Vy(c),Vz(c));
                            disp(info)
                            
                            plot3(X(i),Y(i),Z(i),'r*');
                     
                        disp('chocan')
                    end
                end
                
            end
        
        if X(i)>200 || X(i)<-200
           disp('Vx')
           disp(Vx(i))
           disp(X(i))
           if X(i)>200
                X(i)=200;
            else
                X(i)=-200;
            end
            Vx(i)=Vx(i)*(-e);
           
           disp(Vx(i))
        end
        if Y(i)>200 || Y(i)<-200
           disp('Vy')
           disp(Vy(i))
           disp(Y(i))
            if Y(i)>200
                Y(i)=200;
            else
                Y(i)=-200;
            end
            Vy(i)=Vy(i)*(-e);
           
           disp(Vy(i))
        end
        if Z(i)>200 || Z(i)<-200
           disp('Vz')
           disp(Vz(i))
           disp(Z(i))
           if Z(i)>200
                Z(i)=200;
            else
                Z(i)=-200;
            end
            Vz(i)=Vz(i)*(-e);
           
           disp(Vz(i))
        end
       % figure(2)
       % plot(Vx(:),Vy(:))
       % figure(1)
    end
    a=plot3(X(:),Y(:),Z(:),'bo');
        
        %if c1 ~= 1;
                axux=ones(p,1);
            for ix=1:1:p
                ax=[X(ix),X(ix)+Vx(ix)*10];
                ay=[Y(ix),(Y(ix)+Vy(ix)*10)*1];
                az=[Z(ix),(Z(ix)+Vz(ix)*10)*1];
                axux(ix)=plot3(ax,ay,az,'c');
            end 
        %end
       
    pause(0.01)
    delete(a)
        %if c1 ~= 1;
             delete(axux(:))
           
        %end

end
a=plot3(X(:),Y(:),Z(:),'bo');
plot3(X(1),Y(1),Z(1),'-')    
end
end