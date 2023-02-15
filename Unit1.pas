unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit2, Vcl.ComCtrls;

type
    TForm1 = class(TForm)
    Button1: TButton;
    DateTimePicker1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  contadorEgresos:        Integer;
  contadorRemito:         Integer;
  contadorFacturas:       Integer;
  contadorvendedores:     Integer;
  contadorItefac:         Integer;
  contadorItemremito:     Integer;
  contadorarticulos:      Integer;
  contadorCobranzas:      Integer;
  contadorIngresos:       Integer;
  contadorClientes:       Integer;
  contadorStock:          Integer;

  //Datos de base de datos
  //compartidos
  ID_tabla:               Integer;

  Descripcion:            String;
  Fecha:                  String;
  Monto:                  Double;
  Fecha_desde:            String;
  Fecha_hasta:            String;
  Nombre:                 String;
  Observaciones:          String;
  Usuario:                Integer;

  Numero:                 Integer;
  NombreCli:              String;
  CodCliente:             Integer;
  DirCliente:             String;
  CuitCliente:            String;
  TipoIva:                Integer;
  Condiciones:            String;
  Vendedor:               Integer;
  Total:                  Double;
  FechaVenc:              String;
  Neto:                   Double;
  Tarjeta:                String;
  NroTarjeta:             String;
  MontoTarjeta:           Double;
  Efectivo:               Double;
  TipoFactura:            String;
  Saldo:                  Double;
  MontoDescuento:         Double;
  Descuento:              Double;
  PagaComision:           Boolean;
  Comision:               Double;
  Localidad:              String;
  Facturado:              Boolean;
  Cheque:                 Double;
  ChequeNro:              String;
  ChequeFecha:            String;
  ChequeBanco:            String;
  Transporte:             Integer;
  MontoComision:          Double;
  DescontoStock:          Boolean;
  Turno: Integer;
  Provincia:              String;
  Pventa:                 String;
  Subido:                 Boolean;
  Numero_str:             STring;
  TotalConRedondeo:       Double;
  MontoIVA1:              Double;
  MontoIVA2:              Double;

  PresupuestoNro:         Integer;
  NC:                     Boolean;
  Proforma:               Boolean;
  Dolar:                  Boolean;
  RemitoNro:              String;
  Zona:                   String;
  NroOrdenCompra:         String;
  Descontado:             Boolean;
  MontoSenia:             Double;
  NetoNoGravado:          Double;
  Neto1:                  Double;
  Neto2:                  Double;
  Impuesto:               Double;
  CAE:                    String;
  FechaVenceCAE:          String;
  PorcentajeTarjeta:      Double;
  Impuesto2:              Double;
  MontoPuntos:            Double;
  CotizacionDolar:        Double;
  TotalDolar:             Double;

  Codigo:                 Integer;
  CodigoStr:              String;
  Direccion:              String;
  Telefono:               String;
  Celular:                String;
  Sueldo:                 Double;
  mail:                   String;
  Documento:              String;
  CP:                     String;
  ComisionSobreNeto:      Boolean;
  Clave:                  String;

  Id:                     Integer;
  Cantidad:               Double;
  CodArticulo:            String;
  Marca:                  String;
  PrecUni:                Double;
  Iva:                    Double;
  Costo:                  Double;
  NroIVA:                 Integer;
  CostoPromedio:          Double;
  Unidad:                 String;
  Talle:                  String;
  ColorTabla:             String;
  PorcentajeComision:     Double;

  CantBultos:             Double;
  ArtxBulto:              Double;
  RemanenteBulto:         Double;

  Rubro:                  String;
  PrecioVenta:            Double;
  PrecioCompra:           Double;
  StockMinimo:            Double;
  Stock:                  Double;
  AlicuotaIva:            Double;
  Deposito:               Double;
  FechaCompra:            String;
  idProveedor:            Integer;
  Lista2:                 Double;
  Lista3:                 Double;
  Lista4:                 Double;
  PorcentajeGanancia:     Double;
  Calculado:              Double;
  CalculadoBoolean:       Boolean;
  CodigoProv:             String;
  CostoEnDolares:         Boolean;
  FechaModif:             String;
  PrecioListaProveedor:   Double;
  StockInicial:           Double;
  Ubicacion:              String;
  Lista1EnDolares:        Boolean;
  Dto1:                   Double;
  Dto2:                   Double;
  Dto3:                   Double;
  EnPromocion:            Boolean;
  UsaTalle:               Boolean;
  Compuesto:              Boolean;
  Combustible:            Boolean;
  ImpuestoPorcentual:     Boolean;

  NroDoc:                 String;
  Vence:                  String;
  Movimiento:             String;
  TotalFactura:           Double;
  Pago:                   Double;
  CodigoCliente:          Integer;
  ReciboNro:              Integer;
  Obs:                    String;
  Tipo:                   String;
  FormaPago:              String;
  NroCheque:              String;
  Banco:                  String;
  FechaCheque:            String;
  Queda:                  Boolean;
  idFactura:              Integer;
  Avanzada:               Boolean;

  HoraInicial:            TDateTime;
  HoraFinal:              TDateTime;
  HoraResultado:          TDateTime;
  Msg:                    String;
  Bases:                  TStrings;
  i:                      Integer;
  BD_name:                TStringList;

  MaxValorEgreso_base:    Integer;
  MaxValorEgreso_unif:    Integer;

 //
 // Tablas_sistema: array[0..999] of String;
 // Tablas: array[0..9] of String;


implementation

{$R *.dfm}

//Funcion a la cual se le debe pasar la carpeta donde estan las distintas bases de datos. Cada carpeta dentro de esta debe tener el nombre de
// la base de datos con la cual se va a almacenar en la tabla centralizadora
procedure ListFolder(Dir:String; Salida: TStrings);
var
  sr: TSearchRec;
begin
    if FindFirst(Dir + '\*.*', faAnyFile, sr) = 0 then
    repeat
       if (sr.Name <> '.') and (sr.Name <> '..') then
       begin
          if (sr.Attr and faDirectory)<>0 then
          begin
             // Para a�adir la carpeta actual
             Salida.Add(Dir + '\' + sr.Name);
             // Para a�adir subcarpetas
             ListFolder(Dir + '\' + sr.Name, Salida);
          end;
       end;
    until FindNext(sr)<>0;
    FindClose(sr);
end;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True; // Requere D2006 o superior.
   ListOfStrings.DelimitedText   := Str;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin

    // Inicializo array de tablas, tanto sistema como nuevas
    //Tablas_sistema[0]  := 'tbfacturas';
    //Tablas_sistema[1]  := 'tbremito';
    //Tablas_sistema[2]  := 'tbvendedores';
    //Tablas_sistema[3]  := 'tbegresos';
    //Tablas_sistema[4]  := 'tbitefac';
    //Tablas_sistema[5]  := 'tbitemremito';
    //Tablas_sistema[6]  := 'tbarticulos';
    //Tablas_sistema[7]  := 'tbcobranzas';
    //Tablas_sistema[8]  := 'tbingresos';
    //Tablas_sistema[9]  := 'tbclientes';

    //Tablas[0]  := 'facturas';
    //Tablas[1]  := 'remito';
    //Tablas[2]  := 'vendedores';
    //Tablas[3]  := 'egresos';
    //Tablas[4]  := 'itefac';
    //Tablas[5]  := 'itemremito';
    //Tablas[6]  := 'articulos';
    //Tablas[7]  := 'cobranzas';
    //Tablas[8]  := 'ingresos';
    //Tablas[9]  := 'clientes';

    Bases := TStringList.Create;
    //Ruta donde esta la carpeta con las BD
    ListFolder('E:\Dropbox\Lisboa\Unifica DB', Bases);

    //Recupero fecha del mes. Tomo el primer dia del mes y primer dia del proximo mes
    Fecha_desde  := formatdatetime('01/mm/yyyy',DateTimePicker1.Date);
    Fecha_hasta  := DateToStr(IncMonth( StrToDate(Fecha_desde),1));

    // Guarda hora ed inicio de proceso
    HoraInicial:=now;

    // Inicializa el Msg box
    Msg := '';

    if (Bases.Count > 0) then
    begin


      for i := 0 to Bases.Count -1 do
      begin
          //Base de datos
          Unit2.DataModule2.BDLocal.Connected  := False;
          Unit2.DataModule2.BDLocal.DatabaseFileName := Bases[i] + '\tablas.abs';
          Unit2.DataModule2.BDLocal.DatabaseName := Bases[i] + '\tablas.abs';

          Unit2.DataModule2.ABSQuery1.Active  := False;
          Unit2.DataModule2.ABSQuery1.DatabaseName  := Bases[i] + '\tablas.abs';


          //Facturas
          Unit2.DataModule2.TLocalFacturas.Active := False;
          Unit2.DataModule2.TLocalFacturas.DatabaseName := Bases[i] + '\tablas.abs';

          //Remitos
          Unit2.DataModule2.TLocalRemito.Active := False;
          Unit2.DataModule2.TLocalRemito.DatabaseName := Bases[i] + '\tablas.abs';

          //Vendedores
          Unit2.DataModule2.TLocalVendedores.Active := False;
          Unit2.DataModule2.TLocalVendedores.DatabaseName := Bases[i] + '\tablas.abs';

          //Egresos
          Unit2.DataModule2.TLocalEgresos.Active := False;
          Unit2.DataModule2.TLocalEgresos.DatabaseName := Bases[i] + '\tablas.abs';

          //tbitefac
          Unit2.DataModule2.TLocalItemsFac.Active := False;
          Unit2.DataModule2.TLocalItemsFac.DatabaseName := Bases[i] + '\tablas.abs';

          //tbimsRemitos
          Unit2.DataModule2.TLocalItemsRemito.Active := False;
          Unit2.DataModule2.TLocalItemsRemito.DatabaseName := Bases[i] + '\tablas.abs';

          //Articulos
          Unit2.DataModule2.TLocalArticulos.Active := False;
          Unit2.DataModule2.TLocalArticulos.DatabaseName := Bases[i] + '\tablas.abs';

          //Cobranzas
          Unit2.DataModule2.TLocalCobranzas.Active := False;
          Unit2.DataModule2.TLocalCobranzas.DatabaseName := Bases[i] + '\tablas.abs';

          //Ingresos
          Unit2.DataModule2.TLocalIngresos.Active := False;
          Unit2.DataModule2.TLocalIngresos.DatabaseName := Bases[i] + '\tablas.abs';

          //Clientes
          Unit2.DataModule2.TLocalClientes.Active := False;
          Unit2.DataModule2.TLocalClientes.DatabaseName := Bases[i] + '\tablas.abs';


          Unit2.DataModule2.BDLocal.Connected         := True;
          //Unit2.DataModule2.ABSQuery1.Active          := True;

          Unit2.DataModule2.TLocalFacturas.Active     := True;
          Unit2.DataModule2.TLocalRemito.Active       := True;
          Unit2.DataModule2.TLocalVendedores.Active   := True;
          Unit2.DataModule2.TLocalEgresos.Active      := True;
          Unit2.DataModule2.TLocalItemsFac.Active     := True;
          Unit2.DataModule2.TLocalItemsRemito.Active  := True;
          Unit2.DataModule2.TLocalArticulos.Active    := True;
          Unit2.DataModule2.TLocalCobranzas.Active    := True;
          Unit2.DataModule2.TLocalIngresos.Active     := True;
          Unit2.DataModule2.TLocalClientes.Active     := True;


          BD_name  := TStringList.Create;

          //separa el nombre de la ruta para quedarnos con el nombre de la base de datos a trabajar
          Split('\', Bases[i] , BD_name) ;


          // BD_name[4] -- Toma la parte del Path donde esta en nombre de la BD
          Msg := Msg + #13 + ' ********** Data Base ' + BD_name[4] + ' ********** ';


          //*************************************************************************************************************
          //************************************ TABLA EGRESOS **********************************************************
          //*************************************************************************************************************

          // inicializa contador
          contadorEgresos := 0;

          //Cierro Base de datos
          Unit2.DataModule2.ABSQuery1.Close;
          Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbegresos;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from egresos where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin
            //Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbegresos where fecha >=  :Fecha_desde and fecha < :Fecha_hasta;';
            //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_desde').Value := Fecha_desde;
            //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_hasta').Value := Fecha_hasta;

            //Habilitar solamente si se quiere hacer una carga masiva, ya que el original solamente acota por el mes
            Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbegresos;';

            Unit2.DataModule2.ABSQuery1.Open;

              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  ID_tabla := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  Fecha := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Fecha').AsDateTime);
                  Descripcion := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                  Monto := Unit2.DataModule2.ABSQuery1.FieldByName('Monto').AsFloat;
                  Nombre := Unit2.DataModule2.ABSQuery1.FieldByName('Nombre').AsString;
                  Observaciones := Unit2.DataModule2.ABSQuery1.FieldByName('Observaciones').AsString;
                  Usuario := Unit2.DataModule2.ABSQuery1.FieldByName('Usuario').AsInteger;

                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from egresos where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into egresos (Fecha, Descripcion, Monto, Nombre, Observaciones, Usuario, id_tabla, Base_datos ) value (:Fecha,:Descripcion,:Monto,:Nombre,:Observaciones,:Usuario,:id_tabla,:Base_datos);';
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Fecha').Value := Fecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Monto').Value := Monto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Nombre').Value := Nombre;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Observaciones').Value := Observaciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Usuario').Value := Usuario;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ID_tabla').Value := ID_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorEgresos:= contadorEgresos + 1;
                    end;
                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Egresos - Cant. insertados: ' + InttoStr(contadorEgresos);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Egresos - no tuvo ningun nuevo registro';
            end;

          //*************************************************************************************************************
          //************************************ TABLA REMITO ***********************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorRemito := 0;

          //Cierro Base de datos
          //Unit2.DataModule2.ABSQuery1.Close;
          //Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbremito;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from remito where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin
              //Seteo Query
              //Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbremito where fecha >=  :Fecha_desde and fecha < :Fecha_hasta;';
              //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_desde').Value := Fecha_desde;
              //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_hasta').Value := Fecha_hasta;

              //Habilitar solamente si se quiere hacer una carga masiva, ya que el original solamente acota por el mes
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbremito;';


              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;

              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  ID_tabla        := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  Numero          := Unit2.DataModule2.ABSQuery1.FieldByName('Numero').AsInteger;
                  Fecha           := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Fecha').AsDateTime);
                  NombreCli       := Unit2.DataModule2.ABSQuery1.FieldByName('NombreCli').AsString;
                  CodCliente      := Unit2.DataModule2.ABSQuery1.FieldByName('CodCliente').AsInteger;
                  DirCliente      := Unit2.DataModule2.ABSQuery1.FieldByName('DirCliente').AsString;
                  CuitCliente     := Unit2.DataModule2.ABSQuery1.FieldByName('CuitCliente').AsString;
                  TipoIva         := Unit2.DataModule2.ABSQuery1.FieldByName('TipoIva').AsInteger;
                  Condiciones     := Unit2.DataModule2.ABSQuery1.FieldByName('Condiciones').AsString;
                  Vendedor        := Unit2.DataModule2.ABSQuery1.FieldByName('Vendedor').AsInteger;
                  Total           := Unit2.DataModule2.ABSQuery1.FieldByName('Total').AsFloat;
                  FechaVenc       := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaVenc').AsDateTime);
                  Neto            := Unit2.DataModule2.ABSQuery1.FieldByName('Neto').AsFloat;
                  Tarjeta         := Unit2.DataModule2.ABSQuery1.FieldByName('Tarjeta').AsString;
                  NroTarjeta      := Unit2.DataModule2.ABSQuery1.FieldByName('NroTarjeta').AsString;
                  MontoTarjeta    := Unit2.DataModule2.ABSQuery1.FieldByName('MontoTarjeta').AsFloat;
                  Efectivo        := Unit2.DataModule2.ABSQuery1.FieldByName('Efectivo').AsFloat;
                  TipoFactura     := Unit2.DataModule2.ABSQuery1.FieldByName('TipoFactura').AsString;
                  Saldo           := Unit2.DataModule2.ABSQuery1.FieldByName('Saldo').AsFloat;
                  MontoDescuento  := Unit2.DataModule2.ABSQuery1.FieldByName('MontoDescuento').AsFloat;
                  Descuento       := Unit2.DataModule2.ABSQuery1.FieldByName('Descuento').AsFloat;
                  PagaComision    := Unit2.DataModule2.ABSQuery1.FieldByName('PagaComision').AsBoolean;
                  Comision        := Unit2.DataModule2.ABSQuery1.FieldByName('Comision').AsFloat;
                  Localidad       := Unit2.DataModule2.ABSQuery1.FieldByName('Localidad').AsString;
                  Facturado       := Unit2.DataModule2.ABSQuery1.FieldByName('Facturado').AsBoolean;
                  Cheque          := Unit2.DataModule2.ABSQuery1.FieldByName('Cheque').AsFloat;
                  ChequeNro       := Unit2.DataModule2.ABSQuery1.FieldByName('ChequeNro').AsString;
                  ChequeFecha     := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('ChequeFecha').AsDateTime);
                  ChequeBanco     := Unit2.DataModule2.ABSQuery1.FieldByName('ChequeBanco').AsString;
                  Transporte      := Unit2.DataModule2.ABSQuery1.FieldByName('Transporte').AsInteger;
                  MontoComision   := Unit2.DataModule2.ABSQuery1.FieldByName('MontoComision').AsFloat;
                  Observaciones   := Unit2.DataModule2.ABSQuery1.FieldByName('Observaciones').AsString;
                  DescontoStock   := Unit2.DataModule2.ABSQuery1.FieldByName('DescontoStock').AsBoolean;
                  Usuario         := Unit2.DataModule2.ABSQuery1.FieldByName('Usuario').AsInteger;
                  Turno           := Unit2.DataModule2.ABSQuery1.FieldByName('Turno').AsInteger;
                  Provincia       := Unit2.DataModule2.ABSQuery1.FieldByName('Provincia').AsString;
                  Pventa          := Unit2.DataModule2.ABSQuery1.FieldByName('Pventa').AsString;
                  Subido          := Unit2.DataModule2.ABSQuery1.FieldByName('Subido').AsBoolean;


                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from remito where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into remito '
                      + '(Numero,          '
                      + 'Fecha,            '
                      + 'NombreCli,        '
                      + 'CodCliente,       '
                      + 'DirCliente,       '
                      + 'CuitCliente,      '
                      + 'TipoIva,          '
                      + 'Condiciones,      '
                      + 'Vendedor,         '
                      + 'Total,            '
                      + 'FechaVenc,        '
                      + 'Neto,             '
                      + 'Tarjeta,          '
                      + 'NroTarjeta,       '
                      + 'MontoTarjeta,     '
                      + 'Efectivo,         '
                      + 'TipoFactura,      '
                      + 'Saldo,            '
                      + 'MontoDescuento,   '
                      + 'Descuento,        '
                      + 'PagaComision,     '
                      + 'Comision,         '
                      + 'Localidad,        '
                      + 'Facturado,        '
                      + 'Cheque,           '
                      + 'ChequeNro,        '
                      + 'ChequeFecha,      '
                      + 'ChequeBanco,      '
                      + 'Transporte,       '
                      + 'MontoComision,    '
                      + 'Observaciones,    '
                      + 'DescontoStock,    '
                      + 'Usuario,          '
                      + 'Turno,            '
                      + 'Provincia,        '
                      + 'Pventa,           '
                      + 'Subido,           '
                      + 'id_tabla,         '
                      + 'Base_datos)       '
                      + 'value             '
                      + '(:Numero,         '
                      + ':Fecha,           '
                      + ':NombreCli,       '
                      + ':CodCliente,      '
                      + ':DirCliente,      '
                      + ':CuitCliente,     '
                      + ':TipoIva,         '
                      + ':Condiciones,     '
                      + ':Vendedor,        '
                      + ':Total,           '
                      + ':FechaVenc,       '
                      + ':Neto,            '
                      + ':Tarjeta,         '
                      + ':NroTarjeta,      '
                      + ':MontoTarjeta,    '
                      + ':Efectivo,        '
                      + ':TipoFactura,     '
                      + ':Saldo,           '
                      + ':MontoDescuento,  '
                      + ':Descuento,       '
                      + ':PagaComision,    '
                      + ':Comision,        '
                      + ':Localidad,       '
                      + ':Facturado,       '
                      + ':Cheque,          '
                      + ':ChequeNro,       '
                      + ':ChequeFecha,     '
                      + ':ChequeBanco,     '
                      + ':Transporte,      '
                      + ':MontoComision,   '
                      + ':Observaciones,   '
                      + ':DescontoStock,   '
                      + ':Usuario,         '
                      + ':Turno,           '
                      + ':Provincia,       '
                      + ':Pventa,          '
                      + ':Subido,          '
                      + ':id_tabla,        '
                      + ':Base_datos);     ';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Numero').Value := Numero;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Fecha').Value := Fecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NombreCli').Value := NombreCli;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodCliente').Value := CodCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('DirCliente').Value := DirCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CuitCliente').Value := CuitCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TipoIva').Value := TipoIva;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Condiciones').Value := Condiciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Vendedor').Value := Vendedor;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Total').Value := Total;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaVenc').Value := FechaVenc;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Neto').Value := Neto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Tarjeta').Value := Tarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroTarjeta').Value := NroTarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoTarjeta').Value := MontoTarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Efectivo').Value := Efectivo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TipoFactura').Value := TipoFactura;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Saldo').Value := Saldo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoDescuento').Value := MontoDescuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descuento').Value := Descuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PagaComision').Value := PagaComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Comision').Value := Comision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Localidad').Value := Localidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Facturado').Value := Facturado;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Cheque').Value := Cheque;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeNro').Value := ChequeNro;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeFecha').Value := ChequeFecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeBanco').Value := ChequeBanco;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Transporte').Value := Transporte;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoComision').Value := MontoComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Observaciones').Value := Observaciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('DescontoStock').Value := DescontoStock;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Usuario').Value := Usuario;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Turno').Value := Turno;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Provincia').Value := Provincia;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Pventa').Value := Pventa;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Subido').Value := Subido;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorRemito:= contadorRemito + 1;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Remito - Cant. insertados: ' + InttoStr(contadorRemito);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Remito - no tuvo ningun nuevo registro';
            end;

          //*************************************************************************************************************
          //************************************ TABLA FACTURAS *********************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorFacturas := 0;

          //Cierro Base de datos
          //Unit2.DataModule2.ABSQuery1.Close;
          //Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbfacturas;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from facturas where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin
              //Seteo Query
              //Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbfacturas where fecha >=  :Fecha_desde and fecha < :Fecha_hasta;';
              //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_desde').Value := Fecha_desde;
              //Unit2.DataModule2.ABSQuery1.Params.ParamByName('Fecha_hasta').Value := Fecha_hasta;

              //Habilitar solamente si se quiere hacer una carga masiva, ya que el original solamente acota por el mes
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbfacturas;';

              //Ejecuto sentencia
                //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;

              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  ID_tabla            := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  Numero_str          := Unit2.DataModule2.ABSQuery1.FieldByName('Numero').AsString;
                  Fecha               := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Fecha').AsDateTime);
                  NombreCli           := Unit2.DataModule2.ABSQuery1.FieldByName('NombreCli').AsString;
                  CodCliente          := Unit2.DataModule2.ABSQuery1.FieldByName('CodCliente').AsInteger;
                  DirCliente          := Unit2.DataModule2.ABSQuery1.FieldByName('DirCliente').AsString;
                  CuitCliente         := Unit2.DataModule2.ABSQuery1.FieldByName('CuitCliente').AsString;
                  TipoIva             := Unit2.DataModule2.ABSQuery1.FieldByName('TipoIva').AsInteger;
                  Condiciones         := Unit2.DataModule2.ABSQuery1.FieldByName('Condiciones').AsString;
                  Vendedor            := Unit2.DataModule2.ABSQuery1.FieldByName('Vendedor').AsInteger;
                  FechaVenc           := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaVenc').AsDateTime);
                  Total               := Unit2.DataModule2.ABSQuery1.FieldByName('Total').AsFloat;
                  TotalConRedondeo    := Unit2.DataModule2.ABSQuery1.FieldByName('TotalConRedondeo').AsFloat;
                  Neto                := Unit2.DataModule2.ABSQuery1.FieldByName('Neto').AsFloat;
                  MontoIVA1           := Unit2.DataModule2.ABSQuery1.FieldByName('MontoIVA1').AsFloat;
                  MontoIVA2           := Unit2.DataModule2.ABSQuery1.FieldByName('MontoIVA2').AsFloat;
                  Tarjeta             := Unit2.DataModule2.ABSQuery1.FieldByName('Tarjeta').AsString;
                  NroTarjeta          := Unit2.DataModule2.ABSQuery1.FieldByName('NroTarjeta').AsString;
                  MontoTarjeta        := Unit2.DataModule2.ABSQuery1.FieldByName('MontoTarjeta').AsFloat;
                  Efectivo            := Unit2.DataModule2.ABSQuery1.FieldByName('Efectivo').AsFloat;
                  PresupuestoNro      := Unit2.DataModule2.ABSQuery1.FieldByName('PresupuestoNro').AsInteger;
                  TipoFactura         := Unit2.DataModule2.ABSQuery1.FieldByName('TipoFactura').AsString;
                  Saldo               := Unit2.DataModule2.ABSQuery1.FieldByName('Saldo').AsFloat;
                  montodescuento      := Unit2.DataModule2.ABSQuery1.FieldByName('montodescuento').AsFloat;
                  descuento           := Unit2.DataModule2.ABSQuery1.FieldByName('descuento').AsFloat;
                  NC                  := Unit2.DataModule2.ABSQuery1.FieldByName('NC').AsBoolean;
                  PagaComision        := Unit2.DataModule2.ABSQuery1.FieldByName('PagaComision').AsBoolean;
                  Comision            := Unit2.DataModule2.ABSQuery1.FieldByName('Comision').AsFloat;
                  Cheque              := Unit2.DataModule2.ABSQuery1.FieldByName('Cheque').AsFloat;
                  ChequeNro           := Unit2.DataModule2.ABSQuery1.FieldByName('ChequeNro').AsString;
                  ChequeFecha         := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('ChequeFecha').AsDateTime);
                  ChequeBanco         := Unit2.DataModule2.ABSQuery1.FieldByName('ChequeBanco').AsString;
                  Proforma            := Unit2.DataModule2.ABSQuery1.FieldByName('Proforma').AsBoolean;
                  Localidad           := Unit2.DataModule2.ABSQuery1.FieldByName('Localidad').AsString;
                  Dolar               := Unit2.DataModule2.ABSQuery1.FieldByName('Dolar').AsBoolean;
                  Observaciones       := Unit2.DataModule2.ABSQuery1.FieldByName('Observaciones').AsString;
                  RemitoNro           := Unit2.DataModule2.ABSQuery1.FieldByName('RemitoNro').AsString;
                  Usuario             := Unit2.DataModule2.ABSQuery1.FieldByName('Usuario').AsInteger;
                  Zona                := Unit2.DataModule2.ABSQuery1.FieldByName('Zona').AsString;
                  MontoComision       := Unit2.DataModule2.ABSQuery1.FieldByName('MontoComision').AsFloat;
                  NroOrdenCompra      := Unit2.DataModule2.ABSQuery1.FieldByName('NroOrdenCompra').AsString;
                  Descontado          := Unit2.DataModule2.ABSQuery1.FieldByName('Descontado').AsBoolean;
                  MontoSenia          := Unit2.DataModule2.ABSQuery1.FieldByName('MontoSenia').AsFloat;
                  NetoNoGravado       := Unit2.DataModule2.ABSQuery1.FieldByName('NetoNoGravado').AsFloat;
                  Neto1               := Unit2.DataModule2.ABSQuery1.FieldByName('Neto1').AsFloat;
                  Neto2               := Unit2.DataModule2.ABSQuery1.FieldByName('Neto2').AsFloat;
                  Impuesto            := Unit2.DataModule2.ABSQuery1.FieldByName('Impuesto').AsFloat;
                  CAE                 := Unit2.DataModule2.ABSQuery1.FieldByName('CAE').AsString;
                  FechaVenceCAE       := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaVenceCAE').AsDateTime);
                  PorcentajeTarjeta   := Unit2.DataModule2.ABSQuery1.FieldByName('PorcentajeTarjeta').AsFloat;
                  Turno               := Unit2.DataModule2.ABSQuery1.FieldByName('Turno').AsInteger;
                  Provincia           := Unit2.DataModule2.ABSQuery1.FieldByName('Provincia').AsString;
                  Impuesto2           := Unit2.DataModule2.ABSQuery1.FieldByName('Impuesto2').AsFloat;
                  MontoPuntos         := Unit2.DataModule2.ABSQuery1.FieldByName('MontoPuntos').AsFloat;
                  CotizacionDolar     := Unit2.DataModule2.ABSQuery1.FieldByName('CotizacionDolar').AsFloat;
                  TotalDolar          := Unit2.DataModule2.ABSQuery1.FieldByName('TotalDolar').AsFloat;
                  Subido              := Unit2.DataModule2.ABSQuery1.FieldByName('Subido').AsBoolean;



                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from facturas where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into facturas '
                      +'(Numero,'
                      +'Fecha,'
                      +'NombreCli,'
                      +'CodCliente,'
                      +'DirCliente,'
                      +'CuitCliente,'
                      +'TipoIva,'
                      +'Condiciones,'
                      +'Vendedor,'
                      +'FechaVenc,'
                      +'Total,'
                      +'TotalConRedondeo,'
                      +'Neto,'
                      +'MontoIVA1,'
                      +'MontoIVA2,'
                      +'Tarjeta,'
                      +'NroTarjeta,'
                      +'MontoTarjeta,'
                      +'Efectivo,'
                      +'PresupuestoNro,'
                      +'TipoFactura,'
                      +'Saldo,'
                      +'montodescuento,'
                      +'descuento,'
                      +'NC,'
                      +'PagaComision,'
                      +'Comision,'
                      +'Cheque,'
                      +'ChequeNro,'
                      +'ChequeFecha,'
                      +'ChequeBanco,'
                      +'Proforma,'
                      +'Localidad,'
                      +'Dolar,'
                      +'Observaciones,'
                      +'RemitoNro,'
                      +'Usuario,'
                      +'Zona,'
                      +'MontoComision,'
                      +'NroOrdenCompra,'
                      +'Descontado,'
                      +'MontoSenia,'
                      +'NetoNoGravado,'
                      +'Neto1,'
                      +'Neto2,'
                      +'Impuesto,'
                      +'CAE,'
                      +'FechaVenceCAE,'
                      +'PorcentajeTarjeta,'
                      +'Turno,'
                      +'Provincia,'
                      +'Impuesto2,'
                      +'MontoPuntos,'
                      +'CotizacionDolar,'
                      +'TotalDolar,'
                      +'Subido,'
                      +'id_tabla,'
                      +'Base_datos)'
                      + 'value'
                      +'(:Numero,'
                      +':Fecha,'
                      +':NombreCli,'
                      +':CodCliente,'
                      +':DirCliente,'
                      +':CuitCliente,'
                      +':TipoIva,'
                      +':Condiciones,'
                      +':Vendedor,'
                      +':FechaVenc,'
                      +':Total,'
                      +':TotalConRedondeo,'
                      +':Neto,'
                      +':MontoIVA1,'
                      +':MontoIVA2,'
                      +':Tarjeta,'
                      +':NroTarjeta,'
                      +':MontoTarjeta,'
                      +':Efectivo,'
                      +':PresupuestoNro,'
                      +':TipoFactura,'
                      +':Saldo,'
                      +':montodescuento,'
                      +':descuento,'
                      +':NC,'
                      +':PagaComision,'
                      +':Comision,'
                      +':Cheque,'
                      +':ChequeNro,'
                      +':ChequeFecha,'
                      +':ChequeBanco,'
                      +':Proforma,'
                      +':Localidad,'
                      +':Dolar,'
                      +':Observaciones,'
                      +':RemitoNro,'
                      +':Usuario,'
                      +':Zona,'
                      +':MontoComision,'
                      +':NroOrdenCompra,'
                      +':Descontado,'
                      +':MontoSenia,'
                      +':NetoNoGravado,'
                      +':Neto1,'
                      +':Neto2,'
                      +':Impuesto,'
                      +':CAE,'
                      +':FechaVenceCAE,'
                      +':PorcentajeTarjeta,'
                      +':Turno,'
                      +':Provincia,'
                      +':Impuesto2,'
                      +':MontoPuntos,'
                      +':CotizacionDolar,'
                      +':TotalDolar,'
                      +':Subido,'
                      +':id_tabla,'
                      +':Base_datos)';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Numero').Value := Numero;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Fecha').Value := Fecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NombreCli').Value := NombreCli;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodCliente').Value := CodCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('DirCliente').Value := DirCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CuitCliente').Value := CuitCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TipoIva').Value := TipoIva;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Condiciones').Value := Condiciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Vendedor').Value := Vendedor;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaVenc').Value := FechaVenc;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Total').Value := Total;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TotalConRedondeo').Value := TotalConRedondeo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Neto').Value := Neto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoIVA1').Value := MontoIVA1;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoIVA2').Value := MontoIVA2;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Tarjeta').Value := Tarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroTarjeta').Value := NroTarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoTarjeta').Value := MontoTarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Efectivo').Value := Efectivo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PresupuestoNro').Value := PresupuestoNro;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TipoFactura').Value := TipoFactura;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Saldo').Value := Saldo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('montodescuento').Value := montodescuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('descuento').Value := descuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NC').Value := NC;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PagaComision').Value := PagaComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Comision').Value := Comision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Cheque').Value := Cheque;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeNro').Value := ChequeNro;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeFecha').Value := ChequeFecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ChequeBanco').Value := ChequeBanco;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Proforma').Value := Proforma;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Localidad').Value := Localidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Dolar').Value := Dolar;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Observaciones').Value := Observaciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('RemitoNro').Value := RemitoNro;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Usuario').Value := Usuario;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Zona').Value := Zona;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoComision').Value := MontoComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroOrdenCompra').Value := NroOrdenCompra;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descontado').Value := Descontado;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoSenia').Value := MontoSenia;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NetoNoGravado').Value := NetoNoGravado;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Neto1').Value := Neto1;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Neto2').Value := Neto2;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Impuesto').Value := Impuesto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CAE').Value := CAE;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaVenceCAE').Value := FechaVenceCAE;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PorcentajeTarjeta').Value := PorcentajeTarjeta;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Turno').Value := Turno;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Provincia').Value := Provincia;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Impuesto2').Value := Impuesto2;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('MontoPuntos').Value := MontoPuntos;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CotizacionDolar').Value := CotizacionDolar;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TotalDolar').Value := TotalDolar;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Subido').Value := Subido;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorFacturas:= contadorFacturas + 1;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Facturas - Cant. insertados: ' + InttoStr(contadorFacturas);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Facturas - no tuvo ningun nuevo registro';
            end;

          //*************************************************************************************************************
          //************************************ TABLA VENDEDORES *******************************************************
          //*************************************************************************************************************

          if (BD_name[4] = 'Lisboa' ) then
            begin

              // inicializa contador
              contadorVendedores := 0;

              //Cierro Base de datos
              Unit2.DataModule2.ABSQuery1.Close;
              Unit2.DataModule2.ADOQuery1.Close;

              //Limpio Query
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbvendedores;';
              Unit2.DataModule2.ABSQuery1.Open;
              MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


              //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
              Unit2.DataModule2.ADOQuery1.Close;
              Unit2.DataModule2.ADOQuery1.SQL.Clear;
              Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from vendedores where Base_datos = :Base_datos ;';
              Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
              Unit2.DataModule2.ADOQuery1.Open;

              MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

             //Compara los maximos ID para ver si ingreso algun nuevo registro
              if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
                begin
                  //Seteo Query
                  Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbvendedores;';

                  //Ejecuto sentencia
                  //Unit2.DataModule2.ABSQuery1.ExecSQL;
                  Unit2.DataModule2.ABSQuery1.Open;


                  try
                    Unit2.DataModule2.ABSQuery1.First;
                    while not  Unit2.DataModule2.ABSQuery1.Eof  do
                    begin
                      ID_tabla            := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                      Codigo              := Unit2.DataModule2.ABSQuery1.FieldByName('Codigo').AsInteger;
                      Nombre              := Unit2.DataModule2.ABSQuery1.FieldByName('Nombre').AsString;
                      Direccion           := Unit2.DataModule2.ABSQuery1.FieldByName('Direccion').AsString;
                      Telefono            := Unit2.DataModule2.ABSQuery1.FieldByName('Telefono').AsString;
                      Celular             := Unit2.DataModule2.ABSQuery1.FieldByName('Celular').AsString;
                      Sueldo              := Unit2.DataModule2.ABSQuery1.FieldByName('Sueldo').AsFloat;
                      Comision            := Unit2.DataModule2.ABSQuery1.FieldByName('Comision').AsFloat;
                      mail                := Unit2.DataModule2.ABSQuery1.FieldByName('mail').AsString;
                      Documento           := Unit2.DataModule2.ABSQuery1.FieldByName('Documento').AsString;
                      Localidad           := Unit2.DataModule2.ABSQuery1.FieldByName('Localidad').AsString;
                      Provincia           := Unit2.DataModule2.ABSQuery1.FieldByName('Provincia').AsString;
                      CP                  := Unit2.DataModule2.ABSQuery1.FieldByName('CP').AsString;
                      Zona                := Unit2.DataModule2.ABSQuery1.FieldByName('Zona').AsString;
                      ComisionSobreNeto   := Unit2.DataModule2.ABSQuery1.FieldByName('ComisionSobreNeto').AsBoolean;
                      Clave               := Unit2.DataModule2.ABSQuery1.FieldByName('Clave').AsString;



                      Unit2.DataModule2.ADOQuery1.Close;
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from vendedores where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.Open;

                      // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                      // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                      if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                        begin
                          Unit2.DataModule2.ADOQuery1.SQL.Clear;
                          Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into vendedores '
                          +'(Codigo,'
                          +'Nombre,'
                          +'Direccion,'
                          +'Telefono,'
                          +'Celular,'
                          +'Sueldo,'
                          +'Comision,'
                          +'mail,'
                          +'Documento,'
                          +'Localidad,'
                          +'Provincia,'
                          +'CP,'
                          +'Zona,'
                          +'ComisionSobreNeto,'
                          +'Clave,'
                          +'id_tabla,'
                          +'Base_datos)'
                          + 'value             '
                          +'(:Codigo,'
                          +':Nombre,'
                          +':Direccion,'
                          +':Telefono,'
                          +':Celular,'
                          +':Sueldo,'
                          +':Comision,'
                          +':mail,'
                          +':Documento,'
                          +':Localidad,'
                          +':Provincia,'
                          +':CP,'
                          +':Zona,'
                          +':ComisionSobreNeto,'
                          +':Clave,'
                          +':id_tabla,'
                          +':Base_datos)';


                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Codigo').Value := Codigo;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Nombre').Value := Nombre;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Direccion').Value := Direccion;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Telefono').Value := Telefono;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Celular').Value := Celular;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Sueldo').Value := Sueldo;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Comision').Value := Comision;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('mail').Value := mail;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Documento').Value := Documento;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Localidad').Value := Localidad;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Provincia').Value := Provincia;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CP').Value := CP;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Zona').Value := Zona;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ComisionSobreNeto').Value := ComisionSobreNeto;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Clave').Value := Clave;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                          Unit2.DataModule2.ADOQuery1.ExecSQL;
                          contadorVendedores := contadorVendedores + 1 ;
                        end;

                      Unit2.DataModule2.ABSQuery1.Next;
                    end;

                  finally
                    Unit2.DataModule2.ABSQuery1.Close;
                    Unit2.DataModule2.ADOQuery1.Close;
                    Msg := Msg + #13 + 'Tabla Vendedores - Cant. insertados: ' + InttoStr(contadorVendedores);
                  end;
                end
              Else
                begin
                  Msg := Msg + #13 + 'Tabla Vendedores - No tuvo ningun nuevo registro';
                end;
            end
          Else
            begin
               Msg := Msg + #13 + 'Tabla Vendedores - No se proceso para la BD ' +  BD_name[4];
            end;


          //*************************************************************************************************************
          //************************************ TABLA ITEM FACTURA *****************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorItefac := 0;

          //Cierro Base de datos
          Unit2.DataModule2.ABSQuery1.Close;
          Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(recordid) id from tbitefac;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from itefac where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin

              //Seteo Query
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbitefac;';

              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;


              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  ID_tabla            := Unit2.DataModule2.ABSQuery1.FieldByName('RecordId').AsInteger;
                  Id                  := Unit2.DataModule2.ABSQuery1.FieldByName('Id').AsInteger;
                  Numero              := Unit2.DataModule2.ABSQuery1.FieldByName('Numero').AsInteger;
                  Cantidad            := Unit2.DataModule2.ABSQuery1.FieldByName('Cantidad').AsFloat;
                  CodArticulo         := Unit2.DataModule2.ABSQuery1.FieldByName('CodArticulo').AsString;
                  Descripcion         := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                  Marca               := Unit2.DataModule2.ABSQuery1.FieldByName('Marca').AsString;
                  PrecUni             := Unit2.DataModule2.ABSQuery1.FieldByName('PrecUni').AsFloat;
                  Descuento           := Unit2.DataModule2.ABSQuery1.FieldByName('Descuento').AsFloat;
                  Iva                 := Unit2.DataModule2.ABSQuery1.FieldByName('Iva').AsFloat;
                  Costo               := Unit2.DataModule2.ABSQuery1.FieldByName('Costo').AsFloat;
                  NroIVA              := Unit2.DataModule2.ABSQuery1.FieldByName('NroIVA').AsInteger;
                  CostoPromedio       := Unit2.DataModule2.ABSQuery1.FieldByName('CostoPromedio').AsFloat;
                  Unidad              := Unit2.DataModule2.ABSQuery1.FieldByName('Unidad').AsString;
                  Talle               := Unit2.DataModule2.ABSQuery1.FieldByName('Talle').AsString;
                  ColorTabla          := Unit2.DataModule2.ABSQuery1.FieldByName('Color').AsString;
                  PorcentajeComision  := Unit2.DataModule2.ABSQuery1.FieldByName('PorcentajeComision').AsFloat;



                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from itefac where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into itefac '
                      +'(Id_aux,'
                      +'Numero,'
                      +'Cantidad,'
                      +'CodArticulo,'
                      +'Descripcion,'
                      +'Marca,'
                      +'PrecUni,'
                      +'Descuento,'
                      +'Iva,'
                      +'Costo,'
                      +'NroIVA,'
                      +'CostoPromedio,'
                      +'Unidad,'
                      +'Talle,'
                      +'Color,'
                      +'PorcentajeComision,'
                      +'id_tabla,'
                      +'Base_datos)'
                      + 'value             '
                      +'(:Id_aux,'
                      +':Numero,'
                      +':Cantidad,'
                      +':CodArticulo,'
                      +':Descripcion,'
                      +':Marca,'
                      +':PrecUni,'
                      +':Descuento,'
                      +':Iva,'
                      +':Costo,'
                      +':NroIVA,'
                      +':CostoPromedio,'
                      +':Unidad,'
                      +':Talle,'
                      +':Color,'
                      +':PorcentajeComision,'
                      +':id_tabla,'
                      +':Base_datos)';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_aux').Value := Id;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Numero').Value := Numero;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Cantidad').Value := Cantidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodArticulo').Value := CodArticulo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Marca').Value := Marca;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PrecUni').Value := PrecUni;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descuento').Value := Descuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Iva').Value := Iva;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Costo').Value := Costo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroIVA').Value := NroIVA;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CostoPromedio').Value := CostoPromedio;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Unidad').Value := Unidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Talle').Value := Talle;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Color').Value := Color;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PorcentajeComision').Value := PorcentajeComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorItefac:= contadorItefac + 1 ;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Item Factura - Cant. insertados: ' + InttoStr(contadorItefac);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Item Factura - no tuvo ningun nuevo registro';
            end;

          //*************************************************************************************************************
          //************************************ TABLA ITEM REMITO ******************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorItemRemito := 0;

          //Cierro Base de datos
          Unit2.DataModule2.ABSQuery1.Close;
          Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(recordid) id from tbitemremito;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from iteremito where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin
              //Seteo Query
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbitemremito;';

              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;


              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  ID_tabla            := Unit2.DataModule2.ABSQuery1.FieldByName('RecordId').AsInteger;
                  Costo               := Unit2.DataModule2.ABSQuery1.FieldByName('Costo').AsFloat;
                  NroIva              := Unit2.DataModule2.ABSQuery1.FieldByName('NroIva').AsInteger;
                  id                  := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  Cantidad            := Unit2.DataModule2.ABSQuery1.FieldByName('Cantidad').AsFloat;
                  CodArticulo         := Unit2.DataModule2.ABSQuery1.FieldByName('CodArticulo').AsString;
                  Descripcion         := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                  Marca               := Unit2.DataModule2.ABSQuery1.FieldByName('Marca').AsString;
                  PrecUni             := Unit2.DataModule2.ABSQuery1.FieldByName('PrecUni').AsFloat;
                  Descuento           := Unit2.DataModule2.ABSQuery1.FieldByName('Descuento').AsFloat;
                  Total               := Unit2.DataModule2.ABSQuery1.FieldByName('Total').AsFloat;
                  Iva                 := Unit2.DataModule2.ABSQuery1.FieldByName('Iva').AsFloat;
                  CostoPromedio       := Unit2.DataModule2.ABSQuery1.FieldByName('CostoPromedio').AsFloat;
                  Unidad              := Unit2.DataModule2.ABSQuery1.FieldByName('Unidad').AsString;
                  PorcentajeComision  := Unit2.DataModule2.ABSQuery1.FieldByName('PorcentajeComision').AsFloat;
                  CantBultos          := Unit2.DataModule2.ABSQuery1.FieldByName('CantBultos').AsFloat;
                  ArtxBulto           := Unit2.DataModule2.ABSQuery1.FieldByName('ArtxBulto').AsFloat;
                  RemanenteBulto      := Unit2.DataModule2.ABSQuery1.FieldByName('RemanenteBulto').AsFloat;
                  Talle               := Unit2.DataModule2.ABSQuery1.FieldByName('Talle').AsString;
                  ColorTabla          := Unit2.DataModule2.ABSQuery1.FieldByName('Color').AsString;



                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from iteremito where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into iteremito '
                      +'(Costo,'
                      +'NroIva,'
                      +'id_aux,'
                      +'Cantidad,'
                      +'CodArticulo,'
                      +'Descripcion,'
                      +'Marca,'
                      +'PrecUni,'
                      +'Descuento,'
                      +'Total,'
                      +'Iva,'
                      +'CostoPromedio,'
                      +'Unidad,'
                      +'PorcentajeComision,'
                      +'CantBultos,'
                      +'ArtxBulto,'
                      +'RemanenteBulto,'
                      +'Talle,'
                      +'Color,'
                      +'id_tabla,'
                      +'Base_datos)'
                      + 'value             '
                      +'(:Costo,'
                      +':NroIva,'
                      +':id_aux,'
                      +':Cantidad,'
                      +':CodArticulo,'
                      +':Descripcion,'
                      +':Marca,'
                      +':PrecUni,'
                      +':Descuento,'
                      +':Total,'
                      +':Iva,'
                      +':CostoPromedio,'
                      +':Unidad,'
                      +':PorcentajeComision,'
                      +':CantBultos,'
                      +':ArtxBulto,'
                      +':RemanenteBulto,'
                      +':Talle,'
                      +':Color,'
                      +':id_tabla,'
                      +':Base_datos)';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Costo').Value := Costo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroIva').Value := NroIva;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_aux').Value := id;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Cantidad').Value := Cantidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodArticulo').Value := CodArticulo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Marca').Value := Marca;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PrecUni').Value := PrecUni;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descuento').Value := Descuento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Total').Value := Total;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Iva').Value := Iva;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CostoPromedio').Value := CostoPromedio;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Unidad').Value := Unidad;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PorcentajeComision').Value := PorcentajeComision;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CantBultos').Value := CantBultos;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ArtxBulto').Value := ArtxBulto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('RemanenteBulto').Value := RemanenteBulto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Talle').Value := Talle;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Color').Value := Color;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorItemRemito := contadorItemRemito + 1 ;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Item Remito - Cant. insertados: ' + InttoStr(contadorItemRemito);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Item Remito - no tuvo ningun nuevo registro';
            end;



          //*************************************************************************************************************
          //************************************ TABLA ARTICULOS ********************************************************
          //*************************************************************************************************************
          if (BD_name[4] = 'Lisboa' ) then        // Solo genera articulos de una sola BD
            begin
              // inicializa contador
              contadorArticulos := 0;

              //Cierro Base de datos
              Unit2.DataModule2.ABSQuery1.Close;
              Unit2.DataModule2.ADOQuery1.Close;

              //Limpio Query
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //Elimita todos los campos de la tabla. Ya que no es una tabla que incremente
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //GENERA QUERY PARA ELIMINAR DATOS
              Unit2.DataModule2.ADOQuery1.Close;
              Unit2.DataModule2.ADOQuery1.SQL.Clear;
              Unit2.DataModule2.ADOQuery1.SQL.text := 'Delete from articulos;';
              Unit2.DataModule2.ADOQuery1.ExecSQL;     //ejecuta query que no espera un resultado

              //Limpio Query
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbarticulos;';
              Unit2.DataModule2.ABSQuery1.Open;
              MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


              //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
              Unit2.DataModule2.ADOQuery1.Close;
              Unit2.DataModule2.ADOQuery1.SQL.Clear;
              Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from articulos where Base_datos = :Base_datos ;';
              Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];   //seteo parametro del query
              Unit2.DataModule2.ADOQuery1.Open;                                                       //ejecuta query

              MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

             //Compara los maximos ID para ver si ingreso algun nuevo registro
              if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
                begin

                  //Seteo Query
                  Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbarticulos;';

                  //Ejecuto sentencia
                  //Unit2.DataModule2.ABSQuery1.ExecSQL;
                  Unit2.DataModule2.ABSQuery1.Open;


                  try
                    Unit2.DataModule2.ABSQuery1.First;
                    while not  Unit2.DataModule2.ABSQuery1.Eof  do
                    begin

                      ID_tabla              := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                      CodigoStr             := Unit2.DataModule2.ABSQuery1.FieldByName('Codigo').AsString;
                      Rubro                 := Unit2.DataModule2.ABSQuery1.FieldByName('Rubro').AsString;
                      Descripcion           := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                      Marca                 := Unit2.DataModule2.ABSQuery1.FieldByName('Marca').AsString;
                      PrecioVenta           := Unit2.DataModule2.ABSQuery1.FieldByName('PrecioVenta').AsFloat;
                      PrecioCompra          := Unit2.DataModule2.ABSQuery1.FieldByName('PrecioCompra').AsFloat;
                      StockMinimo           := Unit2.DataModule2.ABSQuery1.FieldByName('StockMinimo').AsFloat;
                      Stock                 := Unit2.DataModule2.ABSQuery1.FieldByName('Stock').AsFloat;
                      AlicuotaIva           := Unit2.DataModule2.ABSQuery1.FieldByName('AlicuotaIva').AsFloat;
                      Deposito              := Unit2.DataModule2.ABSQuery1.FieldByName('Deposito').AsFloat;
                      FechaCompra           := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaCompra').AsDateTime);
                      idProveedor           := Unit2.DataModule2.ABSQuery1.FieldByName('idProveedor').AsInteger;
                      Lista2                := Unit2.DataModule2.ABSQuery1.FieldByName('Lista2').AsFloat;
                      Lista3                := Unit2.DataModule2.ABSQuery1.FieldByName('Lista3').AsFloat;
                      Unidad                := Unit2.DataModule2.ABSQuery1.FieldByName('Unidad').AsString;
                      Lista4                := Unit2.DataModule2.ABSQuery1.FieldByName('Lista4').AsFloat;
                      PorcentajeGanancia    := Unit2.DataModule2.ABSQuery1.FieldByName('PorcentajeGanancia').AsFloat;
                      CalculadoBoolean      := Unit2.DataModule2.ABSQuery1.FieldByName('Calculado').AsBoolean;
                      CodigoProv            := Unit2.DataModule2.ABSQuery1.FieldByName('CodigoProv').AsString;
                      CostoPromedio         := Unit2.DataModule2.ABSQuery1.FieldByName('CostoPromedio').AsFloat;
                      CostoEnDolares        := Unit2.DataModule2.ABSQuery1.FieldByName('CostoEnDolares').AsBoolean;
                      FechaModif            := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaModif').AsDateTime);
                      PrecioListaProveedor  := Unit2.DataModule2.ABSQuery1.FieldByName('PrecioListaProveedor').AsFloat;
                      StockInicial          := Unit2.DataModule2.ABSQuery1.FieldByName('StockInicial').AsFloat;
                      Ubicacion             := Unit2.DataModule2.ABSQuery1.FieldByName('Ubicacion').AsString;
                      Lista1EnDolares       := Unit2.DataModule2.ABSQuery1.FieldByName('Lista1EnDolares').AsBoolean;
                      Dto1                  := Unit2.DataModule2.ABSQuery1.FieldByName('Dto1').AsFloat;
                      Dto2                  := Unit2.DataModule2.ABSQuery1.FieldByName('Dto2').AsFloat;
                      Dto3                  := Unit2.DataModule2.ABSQuery1.FieldByName('Dto3').AsFloat;
                      Impuesto              := Unit2.DataModule2.ABSQuery1.FieldByName('Impuesto').AsFloat;
                      EnPromocion           := Unit2.DataModule2.ABSQuery1.FieldByName('EnPromocion').AsBoolean;
                      UsaTalle              := Unit2.DataModule2.ABSQuery1.FieldByName('UsaTalle').AsBoolean;
                      Compuesto             := Unit2.DataModule2.ABSQuery1.FieldByName('Compuesto').AsBoolean;
                      Combustible           := Unit2.DataModule2.ABSQuery1.FieldByName('Combustible').AsBoolean;
                      ImpuestoPorcentual    := Unit2.DataModule2.ABSQuery1.FieldByName('ImpuestoPorcentual').AsBoolean;

                      Unit2.DataModule2.ADOQuery1.Close;
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from articulos where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.Open;

                      // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                      // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                      if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                        begin
                          Unit2.DataModule2.ADOQuery1.SQL.Clear;
                          Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into articulos '
                          +'(Codigo,'
                          +'Rubro,'
                          +'Descripcion,'
                          +'Marca,'
                          +'PrecioVenta,'
                          +'PrecioCompra,'
                          +'StockMinimo,'
                          +'Stock,'
                          +'AlicuotaIva,'
                          +'Deposito,'
                          +'FechaCompra,'
                          +'idProveedor,'
                          +'Lista2,'
                          +'Lista3,'
                          +'Unidad,'
                          +'Lista4,'
                          +'PorcentajeGanancia,'
                          +'Calculado,'
                          +'CodigoProv,'
                          +'CostoPromedio,'
                          +'CostoEnDolares,'
                          +'FechaModif,'
                          +'PrecioListaProveedor,'
                          +'StockInicial,'
                          +'Ubicacion,'
                          +'Lista1EnDolares,'
                          +'Dto1,'
                          +'Dto2,'
                          +'Dto3,'
                          +'Impuesto,'
                          +'EnPromocion,'
                          +'UsaTalle,'
                          +'Compuesto,'
                          +'Combustible,'
                          +'ImpuestoPorcentual,'
                          +'id_tabla,'
                          +'Base_datos)'
                          + 'value             '
                          +'(:Codigo,'
                          +':Rubro,'
                          +':Descripcion,'
                          +':Marca,'
                          +':PrecioVenta,'
                          +':PrecioCompra,'
                          +':StockMinimo,'
                          +':Stock,'
                          +':AlicuotaIva,'
                          +':Deposito,'
                          +':FechaCompra,'
                          +':idProveedor,'
                          +':Lista2,'
                          +':Lista3,'
                          +':Unidad,'
                          +':Lista4,'
                          +':PorcentajeGanancia,'
                          +':Calculado,'
                          +':CodigoProv,'
                          +':CostoPromedio,'
                          +':CostoEnDolares,'
                          +':FechaModif,'
                          +':PrecioListaProveedor,'
                          +':StockInicial,'
                          +':Ubicacion,'
                          +':Lista1EnDolares,'
                          +':Dto1,'
                          +':Dto2,'
                          +':Dto3,'
                          +':Impuesto,'
                          +':EnPromocion,'
                          +':UsaTalle,'
                          +':Compuesto,'
                          +':Combustible,'
                          +':ImpuestoPorcentual,'
                          +':id_tabla,'
                          +':Base_datos)';


                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Codigo').Value := CodigoStr;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Rubro').Value := Rubro;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Marca').Value := Marca;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PrecioVenta').Value := PrecioVenta;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PrecioCompra').Value := PrecioCompra;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('StockMinimo').Value := StockMinimo;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Stock').Value := Stock;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('AlicuotaIva').Value := AlicuotaIva;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Deposito').Value := Deposito;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaCompra').Value := FechaCompra;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('idProveedor').Value := idProveedor;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Lista2').Value := Lista2;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Lista3').Value := Lista3;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Unidad').Value := Unidad;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Lista4').Value := Lista4;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PorcentajeGanancia').Value := PorcentajeGanancia;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Calculado').Value := CalculadoBoolean;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodigoProv').Value := CodigoProv;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CostoPromedio').Value := CostoPromedio;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CostoEnDolares').Value := CostoEnDolares;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaModif').Value := FechaModif;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('PrecioListaProveedor').Value := PrecioListaProveedor;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('StockInicial').Value := StockInicial;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Ubicacion').Value := Ubicacion;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Lista1EnDolares').Value := Lista1EnDolares;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Dto1').Value := Dto1;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Dto2').Value := Dto2;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Dto3').Value := Dto3;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Impuesto').Value := Impuesto;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('EnPromocion').Value := EnPromocion;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('UsaTalle').Value := UsaTalle;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Compuesto').Value := Compuesto;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Combustible').Value := Combustible;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ImpuestoPorcentual').Value := ImpuestoPorcentual;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                          Unit2.DataModule2.ADOQuery1.ExecSQL;
                          contadorArticulos := contadorArticulos + 1;
                        end;

                      Unit2.DataModule2.ABSQuery1.Next;
                    end;

                  finally
                    Unit2.DataModule2.ABSQuery1.Close;
                    Unit2.DataModule2.ADOQuery1.Close;
                    Msg := Msg + #13 + 'Tabla Articulos - Cant. insertados: ' + InttoStr(contadorArticulos);
                  end;
                end
              Else
                begin
                  Msg := Msg + #13 + 'Tabla Articulos - no tuvo ningun nuevo registro';
                end;
            end
          Else
            begin
                Msg := Msg + #13 + 'Tabla Articulos - No se proceso para la BD ' +  BD_name[4];
            end;


          //*************************************************************************************************************
          //************************************ TABLA STOCK****************************************************
          //*************************************************************************************************************

              // inicializa contador
              contadorStock:=0;

              //Cierro Base de datos
              Unit2.DataModule2.ABSQuery1.Close;
              Unit2.DataModule2.ADOQuery1.Close;

              //Limpio Query
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //Elimita todos los campos de la tabla. Ya que no es una tabla que incremente
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //GENERA QUERY PARA ELIMINAR DATOS
              Unit2.DataModule2.ADOQuery1.Close;
              Unit2.DataModule2.ADOQuery1.SQL.Clear;
              Unit2.DataModule2.ADOQuery1.SQL.text := 'Delete from stock where Base_datos = :Base_datos ;';
              Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];   //seteo parametro del query
              Unit2.DataModule2.ADOQuery1.ExecSQL; //ejecuta query que no espera un resultado

              //Limpio Query
              Unit2.DataModule2.ABSQuery1.SQL.Clear;

              //    CARGA LA TABLA STOCK


              //Seteo Query recuperando toda la informacion de la tabla articulos
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbarticulos;';

              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;


              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin
                  // cargo los datos de la tabla del sistema en variables
                  ID_tabla              := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  CodigoStr             := Unit2.DataModule2.ABSQuery1.FieldByName('Codigo').AsString;
                  Rubro                 := Unit2.DataModule2.ABSQuery1.FieldByName('Rubro').AsString;
                  Descripcion           := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                  Marca                 := Unit2.DataModule2.ABSQuery1.FieldByName('Marca').AsString;
                  Stock                 := Unit2.DataModule2.ABSQuery1.FieldByName('Stock').AsFloat;


                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into stock '
                  +'(Codigo,'
                  +'Descripcion,'
                  +'Rubro,'
                  +'Marca,'
                  +'Stock,'
                  +'id_tabla,'
                  +'Base_datos)'
                  + 'value             '
                  +'(:Codigo,'
                  +':Descripcion,'
                  +':Rubro,'
                  +':Marca,'
                  +':Stock,'
                  +':id_tabla,'
                  +':Base_datos)';

                  // carga los parametros para el INSERT
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Codigo').Value := CodigoStr;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Rubro').Value := Rubro;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Marca').Value := Marca;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Stock').Value := Stock;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.ExecSQL;   // ejecuta query
                  contadorArticulos := contadorStock + 1;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;

              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Stock - Cant. insertados: ' + InttoStr(contadorStock);
              end;






          //*************************************************************************************************************
          //************************************ TABLA COBRANZAS ********************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorCobranzas := 0;

          //Cierro Base de datos
          Unit2.DataModule2.ABSQuery1.Close;
          Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;

          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(recordid) id from tbcobranzas;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from cobranzas where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin

              //Seteo Query
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbcobranzas;';

              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;


              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin

                  ID_tabla              := Unit2.DataModule2.ABSQuery1.FieldByName('RecordId').AsInteger;
                  NroDoc                := Unit2.DataModule2.ABSQuery1.FieldByName('NroDoc').AsString;
                  Fecha                 := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Fecha').AsDateTime);
                  Vence                 := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Vence').AsDateTime);
                  Movimiento            := Unit2.DataModule2.ABSQuery1.FieldByName('Movimiento').AsString;
                  TotalFactura          := Unit2.DataModule2.ABSQuery1.FieldByName('TotalFactura').AsFloat;
                  Pago                  := Unit2.DataModule2.ABSQuery1.FieldByName('Pago').AsFloat;
                  Saldo                 := Unit2.DataModule2.ABSQuery1.FieldByName('Saldo').AsFloat;
                  CodigoCliente         := Unit2.DataModule2.ABSQuery1.FieldByName('CodigoCliente').AsInteger;
                  NombreCli             := Unit2.DataModule2.ABSQuery1.FieldByName('NombreCli').AsString;
                  ReciboNro             := Unit2.DataModule2.ABSQuery1.FieldByName('ReciboNro').AsInteger;
                  Obs                   := Unit2.DataModule2.ABSQuery1.FieldByName('Obs').AsString;
                  Tipo                  := Unit2.DataModule2.ABSQuery1.FieldByName('Tipo').AsString;
                  Id                    := Unit2.DataModule2.ABSQuery1.FieldByName('Id').AsInteger;
                  FormaPago             := Unit2.DataModule2.ABSQuery1.FieldByName('FormaPago').AsString;
                  NroCheque             := Unit2.DataModule2.ABSQuery1.FieldByName('NroCheque').AsString;
                  Banco                 := Unit2.DataModule2.ABSQuery1.FieldByName('Banco').AsString;
                  FechaCheque           := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('FechaCheque').AsDateTime);
                  Queda                 := Unit2.DataModule2.ABSQuery1.FieldByName('Queda').AsBoolean;
                  idFactura             := Unit2.DataModule2.ABSQuery1.FieldByName('idFactura').AsInteger;
                  Avanzada              := Unit2.DataModule2.ABSQuery1.FieldByName('Avanzada').AsBoolean;



                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from cobranzas where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into cobranzas '

                      +'(NroDoc,'
                      +'Fecha,'
                      +'Vence,'
                      +'Movimiento,'
                      +'TotalFactura,'
                      +'Pago,'
                      +'Saldo,'
                      +'CodigoCliente,'
                      +'NombreCli,'
                      +'ReciboNro,'
                      +'Obs,'
                      +'Tipo,'
                      +'Id_aux,'
                      +'FormaPago,'
                      +'NroCheque,'
                      +'Banco,'
                      +'FechaCheque,'
                      +'Queda,'
                      +'idFactura,'
                      +'Avanzada,'
                      +'id_tabla,'
                      +'Base_datos)'
                      + 'value             '
                      +'(:NroDoc,'
                      +':Fecha,'
                      +':Vence,'
                      +':Movimiento,'
                      +':TotalFactura,'
                      +':Pago,'
                      +':Saldo,'
                      +':CodigoCliente,'
                      +':NombreCli,'
                      +':ReciboNro,'
                      +':Obs,'
                      +':Tipo,'
                      +':Id_aux,'
                      +':FormaPago,'
                      +':NroCheque,'
                      +':Banco,'
                      +':FechaCheque,'
                      +':Queda,'
                      +':idFactura,'
                      +':Avanzada,'
                      +':id_tabla,'
                      +':Base_datos)';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroDoc').Value := NroDoc;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Fecha').Value := Fecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Vence').Value := Vence;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Movimiento').Value := Movimiento;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('TotalFactura').Value := TotalFactura;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Pago').Value := Pago;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Saldo').Value := Saldo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('CodigoCliente').Value := CodigoCliente;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NombreCli').Value := NombreCli;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('ReciboNro').Value := ReciboNro;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Obs').Value := Obs;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Tipo').Value := Tipo;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_aux').Value := Id;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FormaPago').Value := FormaPago;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('NroCheque').Value := NroCheque;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Banco').Value := Banco;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('FechaCheque').Value := FechaCheque;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Queda').Value := Queda;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('idFactura').Value := idFactura;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Avanzada').Value := Avanzada;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorCobranzas := contadorCobranzas + 1;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;


              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Cobranzas - Cant. insertados: ' + InttoStr(contadorCobranzas);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Cobranzas - no tuvo ningun nuevo registro';
            end;

          //*************************************************************************************************************
          //************************************ TABLA INGRESOS *********************************************************
          //*************************************************************************************************************
          // inicializa contador
          contadorIngresos := 0;

          //Cierro Base de datos
          Unit2.DataModule2.ABSQuery1.Close;
          Unit2.DataModule2.ADOQuery1.Close;

          //Limpio Query
          Unit2.DataModule2.ABSQuery1.SQL.Clear;
          //Recupera Maximo ID de la tabla para comprara con el max de la tabla unificada
          Unit2.DataModule2.ABSQuery1.SQL.text := 'Select MAX(id) id from tbingresos;';
          Unit2.DataModule2.ABSQuery1.Open;
          MaxValorEgreso_base := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;


          //Recupera Maximo ID de la tabla para comprara con el max de la tabla base
          Unit2.DataModule2.ADOQuery1.Close;
          Unit2.DataModule2.ADOQuery1.SQL.Clear;
          Unit2.DataModule2.ADOQuery1.SQL.text := 'Select MAX(ID_tabla) id from ingresos where Base_datos = :Base_datos ;';
          Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
          Unit2.DataModule2.ADOQuery1.Open;

          MaxValorEgreso_unif := Unit2.DataModule2.ADOQuery1.FieldByName('id').AsInteger;

         //Compara los maximos ID para ver si ingreso algun nuevo registro
          if (MaxValorEgreso_unif <> MaxValorEgreso_base)  then
            begin


              //Seteo Query
              Unit2.DataModule2.ABSQuery1.SQL.text := 'Select * from tbingresos;';

              //Ejecuto sentencia
              //Unit2.DataModule2.ABSQuery1.ExecSQL;
              Unit2.DataModule2.ABSQuery1.Open;


              try
                Unit2.DataModule2.ABSQuery1.First;
                while not  Unit2.DataModule2.ABSQuery1.Eof  do
                begin

                  ID_tabla              := Unit2.DataModule2.ABSQuery1.FieldByName('id').AsInteger;
                  Descripcion           := Unit2.DataModule2.ABSQuery1.FieldByName('Descripcion').AsString;
                  Monto                 := Unit2.DataModule2.ABSQuery1.FieldByName('Monto').AsFloat;
                  Fecha                 := formatdatetime('yyyy/mm/dd',Unit2.DataModule2.ABSQuery1.FieldByName('Fecha').AsDateTime);
                  Nombre                := Unit2.DataModule2.ABSQuery1.FieldByName('Nombre').AsString;
                  Observaciones         := Unit2.DataModule2.ABSQuery1.FieldByName('Observaciones').AsString;
                  Usuario               := Unit2.DataModule2.ABSQuery1.FieldByName('Usuario').AsInteger;



                  Unit2.DataModule2.ADOQuery1.Close;
                  Unit2.DataModule2.ADOQuery1.SQL.Clear;
                  Unit2.DataModule2.ADOQuery1.SQL.text := 'Select * from ingresos where id_tabla = :Id_tabla and Base_datos = :Base_datos ;';
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Id_tabla').Value := ID_tabla;
                  Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                  Unit2.DataModule2.ADOQuery1.Open;

                  // Valida que el ID de la tabla a guardar no este ya cargado para no duplicar registros.
                  // Si ya existe continua con el siguiente registro. En caso de no existir lo inserta
                  if (Unit2.DataModule2.ADOQuery1.IsEmpty)  then
                    begin
                      Unit2.DataModule2.ADOQuery1.SQL.Clear;
                      Unit2.DataModule2.ADOQuery1.SQL.text := 'Insert into ingresos '

                      +'(Descripcion,'
                      +'Monto,'
                      +'Fecha,'
                      +'Nombre,'
                      +'Observaciones,'
                      +'Usuario,'
                      +'id_tabla,'
                      +'Base_datos)'
                      + 'value             '
                      +'(:Descripcion,'
                      +':Monto,'
                      +':Fecha,'
                      +':Nombre,'
                      +':Observaciones,'
                      +':Usuario,'
                      +':id_tabla,'
                      +':Base_datos)';


                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Descripcion').Value := Descripcion;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Monto').Value := Monto;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Fecha').Value := Fecha;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Nombre').Value := Nombre;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Observaciones').Value := Observaciones;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Usuario').Value := Usuario;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('id_tabla').Value := id_tabla;
                      Unit2.DataModule2.ADOQuery1.Parameters.ParamByName('Base_datos').Value := BD_name[4];
                      Unit2.DataModule2.ADOQuery1.ExecSQL;
                      contadorIngresos := contadorIngresos + 1;
                    end;

                  Unit2.DataModule2.ABSQuery1.Next;
                end;


              finally
                Unit2.DataModule2.ABSQuery1.Close;
                Unit2.DataModule2.ADOQuery1.Close;
                Msg := Msg + #13 + 'Tabla Ingresos - Cant. insertados: ' + InttoStr(contadorIngresos);
              end;
            end
          Else
            begin
              Msg := Msg + #13 + 'Tabla Ingresos - no tuvo ningun nuevo registro';
            end;
      end;
    end;



    //Libera Objeto
    Bases.Free;
    BD_name.Free;

    // Calcula y muestra cuanto duro el proceso entero
    HoraFinal:=now;
    HoraResultado:= HoraFinal - HoraInicial;


    Msg := Msg + #13 + #13 + 'El proceso demoro: ' +  timetostr(HoraResultado);

    Msg := Msg + #13 + '*************************************************************';

    showmessage(Msg);

//    while not Tabla1.Eof do
//      begin
//      Tabla2.Append;
//      for i := 0 to Pred(Tabla1.Fields.Count) do
//             Tabla2.Fields[i].Value := Tabla1.Fields[i].Value;
//      Tabla2.Post;
//      Tabla1.Next;
end;
end.
