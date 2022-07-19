productos de panaderia, 26 categorias: nombre y precio x kg

la panaderia dispone de la informacion de todas las compras realizadas en el año, compras: dni cliente, cat. producto, cantKilos

la informacion viene ordenada por dni

a) realizar modulo que retorne la info de las categorias. la info se lee sin orden, de las cat. se lee: cod, nombre y precioxkg

b) realizar un modulo que reciba la info de compras y retorne:

1. dni cliente que mas compras hizo
2. monto total recaudado
3. cantidad total de clientes con al menos 3 dig impares en su dni






program parcial;

const

    cantCategorias = 26; 

type 
    rangoCategorias = 1..cantCategorias;
    categorias = record
        nombre: string;
        precio: real;
    end;

    vectorCategorias = array [rangoCategorias] of categorias;

    compras = record
        dni: integer;
        catProducto: categorias;
        cantKilos:real;
    end;

    vectorMontos = array [rangoCategorias] of real;

    lista = ^nodo;
    nodo = record  
        dato: compras;
        sig: lista;
    end;

a) realizar modulo que retorne la info de las categorias. la info se lee sin orden, de las cat. se lee: cod, nombre y precioxkg

procedure cargarCategorias (var v: vectorCategorias);
var 
    i,cod:rangoCategorias;
    cat: categorias;

begin
    for i := 1 to cantCategorias do 
    begin
        leerCategoria(cat,cod);
        v[cod]:= cat;
    end;   
end;

procedure leerCategoria (var cat:categorias; var cod:rangoCategorias);
begin
    readln(cat.nombre);
    readln(cat.precio);
    readln(cod);
end;

procedure procesarCompras (var DNIMax: integer; c:compras; var montos: vectorMontos; vecCategorias: vectorCategorias, tieneAlmenos3Pares: boolean; var cantCompras:integer )
var
    cantComprasMax: integer;
    DNIActual, cantComprasActual:integer;
begin
    cantCompras:= 0;
    inicializarVector(montos)
    cantComprasMax:= 0;

    while (L <> NIL) do begin
        DNIActual:= l^.dato.dni;
        cantComprasActual := 0;
        while (L <> NIL) and (l^.dato.dni = DNIActual) do begin
        cantComprasActual := cantComprasActual + 1;
        montos [l^.dato.categoria] := montos[l^.dato.categoria] + (montos[l^.dato.cantKilos]* vec[l^.dato.categoria].precio);+
        
        if (tieneAlmenos3Pares(l^.dato.DNI)) then
            cantCompras := cantCompras +1;
        L:= L^.sig;
        end;

    end;
    actualMax(DNIActual, cantComprasActual, DNIMax, cantComprasMax)
end;
    

function tieneAlmenos3Pares (num:integer): boolean;
var
    cantPares :integer;
begin
    cantPares:=0;
    while (num <> 0) and (cantPares < 3 ) do 
    begin
    if ((num MOD 10) MOD 2 = 0)  then
        cantPares := cantPares +1;
        num := num DIV 10;
    end;
    tieneAlmenos3Pares := (cantPares=3);
end;



procedure inicializarVector (var v: vectorMontos);
var 
 i: rangoMontos ;
begin
    for i:= 1 to cargarCategorias do v[i] := 0;
end;

procedure actualizarMax ( dni, cantCompras: integer; var maxDNI, maxCompras:integer);
begin
    if (cantCompras > maxCompras ) then
        maxCompras := cantCompras
        maxDNI := dni
end;


var 
L: lista;
vecCategorias: vectorCategorias;
vecMontos: vectorMontos;

begin
    cargarLista (L);//se dispone
    cargarCategorias(vec);
    procesarCompras (L, vec, DNIMax, montos, cantCompras);
end.

