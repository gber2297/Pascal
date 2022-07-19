El Instituto de Loteria y Casinos está analizando la información de los ganadores de la quiniela. 
El Instituto dispone de una estructura de datos con información de todos los ganadores.
 De cada ganador se conoce: nombre y apellido, edad (entre 18 y 99 años), número que resultó ganador, 
 código de la agencia donde jugó y monto del premio otorgado. La información se encuentra ordenada por código de agencia

A. Realice un módulo que reciba la información de todos los ganadores y una edad, 
y retorne la información de todos los ganadores de premios de más de 10.000 pesos que superan dicha edad.

procesar_datos(L,num); 
//inciso A

procedure agregar_adelante (var L:lista; g:ganadores);
var
    aux:Lista;
begin
    new(aux);
    aux^.dato:=g;
    aux^.sig:=L;
    L:= aux;
end;

procedure lista_cumplen (L:lista; num:integer; var lista_cumplen:lista);
var
    aux:lista;
begin
    write("escriba un numero entre 18 y 99");
    read(num)
    while (L <> NIL) do 
        begin
            aux:= L^.dato.ganadores
            if (L^.dato.edad > num) AND (L^.dato.monto_premio > 10000 ) then
            agregar_adelante(lista_cumplen,aux)
            end;
        end;
    end;
end;



B. Realice un módulo que reciba la información de todos los ganadores de premios de más de 10.000 pesos mayores 
de 19 años y, a partir de la misma, informe:


procedure inicializar_vector(v:vector_edades);
var
    i:rango_edades;
begin
    for i:=18 to 99 do
        v[i] := 0;
end;
procedure procesar_edades_max (L:lista; var nombre1, nombre2:integer);
var 
    max1, max2: integer;
    aux:lista;
    nombre1,nombre2:string;
begin
    max1:=0;
    max2:=0;
    nombre1:= " ";
    nombre2:= " ";
    while ( L <> NIL ) do begin
    aux:=lista^.dato.ganadores;
    if ( aux.edad > max1 ) then
        begin
            max2:=max1;
            max1:=aux.edad;
            nombre1:= aux.nombre_y_apellido;
        end;
        else 
            if (aux.edad > max2) then
            max2:=aux.edad;
            nombre2:= aux.nombre_y_apellido; 
    end;
    L:=L^.sig;
end;


procedure procesar_datos_e_imprimir ( L: lista )
var
    g:ganadores;
    monto_total:real;
    aux: lista;
    cant_num_mult_10:integer;
    promedio:real;
    actual:lista;
begin
    aux:= L^.dato.ganadores;
    cant_num_mult_10 := 0;
    monto_total:= 0;

    while ( L <> NIL ) AND ( L^.dato.edad > 19 ) do
    begin
        actual:= aux.codigo_agencia;
        while ( aux.codigo_agencia = actual ) do 
        begin
        monto_total := monto_total + aux.monto_premio;
        end;
    if( (aux.nro_ganador MOD 10) = 0) then
    cant_num_mult_10 := cant_num_mult_10 + 1;
    procesar_edades_max(nombre1, nombre2);
    end;
    prom
end;

-Monto promedio otorgado por cada agencia.

-Cantidad de números ganadores múltiplos de 10.





-Nombre y apellido de los dos ganadores de mayor edad.



Nota: incluir el programa principal donde se invoquen los módulos implementados.




program loteria_y_casino2;

type 
    rango_edades:18..99;

    ganadores = record
        nombre_y_apellido:string;
        edad:rango_edades;
        nro_ganador:integer;
        codigo_agencia:integer;
        monto_premio:real;
    end;

    lista = ^nodo;
    nodo = record
        dato:ganadores;
        sig:lista;
    end;

    vector_edades = array [rango_edades] of integer;