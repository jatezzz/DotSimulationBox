function caja_simulada( n,p,os,e )

% Las variables indican:
%   n:  numero de repeticiones
%   p:  numero de partículas
%   e:  coeficiente de restitución
%   os: alternativa de ploteo  

    %Configuración de pantalla
    close
    figure(1);
    axis([-200 200 -200 200 -200 200])
    title('Simulación de Impactos de partículas')
    xlabel('eje x')
    ylabel('eje y')
    zlabel('eje z')
    hold on
    grid;
%graficando la caja    
a=[-200 -200 -200;-200 200 -200;200 200 -200;200 -200 -200];
fill3(a(:,1),a(:,2),a(:,3),'y')
b=[200 -200 200;200 -200 -200;200 200 -200;200 200 200];
fill3(b(:,1),b(:,2),b(:,3),'k')
c=[-200 200 200;-200 200 -200;200 200 -200;200 200 200];
fill3(c(:,1),c(:,2),c(:,3),'k')
plot3([200;200],[200;200],[200;-200],'w')
    
    %estadisticos
    masa=8; %kg
    Sum_p=zeros(n,3); %Como la masa es constante, por equivalente, es la posicion del centro de masa para cada unidad de tiempo.
    Mod_velocidad=ones(p,n);
    Cant_momento=ones(p,n);

   %C.I.
   %Posición y velocidad por partícula velocidad
    Posicion=[round(rand(p,1).*100-50),round(rand(p,1).*100-50),round(rand(p,1).*100-50)];
    Velocidad=[round((rand(p,1).*50-25)*0.2),round((rand(p,1).*50-25)*0.2),round((rand(p,1).*50-25)*0.2)];
        
        %En adelante se usará:
        %   Posicion(i,1):  Posicion en eje x
        %   Posicion(i,2):  Posicion en eje y
        %   Posicion(i,3):  Posicion en eje z
        %
        %   Velocidad(i,1):  Velocidad en eje x
        %   Velocidad(i,2):  Velocidad en eje y
        %   Velocidad(i,3):  Velocidad en eje z
        
   %Grafico y borro los puntos para el momento inicial
    Grafica=plot3(Posicion(:,1),Posicion(:,2),Posicion(:,3),'bo','MarkerFaceColor','c');
    pause(0.1)
    delete(Grafica)
    
if os==0
   %Esta alternativa de simulacion es mas eficiente y menos pesada, pero
   %simple
   
   %Grafico y borro los puntos para la simulación completa
   %n-veces 
   for j=1:1:n
        %Esta alternativa de simulacion agrega vectores que indican la velocidad por particula 
   %Grafico y borro los puntos para la simulación completa
   %n-veces 
   for j=1:1:n
        %Cada partícula
        for i=1:1:p
           %Cambio las posiciones en funcion del aumento de la velocidad
            Posicion(i,1)=Posicion(i,1)+Velocidad(i,1);
            Posicion(i,2)=Posicion(i,2)+Velocidad(i,2);
            Posicion(i,3)=Posicion(i,3)+Velocidad(i,3);
            
            %Sumo las posiciones
            Sum_p(j,1)=Sum_p(j,1)+Posicion(i,1);
            Sum_p(j,2)=Sum_p(j,2)+Posicion(i,2);
            Sum_p(j,3)=Sum_p(j,3)+Posicion(i,3);
            
                %Verifico un choque entre las particulas, barriendo arrays
                for c=1:1:p
                    %La posición entre 2 es igual en el eje X, a la vez
                    %diferentes, y también en el eje Y
                    
                    if Posicion(i,1)==Posicion(c,1) && i~=c
                        if Posicion(i,2)==Posicion(c,2)
                            %Variables que almacen temporalmente la
                            %velocidad de la primer particula
                                Velocidad_temporal_x=Velocidad(i,1);
                                Velocidad_temporal_y=Velocidad(i,2);
                                Velocidad_temporal_z=Velocidad(i,3);
                            %Cambio las velocidades con forme a las ecuaci_
                            %ones de particulas durante unimpacto   
                                Velocidad(i,1)=(Velocidad(i,1)+Velocidad(c,1)+e*(Velocidad(i,1)-Velocidad(c,1)))*0.5-e*(Velocidad(i,1)-Velocidad(c,1));
                                Velocidad(i,2)=(Velocidad(i,2)+Velocidad(c,2)+e*(Velocidad(i,2)-Velocidad(c,2)))*0.5-e*(Velocidad(i,2)-Velocidad(c,2));
                                Velocidad(i,1)=(Velocidad(i,3)+Velocidad(c,3)+e*(Velocidad(i,3)-Velocidad(c,3)))*0.5-e*(Velocidad(i,3)-Velocidad(c,3));

                                Velocidad(c,1)=-( Velocidad_temporal_x+Velocidad(c,1)+e*(Velocidad_temporal_x-Velocidad(c,1)) )*0.5;
                                Velocidad(c,2)=-( Velocidad_temporal_y+Velocidad(c,2)+e*(Velocidad_temporal_y-Velocidad(c,2)) )*0.5;
                                Velocidad(c,3)=-( Velocidad_temporal_z+Velocidad(c,3)+e*(Velocidad_temporal_z-Velocidad(c,3)) )*0.5;
                            %Grafico un punto que muestre el punto de
                            %impacto
                                plot3(Posicion(i,1),Posicion(i,2),Posicion(i,3),'r*');

                        end
                    end

                end
            %Choque contra las paredes para cada eje
            %Eje x
            if Posicion(i,1)>200 || Posicion(i,1)<-200

               if Posicion(i,1)>200
                    Posicion(i,1)=200;
                else
                    Posicion(i,1)=-200;
                end
                Velocidad(i,1)=Velocidad(i,1)*(-e);

            end
            %Eje y
            if Posicion(i,2)>200 || Posicion(i,2)<-200

                if Posicion(i,2)>200
                    Posicion(i,2)=200;
                else
                    Posicion(i,2)=-200;
                end
                Velocidad(i,2)=Velocidad(i,2)*(-e);

            end
            %Eje z
            if Posicion(i,3)>200 || Posicion(i,3)<-200

               if Posicion(i,3)>200
                    Posicion(i,3)=200;
                else
                    Posicion(i,3)=-200;
                end
                Velocidad(i,3)=Velocidad(i,3)*(-e);

            end
        %Calculos sobre la velocidad y momento por particula
        Mod_velocidad(i,j)=sqrt(Velocidad(i,1)^2+Velocidad(i,2)^2+Velocidad(i,3)^2);
        Cant_momento(i,j)=masa*Mod_velocidad(i,j);
        
        end
        %Grafico ya todo los puntos en una unidad de tiempo.
        Grafica=plot3(Posicion(:,1),Posicion(:,2),Posicion(:,3),'bo','MarkerFaceColor','c');
        pause(0.01)
        delete(Grafica)
   end
   end
  %Finalizo graficando todos los puntos para una presentación final
   Grafica=plot3(Posicion(:,1),Posicion(:,2),Posicion(:,3),'bo','MarkerFaceColor','c');
   
elseif os==1
    
   %Esta alternativa de simulacion agrega vectores que indican la velocidad por particula 
   %Grafico y borro los puntos para la simulación completa
   %n-veces 
   for j=1:1:n
        %Cada partícula
        for i=1:1:p
           %Cambio las posiciones en funcion del aumento de la velocidad
            Posicion(i,1)=Posicion(i,1)+Velocidad(i,1);
            Posicion(i,2)=Posicion(i,2)+Velocidad(i,2);
            Posicion(i,3)=Posicion(i,3)+Velocidad(i,3);
            
            %Sumo las posiciones
            Sum_p(j,1)=Sum_p(j,1)+Posicion(i,1);
            Sum_p(j,2)=Sum_p(j,2)+Posicion(i,2);
            Sum_p(j,3)=Sum_p(j,3)+Posicion(i,3);
            
                %Verifico un choque entre las particulas, barriendo arrays
                for c=1:1:p
                    %La posición entre 2 es igual en el eje X, a la vez
                    %diferentes, y también en el eje Y
                    
                    if Posicion(i,1)==Posicion(c,1) && i~=c
                        if Posicion(i,2)==Posicion(c,2)
                            %Variables que almacen temporalmente la
                            %velocidad de la primer particula
                                Velocidad_temporal_x=Velocidad(i,1);
                                Velocidad_temporal_y=Velocidad(i,2);
                                Velocidad_temporal_z=Velocidad(i,3);
                            %Cambio las velocidades con forme a las ecuaci_
                            %ones de particulas durante unimpacto   
                                Velocidad(i,1)=(Velocidad(i,1)+Velocidad(c,1)+e*(Velocidad(i,1)-Velocidad(c,1)))*0.5-e*(Velocidad(i,1)-Velocidad(c,1));
                                Velocidad(i,2)=(Velocidad(i,2)+Velocidad(c,2)+e*(Velocidad(i,2)-Velocidad(c,2)))*0.5-e*(Velocidad(i,2)-Velocidad(c,2));
                                Velocidad(i,3)=(Velocidad(i,3)+Velocidad(c,3)+e*(Velocidad(i,3)-Velocidad(c,3)))*0.5-e*(Velocidad(i,3)-Velocidad(c,3));

                                Velocidad(c,1)=-( Velocidad_temporal_x+Velocidad(c,1)+e*(Velocidad_temporal_x-Velocidad(c,1)) )*0.5;
                                Velocidad(c,2)=-( Velocidad_temporal_y+Velocidad(c,2)+e*(Velocidad_temporal_y-Velocidad(c,2)) )*0.5;
                                Velocidad(c,3)=-( Velocidad_temporal_z+Velocidad(c,3)+e*(Velocidad_temporal_z-Velocidad(c,3)) )*0.5;
                            %Grafico un punto que muestre el punto de
                            %impacto
                                plot3(Posicion(i,1),Posicion(i,2),Posicion(i,3),'r*');

                        end
                    end

                end
            %Choque contra las paredes para cada eje
            %Eje x
            if Posicion(i,1)>200 || Posicion(i,1)<-200

               if Posicion(i,1)>200
                    Posicion(i,1)=200;
                else
                    Posicion(i,1)=-200;
                end
                Velocidad(i,1)=Velocidad(i,1)*(-e);

            end
            %Eje y
            if Posicion(i,2)>200 || Posicion(i,2)<-200

                if Posicion(i,2)>200
                    Posicion(i,2)=200;
                else
                    Posicion(i,2)=-200;
                end
                Velocidad(i,2)=Velocidad(i,2)*(-e);

            end
            %Eje z
            if Posicion(i,3)>200 || Posicion(i,3)<-200

               if Posicion(i,3)>200
                    Posicion(i,3)=200;
                else
                    Posicion(i,3)=-200;
                end
                Velocidad(i,3)=Velocidad(i,3)*(-e);

            end
        %Calculos sobre la velocidad y momento por particula
        Mod_velocidad(i,j)=sqrt(Velocidad(i,1)^2+Velocidad(i,2)^2+Velocidad(i,3)^2);
        Cant_momento(i,j)=Mod_velocidad(i,j)*masa;
        
        end
        %Grafico ya todo los puntos en una unidad de tiempo.
        Grafica=plot3(Posicion(:,1),Posicion(:,2),Posicion(:,3),'bo','MarkerFaceColor','c');
        %Grafico vectores que muestran la velocidad instantanea de cada
        %particula.
                    axux=ones(p,1);
                for ix=1:1:p
                    ax=[Posicion(ix,1),Posicion(ix,1)+Velocidad(ix,1)*10];
                    ay=[Posicion(ix,2),(Posicion(ix,2)+Velocidad(ix,2)*10)*1];
                    az=[Posicion(ix,3),(Posicion(ix,3)+Velocidad(ix,3)*10)*1];
                    axux(ix)=plot3(ax,ay,az,'c');
                end 
        pause(0.01)
        delete(Grafica)
        delete(axux(:))
        
        
        
   end
  %Finalizo graficando todos los puntos para una presentación final
   Grafica=plot3(Posicion(:,1),Posicion(:,2),Posicion(:,3),'bo','MarkerFaceColor','c');
   
end
    %calculando los datos resultantes
        %Momento del sistema_promedio
            
            Cant_momento_m=ones(n,1);
            Cant_momento_m_pp=ones(n,1);
            Cant_momento_promedio=0;
            Cant_momento_promedio_pp=0;
        for kg=1:1:n
            Cant_momento_s=0;
            for k=1:1:p    
            Cant_momento_s=Cant_momento_s+Cant_momento(k,kg);
            end
            Cant_momento_m(kg)=Cant_momento_s;
            Cant_momento_m_pp(kg)=Cant_momento_s/p;
            %Cant_momento_promedio=Cant_momento_promedio+Cant_momento_m(kg);
            Cant_momento_promedio_pp=Cant_momento_promedio+Cant_momento_m_pp(kg);
        end
        Cant_momento_promedio =0;
        for k=1:1:n
            Cant_momento_promedio=Cant_momento_promedio+Cant_momento_m(k);        
        end
        Cant_momento_promedio1=Cant_momento_promedio/n;

    figure(2);
    %Cant_momento_m
   % Cant_momento
    %Mod_velocidad
    
    %histograma para la frecuencia de velocidades durante la ejecución
    hist(Mod_velocidad)
    title('Histograma de frecencias para la velocidad promedio')
    
    disp('Cantidad de movimiento promedio del sistema:')
        disp(Cant_momento_promedio1)
    disp('Cantidad de movimiento promedio de particula:')
        disp(Cant_momento_promedio_pp/n)
        
    %Centro de masa promedio
            cgm_x=0;
            cgm_y=0;
            cgm_z=0;
        for k=1:1:n    
            cgm_x=cgm_x+Sum_p(k,1);
            cgm_y=cgm_y+Sum_p(k,2);
            cgm_z=cgm_z+Sum_p(k,3);
        end
            cgm_x=cgm_x/n;
            cgm_y=cgm_y/n;
            cgm_z=cgm_z/n;
    disp('Centro de masa promedio: r(x,y,z)')
    CGm=[cgm_x,cgm_y,cgm_z];
    
    disp(CGm)
    
end