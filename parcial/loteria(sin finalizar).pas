El Instituto de Lotería y Casinos está analizando la información de los ganadores de la quiniela. 
El Instituto dispone de una estructura de datos con información de todos los ganadores. 
De cada ganador se conoce: nombre y apellido, edad (entre 18 y 99 años), número que resultó ganador, 
código de la agencia donde jugó y monto del premio otorgado. La información se encuentra ordenada por código de agencia.

A. Realice un módulo que reciba la información de todos los ganadores y una edad, y retorne la información de todos
 los ganadores que superan dicha edad.

cargar_lista_ganadores(L)//se dispone
edad_ganadores(L,g)


B. Realice un módulo que reciba la información de todos los ganadores mayores de 30 años y, a partir de la misma, informe:

Monto total otorgado por cada agencia.

- Cantidad de ocurrencias de cada dígito (del 0 al 9) entre los números ganadores.

Nombre y apellido del ganador que recibió el mayor premio.

Nota: incluir el programa principal donde se invoquen los módulos implementados.


procedure inicializarVector( v : vector_nros_ganadores );
var
    i:rango_nros_ganadores;
begin
        for i:= 0 to 9 do
            v[i]:=0;
        end;
end;
procedure descomponer_digitos ( num:integer );
var 
    i:rango_nros_ganadores;
    v:vector_nros_ganadores;
begin
    while (num <> 0) do
        num := num MOD 10; 
        v[i] := v[i] + 1;
        num := num DIV 10;
    end;
end;

function digito_maximo (v:vector_nros_ganadores): rango_nros_ganadores;
var
    i, dig_max:rango_nros_ganadores;
    max:integer;
begin
    max:= -1;
    for i:= 0 to 9 do
        if (v[i] > max) then
            max := v[i];
            dig_max := max;
        end; 
    end;
    digito_maximo := dig_max;
end;

//Monto total otorgado por cada agencia.
procedure procesar_datos (L:lista; var cant_agencia:integer);
var
    cant_agencia:integer;
    g:ganadores;
    v:vector_nros_ganadores;
    agencia_actual:lista;
begin
    inicializarVector(v);
    cant_agencia:= 0;
    while (L <> NIL) AND (L^.dato.edad > 30 ) do begin
        agencia_actual:= L^.dato.codigo_agencia;
        while ( L^.dato.codigo_agencia = agencia_actual) do begin
            cant_agencia := cant_agencia + L^.dato.monto_premio;
            L:=L^.sig;
            end;
        end;
        L:=L^.sig;
        descomponer_digitos(v,L^.dato.nro_ganador);
        write ("el numero max es", digito_maximo(v));
    end;
    
end;    

program loteria_y_casino;

const limite_edad = 99;

type 
    rango_edades = 18..limite_edad;
    rango_nros_ganadores = 0..9;

    ganadores = record
        nombre_y_apellido:string;
        edad:rango_edades;
        nro_ganador:integer;
        codigo_agencia:integer;
        monto_premio:real;
    end;
    vector_nros_ganadores = array [rango_nros_ganadores] of integer;


    lista = ^nodo;
    nodo = record  
        dato:ganadores;
        sig:lista;
    end;


procedure edad_ganadores(L:lista; var num:integer);
var
    aux:lista;
begin
    aux:= L^.dato.ganadores;
    write("escriba una edad entre 18 y 99")
    read(num);
    while (L^.dato.edad > num ) do 
        begin
            write(aux.nombre_y_apellido);
            write(aux.edad);
            write(aux.nro_ganador);
            write(aux.codigo_agencia);
            write(aux.monto_premio);
        end;
    end;
end;

