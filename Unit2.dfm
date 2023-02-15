object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 700
  Width = 1030
  object TLocalEgresos: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Id'
        Fields = 'id'
      end
      item
        Name = 'Descripcion'
        Fields = 'Descripcion'
      end
      item
        Name = 'fecha'
        Fields = 'Fecha'
      end>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Monto'
        DataType = ftFloat
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Observaciones'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Usuario'
        DataType = ftInteger
      end>
    TableName = 'tbegresos'
    Exclusive = False
    Left = 32
    Top = 287
    object TLocalEgresosid: TAutoIncField
      FieldName = 'id'
    end
    object TLocalEgresosFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLocalEgresosDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLocalEgresosMonto: TFloatField
      FieldName = 'Monto'
    end
    object TLocalEgresosNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object TLocalEgresosObservaciones: TStringField
      FieldName = 'Observaciones'
    end
    object TLocalEgresosUsuario: TIntegerField
      FieldName = 'Usuario'
    end
  end
  object BDLocal: TABSDatabase
    Connected = True
    CurrentVersion = '7.93 '
    DatabaseFileName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    Exclusive = False
    MaxConnections = 10
    MultiUser = False
    SessionName = 'Default'
    Left = 32
    Top = 102
  end
  object TLocalFacturas: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Id'
        Fields = 'Id'
        Options = [ixUnique]
      end
      item
        Name = 'Numero'
        Fields = 'Numero'
      end
      item
        Name = 'fecha'
        Fields = 'Fecha;hora'
      end
      item
        Name = 'nombre'
        Fields = 'NombreCli;Fecha;Numero'
      end
      item
        Name = 'Vendedor'
        Fields = 'Vendedor'
      end
      item
        Name = 'FechaNum'
        Fields = 'Fecha;Numero'
      end
      item
        Name = 'FechaTarjeta'
        Fields = 'Fecha;Tarjeta'
      end
      item
        Name = 'Zona'
        Fields = 'Zona;Fecha'
      end
      item
        Name = 'Turno'
        Fields = 'Turno'
      end>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Numero'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'hora'
        DataType = ftTime
      end
      item
        Name = 'NombreCli'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'DirCliente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CuitCliente'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TipoIva'
        DataType = ftSmallint
      end
      item
        Name = 'Condiciones'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Vendedor'
        DataType = ftSmallint
      end
      item
        Name = 'FechaVenc'
        DataType = ftDate
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'TotalConRedondeo'
        DataType = ftCurrency
      end
      item
        Name = 'Neto'
        DataType = ftCurrency
      end
      item
        Name = 'MontoIVA1'
        DataType = ftCurrency
      end
      item
        Name = 'MontoIVA2'
        DataType = ftCurrency
      end
      item
        Name = 'Tarjeta'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NroTarjeta'
        DataType = ftString
        Size = 22
      end
      item
        Name = 'MontoTarjeta'
        DataType = ftCurrency
      end
      item
        Name = 'Efectivo'
        DataType = ftCurrency
      end
      item
        Name = 'PresupuestoNro'
        DataType = ftInteger
      end
      item
        Name = 'TipoFactura'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Saldo'
        DataType = ftCurrency
      end
      item
        Name = 'montodescuento'
        DataType = ftCurrency
      end
      item
        Name = 'descuento'
        DataType = ftFloat
      end
      item
        Name = 'NC'
        DataType = ftBoolean
      end
      item
        Name = 'PagaComision'
        DataType = ftBoolean
      end
      item
        Name = 'Comision'
        DataType = ftFloat
      end
      item
        Name = 'Cheque'
        DataType = ftCurrency
      end
      item
        Name = 'ChequeNro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ChequeFecha'
        DataType = ftDate
      end
      item
        Name = 'ChequeBanco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Proforma'
        DataType = ftBoolean
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Dolar'
        DataType = ftBoolean
      end
      item
        Name = 'Observaciones'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'RemitoNro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Usuario'
        DataType = ftSmallint
      end
      item
        Name = 'Zona'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MontoComision'
        DataType = ftCurrency
      end
      item
        Name = 'NroOrdenCompra'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Descontado'
        DataType = ftBoolean
      end
      item
        Name = 'MontoSenia'
        DataType = ftCurrency
      end
      item
        Name = 'NetoNoGravado'
        DataType = ftCurrency
      end
      item
        Name = 'Neto1'
        DataType = ftCurrency
      end
      item
        Name = 'Neto2'
        DataType = ftCurrency
      end
      item
        Name = 'Impuesto'
        DataType = ftCurrency
      end
      item
        Name = 'CAE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'FechaVenceCAE'
        DataType = ftDate
      end
      item
        Name = 'PorcentajeTarjeta'
        DataType = ftFloat
      end
      item
        Name = 'Turno'
        DataType = ftInteger
      end
      item
        Name = 'Provincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Impuesto2'
        DataType = ftCurrency
      end
      item
        Name = 'MontoPuntos'
        DataType = ftCurrency
      end
      item
        Name = 'CotizacionDolar'
        DataType = ftCurrency
      end
      item
        Name = 'TotalDolar'
        DataType = ftCurrency
      end
      item
        Name = 'Subido'
        DataType = ftBoolean
      end>
    TableName = 'tbfacturas'
    Exclusive = False
    Left = 32
    Top = 148
    object TLocalFacturasId: TAutoIncField
      FieldName = 'Id'
    end
    object TLocalFacturasNumero: TStringField
      FieldName = 'Numero'
      Size = 8
    end
    object TLocalFacturasFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLocalFacturasNombreCli: TStringField
      FieldName = 'NombreCli'
      Size = 50
    end
    object TLocalFacturasCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TLocalFacturasDirCliente: TStringField
      FieldName = 'DirCliente'
      Size = 50
    end
    object TLocalFacturasCuitCliente: TStringField
      FieldName = 'CuitCliente'
      Size = 14
    end
    object TLocalFacturasTipoIva: TSmallintField
      FieldName = 'TipoIva'
    end
    object TLocalFacturasCondiciones: TStringField
      FieldName = 'Condiciones'
    end
    object TLocalFacturasVendedor: TSmallintField
      FieldName = 'Vendedor'
    end
    object TLocalFacturasFechaVenc: TDateField
      FieldName = 'FechaVenc'
    end
    object TLocalFacturasTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TLocalFacturasTotalConRedondeo: TCurrencyField
      FieldName = 'TotalConRedondeo'
    end
    object TLocalFacturasNeto: TCurrencyField
      FieldName = 'Neto'
    end
    object TLocalFacturasMontoIVA1: TCurrencyField
      FieldName = 'MontoIVA1'
    end
    object TLocalFacturasMontoIVA2: TCurrencyField
      FieldName = 'MontoIVA2'
    end
    object TLocalFacturasTarjeta: TStringField
      FieldName = 'Tarjeta'
      Size = 30
    end
    object TLocalFacturasNroTarjeta: TStringField
      FieldName = 'NroTarjeta'
      Size = 22
    end
    object TLocalFacturasMontoTarjeta: TCurrencyField
      FieldName = 'MontoTarjeta'
    end
    object TLocalFacturasEfectivo: TCurrencyField
      FieldName = 'Efectivo'
    end
    object TLocalFacturasPresupuestoNro: TIntegerField
      FieldName = 'PresupuestoNro'
    end
    object TLocalFacturasTipoFactura: TStringField
      FieldName = 'TipoFactura'
      Size = 1
    end
    object TLocalFacturasSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object TLocalFacturasmontodescuento: TCurrencyField
      FieldName = 'montodescuento'
    end
    object TLocalFacturasdescuento: TFloatField
      FieldName = 'descuento'
    end
    object TLocalFacturasNC: TBooleanField
      FieldName = 'NC'
    end
    object TLocalFacturasPagaComision: TBooleanField
      FieldName = 'PagaComision'
    end
    object TLocalFacturasComision: TFloatField
      FieldName = 'Comision'
    end
    object TLocalFacturasCheque: TCurrencyField
      FieldName = 'Cheque'
    end
    object TLocalFacturasChequeNro: TStringField
      FieldName = 'ChequeNro'
    end
    object TLocalFacturasChequeFecha: TDateField
      FieldName = 'ChequeFecha'
    end
    object TLocalFacturasChequeBanco: TStringField
      FieldName = 'ChequeBanco'
    end
    object TLocalFacturasProforma: TBooleanField
      FieldName = 'Proforma'
    end
    object TLocalFacturasLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 30
    end
    object TLocalFacturasDolar: TBooleanField
      FieldName = 'Dolar'
    end
    object TLocalFacturasObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 130
    end
    object TLocalFacturasRemitoNro: TStringField
      FieldName = 'RemitoNro'
    end
    object TLocalFacturasUsuario: TSmallintField
      FieldName = 'Usuario'
    end
    object TLocalFacturasZona: TStringField
      FieldName = 'Zona'
      Size = 25
    end
    object TLocalFacturasMontoComision: TCurrencyField
      FieldName = 'MontoComision'
    end
    object TLocalFacturasNroOrdenCompra: TStringField
      FieldName = 'NroOrdenCompra'
      Size = 10
    end
    object TLocalFacturasDescontado: TBooleanField
      FieldName = 'Descontado'
    end
    object TLocalFacturasMontoSenia: TCurrencyField
      FieldName = 'MontoSenia'
    end
    object TLocalFacturasNetoNoGravado: TCurrencyField
      FieldName = 'NetoNoGravado'
    end
    object TLocalFacturasNeto1: TCurrencyField
      FieldName = 'Neto1'
    end
    object TLocalFacturasNeto2: TCurrencyField
      FieldName = 'Neto2'
    end
    object TLocalFacturasImpuesto: TCurrencyField
      FieldName = 'Impuesto'
    end
    object TLocalFacturasCAE: TStringField
      FieldName = 'CAE'
      Size = 14
    end
    object TLocalFacturasFechaVenceCAE: TDateField
      FieldName = 'FechaVenceCAE'
    end
    object TLocalFacturasPorcentajeTarjeta: TFloatField
      FieldName = 'PorcentajeTarjeta'
    end
    object TLocalFacturasTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TLocalFacturasProvincia: TStringField
      FieldName = 'Provincia'
    end
    object TLocalFacturasImpuesto2: TCurrencyField
      FieldName = 'Impuesto2'
    end
    object TLocalFacturasMontoPuntos: TCurrencyField
      FieldName = 'MontoPuntos'
    end
    object TLocalFacturasCotizacionDolar: TCurrencyField
      FieldName = 'CotizacionDolar'
    end
    object TLocalFacturasTotalDolar: TCurrencyField
      FieldName = 'TotalDolar'
    end
    object TLocalFacturasSubido: TBooleanField
      FieldName = 'Subido'
    end
  end
  object TLocalRemito: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Id'
        Fields = 'id'
      end
      item
        Name = 'Numero'
        Fields = 'Numero'
      end
      item
        Name = 'fecha'
        Fields = 'Fecha;hora'
      end
      item
        Name = 'nombre'
        Fields = 'NombreCli;Fecha;Numero'
      end
      item
        Name = 'FechaNum'
        Fields = 'Fecha;Numero'
      end
      item
        Name = 'Turno'
        Fields = 'Turno'
      end>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'NombreCli'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodCliente'
        DataType = ftInteger
      end
      item
        Name = 'DirCliente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CuitCliente'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TipoIva'
        DataType = ftSmallint
      end
      item
        Name = 'Condiciones'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Vendedor'
        DataType = ftSmallint
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'FechaVenc'
        DataType = ftDate
      end
      item
        Name = 'Neto'
        DataType = ftCurrency
      end
      item
        Name = 'Tarjeta'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NroTarjeta'
        DataType = ftString
        Size = 22
      end
      item
        Name = 'MontoTarjeta'
        DataType = ftCurrency
      end
      item
        Name = 'Efectivo'
        DataType = ftCurrency
      end
      item
        Name = 'TipoFactura'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Saldo'
        DataType = ftCurrency
      end
      item
        Name = 'MontoDescuento'
        DataType = ftCurrency
      end
      item
        Name = 'Descuento'
        DataType = ftFloat
      end
      item
        Name = 'PagaComision'
        DataType = ftBoolean
      end
      item
        Name = 'Comision'
        DataType = ftFloat
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Facturado'
        DataType = ftBoolean
      end
      item
        Name = 'Cheque'
        DataType = ftFloat
      end
      item
        Name = 'ChequeNro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ChequeFecha'
        DataType = ftDate
      end
      item
        Name = 'ChequeBanco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Transporte'
        DataType = ftInteger
      end
      item
        Name = 'hora'
        DataType = ftTime
      end
      item
        Name = 'MontoComision'
        DataType = ftCurrency
      end
      item
        Name = 'Observaciones'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'DescontoStock'
        DataType = ftBoolean
      end
      item
        Name = 'Usuario'
        DataType = ftInteger
      end
      item
        Name = 'Turno'
        DataType = ftInteger
      end
      item
        Name = 'Provincia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Pventa'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Subido'
        DataType = ftBoolean
      end>
    TableName = 'tbremito'
    Exclusive = False
    Left = 32
    Top = 194
    object TLocalRemitoid: TAutoIncField
      FieldName = 'id'
    end
    object TLocalRemitoNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TLocalRemitoFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLocalRemitoNombreCli: TStringField
      FieldName = 'NombreCli'
      Size = 50
    end
    object TLocalRemitoCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TLocalRemitoDirCliente: TStringField
      FieldName = 'DirCliente'
      Size = 50
    end
    object TLocalRemitoCuitCliente: TStringField
      FieldName = 'CuitCliente'
      Size = 14
    end
    object TLocalRemitoTipoIva: TSmallintField
      FieldName = 'TipoIva'
    end
    object TLocalRemitoCondiciones: TStringField
      FieldName = 'Condiciones'
    end
    object TLocalRemitoVendedor: TSmallintField
      FieldName = 'Vendedor'
    end
    object TLocalRemitoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TLocalRemitoFechaVenc: TDateField
      FieldName = 'FechaVenc'
    end
    object TLocalRemitoNeto: TCurrencyField
      FieldName = 'Neto'
    end
    object TLocalRemitoTarjeta: TStringField
      FieldName = 'Tarjeta'
      Size = 30
    end
    object TLocalRemitoNroTarjeta: TStringField
      FieldName = 'NroTarjeta'
      Size = 22
    end
    object TLocalRemitoMontoTarjeta: TCurrencyField
      FieldName = 'MontoTarjeta'
    end
    object TLocalRemitoEfectivo: TCurrencyField
      FieldName = 'Efectivo'
    end
    object TLocalRemitoTipoFactura: TStringField
      FieldName = 'TipoFactura'
      Size = 1
    end
    object TLocalRemitoSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object TLocalRemitoMontoDescuento: TCurrencyField
      FieldName = 'MontoDescuento'
    end
    object TLocalRemitoDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object TLocalRemitoPagaComision: TBooleanField
      FieldName = 'PagaComision'
    end
    object TLocalRemitoComision: TFloatField
      FieldName = 'Comision'
    end
    object TLocalRemitoLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 30
    end
    object TLocalRemitoFacturado: TBooleanField
      FieldName = 'Facturado'
    end
    object TLocalRemitoCheque: TFloatField
      FieldName = 'Cheque'
    end
    object TLocalRemitoChequeNro: TStringField
      FieldName = 'ChequeNro'
    end
    object TLocalRemitoChequeFecha: TDateField
      FieldName = 'ChequeFecha'
    end
    object TLocalRemitoChequeBanco: TStringField
      FieldName = 'ChequeBanco'
    end
    object TLocalRemitoTransporte: TIntegerField
      FieldName = 'Transporte'
    end
    object TLocalRemitohora: TTimeField
      FieldName = 'hora'
    end
    object TLocalRemitoMontoComision: TCurrencyField
      FieldName = 'MontoComision'
    end
    object TLocalRemitoObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 130
    end
    object TLocalRemitoDescontoStock: TBooleanField
      FieldName = 'DescontoStock'
    end
    object TLocalRemitoUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object TLocalRemitoTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TLocalRemitoProvincia: TStringField
      FieldName = 'Provincia'
    end
    object TLocalRemitoPventa: TStringField
      FieldName = 'Pventa'
      Size = 4
    end
    object TLocalRemitoSubido: TBooleanField
      FieldName = 'Subido'
    end
  end
  object TLocalVendedores: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Id'
        Fields = 'Id'
      end
      item
        Name = 'Codigo'
        Fields = 'Codigo'
      end
      item
        Name = 'direccion'
        Fields = 'Direccion'
      end
      item
        Name = 'telefono'
        Fields = 'Telefono'
      end
      item
        Name = 'nombre'
        Fields = 'Nombre'
      end>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Comentarios'
        DataType = ftMemo
      end
      item
        Name = 'Sueldo'
        DataType = ftFloat
      end
      item
        Name = 'Comision'
        DataType = ftFloat
      end
      item
        Name = 'mail'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Documento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Provincia'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Zona'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ComisionSobreNeto'
        DataType = ftBoolean
      end
      item
        Name = 'Clave'
        DataType = ftString
        Size = 8
      end>
    TableName = 'tbVendedores'
    Exclusive = False
    Left = 32
    Top = 241
    object TLocalVendedoresId: TAutoIncField
      FieldName = 'Id'
    end
    object TLocalVendedoresCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TLocalVendedoresNombre: TStringField
      FieldName = 'Nombre'
      Size = 25
    end
    object TLocalVendedoresDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object TLocalVendedoresTelefono: TStringField
      FieldName = 'Telefono'
      Size = 30
    end
    object TLocalVendedoresCelular: TStringField
      FieldName = 'Celular'
      Size = 30
    end
    object TLocalVendedoresComentarios: TMemoField
      FieldName = 'Comentarios'
      BlobType = ftMemo
    end
    object TLocalVendedoresSueldo: TFloatField
      FieldName = 'Sueldo'
    end
    object TLocalVendedoresComision: TFloatField
      FieldName = 'Comision'
    end
    object TLocalVendedoresmail: TStringField
      FieldName = 'mail'
      Size = 50
    end
    object TLocalVendedoresDocumento: TStringField
      FieldName = 'Documento'
    end
    object TLocalVendedoresLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 25
    end
    object TLocalVendedoresProvincia: TStringField
      FieldName = 'Provincia'
      Size = 25
    end
    object TLocalVendedoresCP: TStringField
      FieldName = 'CP'
      Size = 8
    end
    object TLocalVendedoresZona: TStringField
      FieldName = 'Zona'
      Size = 25
    end
    object TLocalVendedoresComisionSobreNeto: TBooleanField
      FieldName = 'ComisionSobreNeto'
    end
    object TLocalVendedoresClave: TStringField
      FieldName = 'Clave'
      Size = 8
    end
  end
  object TLocalItemsFac: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'RecordId'
        Fields = 'RecordId'
      end
      item
        Name = 'Id'
        Fields = 'Id'
      end>
    FieldDefs = <
      item
        Name = 'RecordId'
        DataType = ftAutoInc
      end
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Cantidad'
        DataType = ftFloat
      end
      item
        Name = 'CodArticulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Marca'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PrecUni'
        DataType = ftCurrency
      end
      item
        Name = 'Descuento'
        DataType = ftFloat
      end
      item
        Name = 'Iva'
        DataType = ftFloat
      end
      item
        Name = 'Costo'
        DataType = ftCurrency
      end
      item
        Name = 'NroIVA'
        DataType = ftSmallint
      end
      item
        Name = 'CostoPromedio'
        DataType = ftCurrency
      end
      item
        Name = 'Unidad'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Talle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PorcentajeComision'
        DataType = ftFloat
      end>
    TableName = 'tbitefac'
    Exclusive = False
    Left = 32
    Top = 333
    object TLocalItemsFacRecordId: TAutoIncField
      FieldName = 'RecordId'
    end
    object TLocalItemsFacId: TIntegerField
      FieldName = 'Id'
    end
    object TLocalItemsFacNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TLocalItemsFacCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TLocalItemsFacCodArticulo: TStringField
      FieldName = 'CodArticulo'
    end
    object TLocalItemsFacDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLocalItemsFacMarca: TStringField
      FieldName = 'Marca'
    end
    object TLocalItemsFacPrecUni: TCurrencyField
      FieldName = 'PrecUni'
    end
    object TLocalItemsFacDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object TLocalItemsFacIva: TFloatField
      FieldName = 'Iva'
    end
    object TLocalItemsFacCosto: TCurrencyField
      FieldName = 'Costo'
    end
    object TLocalItemsFacNroIVA: TSmallintField
      FieldName = 'NroIVA'
    end
    object TLocalItemsFacCostoPromedio: TCurrencyField
      FieldName = 'CostoPromedio'
    end
    object TLocalItemsFacUnidad: TStringField
      FieldName = 'Unidad'
    end
    object TLocalItemsFacTalle: TStringField
      FieldName = 'Talle'
    end
    object TLocalItemsFacColor: TStringField
      FieldName = 'Color'
      Size = 10
    end
    object TLocalItemsFacPorcentajeComision: TFloatField
      FieldName = 'PorcentajeComision'
    end
  end
  object TLocalItemsRemito: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'CodArticulo'
        Fields = 'CodArticulo'
      end
      item
        Name = 'Id'
        Fields = 'id'
      end
      item
        Name = 'RecordId'
        Fields = 'RecordId'
      end>
    FieldDefs = <
      item
        Name = 'RecordId'
        DataType = ftAutoInc
      end
      item
        Name = 'Costo'
        DataType = ftFloat
      end
      item
        Name = 'NroIva'
        DataType = ftSmallint
      end
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'Cantidad'
        DataType = ftFloat
      end
      item
        Name = 'CodArticulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Marca'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PrecUni'
        DataType = ftFloat
      end
      item
        Name = 'Descuento'
        DataType = ftFloat
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end
      item
        Name = 'Iva'
        DataType = ftFloat
      end
      item
        Name = 'CostoPromedio'
        DataType = ftFloat
      end
      item
        Name = 'Unidad'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PorcentajeComision'
        DataType = ftFloat
      end
      item
        Name = 'CantBultos'
        DataType = ftFloat
      end
      item
        Name = 'ArtxBulto'
        DataType = ftFloat
      end
      item
        Name = 'RemanenteBulto'
        DataType = ftFloat
      end
      item
        Name = 'Talle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Color'
        DataType = ftString
        Size = 10
      end>
    TableName = 'tbitemremito'
    Exclusive = False
    Left = 32
    Top = 379
    object TLocalItemsRemitoRecordId: TAutoIncField
      FieldName = 'RecordId'
    end
    object TLocalItemsRemitoCosto: TFloatField
      FieldName = 'Costo'
    end
    object TLocalItemsRemitoNroIva: TSmallintField
      FieldName = 'NroIva'
    end
    object TLocalItemsRemitoid: TIntegerField
      FieldName = 'id'
    end
    object TLocalItemsRemitoCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object TLocalItemsRemitoCodArticulo: TStringField
      FieldName = 'CodArticulo'
    end
    object TLocalItemsRemitoDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLocalItemsRemitoMarca: TStringField
      FieldName = 'Marca'
    end
    object TLocalItemsRemitoPrecUni: TFloatField
      FieldName = 'PrecUni'
    end
    object TLocalItemsRemitoDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object TLocalItemsRemitoTotal: TFloatField
      FieldName = 'Total'
    end
    object TLocalItemsRemitoIva: TFloatField
      FieldName = 'Iva'
    end
    object TLocalItemsRemitoCostoPromedio: TFloatField
      FieldName = 'CostoPromedio'
    end
    object TLocalItemsRemitoUnidad: TStringField
      FieldName = 'Unidad'
    end
    object TLocalItemsRemitoPorcentajeComision: TFloatField
      FieldName = 'PorcentajeComision'
    end
    object TLocalItemsRemitoCantBultos: TFloatField
      FieldName = 'CantBultos'
    end
    object TLocalItemsRemitoArtxBulto: TFloatField
      FieldName = 'ArtxBulto'
    end
    object TLocalItemsRemitoRemanenteBulto: TFloatField
      FieldName = 'RemanenteBulto'
    end
    object TLocalItemsRemitoTalle: TStringField
      FieldName = 'Talle'
    end
    object TLocalItemsRemitoColor: TStringField
      FieldName = 'Color'
      Size = 10
    end
  end
  object TLocalArticulos: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Codigo'
        Fields = 'Codigo'
      end
      item
        Name = 'Descripcion'
        Fields = 'Descripcion'
      end
      item
        Name = 'Marca'
        Fields = 'Marca;Descripcion'
      end
      item
        Name = 'Rubro'
        Fields = 'Rubro'
      end
      item
        Name = 'CodigoProv'
        Fields = 'CodigoProv'
      end
      item
        Name = 'rubroDescrip'
        Fields = 'Rubro;Descripcion'
      end
      item
        Name = 'IdprovDescrip'
        Fields = 'idProveedor;Descripcion'
      end
      item
        Name = 'Id'
        Fields = 'id'
        Options = [ixUnique]
      end
      item
        Name = 'FModif'
        DescFields = 'FechaModif'
        Fields = 'FechaModif'
        Options = [ixDescending]
      end
      item
        Name = 'FCompra'
        DescFields = 'FechaCompra'
        Fields = 'FechaCompra'
        Options = [ixDescending]
      end
      item
        Name = 'rubroCodigo'
        Fields = 'Rubro;Codigo'
      end>
    FieldDefs = <
      item
        Name = 'Codigo'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Rubro'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Marca'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PrecioVenta'
        DataType = ftFloat
      end
      item
        Name = 'PrecioCompra'
        DataType = ftFloat
      end
      item
        Name = 'StockMinimo'
        DataType = ftFloat
      end
      item
        Name = 'Stock'
        DataType = ftFloat
      end
      item
        Name = 'AlicuotaIva'
        DataType = ftFloat
      end
      item
        Name = 'Deposito'
        DataType = ftFloat
      end
      item
        Name = 'id'
        DataType = ftAutoInc
      end
      item
        Name = 'FechaCompra'
        DataType = ftDate
      end
      item
        Name = 'idProveedor'
        DataType = ftInteger
      end
      item
        Name = 'Lista2'
        DataType = ftFloat
      end
      item
        Name = 'Lista3'
        DataType = ftFloat
      end
      item
        Name = 'Unidad'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Lista4'
        DataType = ftFloat
      end
      item
        Name = 'PorcentajeGanancia'
        DataType = ftFloat
      end
      item
        Name = 'Calculado'
        DataType = ftBoolean
      end
      item
        Name = 'CodigoProv'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CostoPromedio'
        DataType = ftFloat
      end
      item
        Name = 'CostoEnDolares'
        DataType = ftBoolean
      end
      item
        Name = 'FechaModif'
        DataType = ftDate
      end
      item
        Name = 'PrecioListaProveedor'
        DataType = ftFloat
      end
      item
        Name = 'StockInicial'
        DataType = ftFloat
      end
      item
        Name = 'Ubicacion'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Lista1EnDolares'
        DataType = ftBoolean
      end
      item
        Name = 'Dto1'
        DataType = ftFloat
      end
      item
        Name = 'Dto2'
        DataType = ftFloat
      end
      item
        Name = 'Dto3'
        DataType = ftFloat
      end
      item
        Name = 'Impuesto'
        DataType = ftFloat
      end
      item
        Name = 'EnPromocion'
        DataType = ftBoolean
      end
      item
        Name = 'UsaTalle'
        DataType = ftBoolean
      end
      item
        Name = 'Compuesto'
        DataType = ftBoolean
      end
      item
        Name = 'Combustible'
        DataType = ftBoolean
      end
      item
        Name = 'ImpuestoPorcentual'
        DataType = ftBoolean
      end>
    TableName = 'tbarticulos'
    Exclusive = False
    Left = 32
    Top = 426
    object TLocalArticulosCodigo: TStringField
      FieldName = 'Codigo'
      Required = True
    end
    object TLocalArticulosRubro: TStringField
      FieldName = 'Rubro'
      Size = 25
    end
    object TLocalArticulosDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLocalArticulosMarca: TStringField
      FieldName = 'Marca'
    end
    object TLocalArticulosPrecioVenta: TFloatField
      FieldName = 'PrecioVenta'
    end
    object TLocalArticulosPrecioCompra: TFloatField
      FieldName = 'PrecioCompra'
    end
    object TLocalArticulosStockMinimo: TFloatField
      FieldName = 'StockMinimo'
    end
    object TLocalArticulosStock: TFloatField
      FieldName = 'Stock'
    end
    object TLocalArticulosAlicuotaIva: TFloatField
      FieldName = 'AlicuotaIva'
    end
    object TLocalArticulosDeposito: TFloatField
      FieldName = 'Deposito'
    end
    object TLocalArticulosid: TAutoIncField
      FieldName = 'id'
    end
    object TLocalArticulosFechaCompra: TDateField
      FieldName = 'FechaCompra'
    end
    object TLocalArticulosidProveedor: TIntegerField
      FieldName = 'idProveedor'
    end
    object TLocalArticulosLista2: TFloatField
      FieldName = 'Lista2'
    end
    object TLocalArticulosLista3: TFloatField
      FieldName = 'Lista3'
    end
    object TLocalArticulosUnidad: TStringField
      FieldName = 'Unidad'
      Size = 30
    end
    object TLocalArticulosLista4: TFloatField
      FieldName = 'Lista4'
    end
    object TLocalArticulosPorcentajeGanancia: TFloatField
      FieldName = 'PorcentajeGanancia'
    end
    object TLocalArticulosCalculado: TBooleanField
      FieldName = 'Calculado'
    end
    object TLocalArticulosCodigoProv: TStringField
      FieldName = 'CodigoProv'
    end
    object TLocalArticulosCostoPromedio: TFloatField
      FieldName = 'CostoPromedio'
    end
    object TLocalArticulosCostoEnDolares: TBooleanField
      FieldName = 'CostoEnDolares'
    end
    object TLocalArticulosFechaModif: TDateField
      FieldName = 'FechaModif'
    end
    object TLocalArticulosPrecioListaProveedor: TFloatField
      FieldName = 'PrecioListaProveedor'
    end
    object TLocalArticulosStockInicial: TFloatField
      FieldName = 'StockInicial'
    end
    object TLocalArticulosUbicacion: TStringField
      FieldName = 'Ubicacion'
      Size = 6
    end
    object TLocalArticulosLista1EnDolares: TBooleanField
      FieldName = 'Lista1EnDolares'
    end
    object TLocalArticulosDto1: TFloatField
      FieldName = 'Dto1'
    end
    object TLocalArticulosDto2: TFloatField
      FieldName = 'Dto2'
    end
    object TLocalArticulosDto3: TFloatField
      FieldName = 'Dto3'
    end
    object TLocalArticulosImpuesto: TFloatField
      FieldName = 'Impuesto'
    end
    object TLocalArticulosEnPromocion: TBooleanField
      FieldName = 'EnPromocion'
    end
    object TLocalArticulosUsaTalle: TBooleanField
      FieldName = 'UsaTalle'
    end
    object TLocalArticulosCompuesto: TBooleanField
      FieldName = 'Compuesto'
    end
    object TLocalArticulosCombustible: TBooleanField
      FieldName = 'Combustible'
    end
    object TLocalArticulosImpuestoPorcentual: TBooleanField
      FieldName = 'ImpuestoPorcentual'
    end
  end
  object TLisboaRemito: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'remito'
    Left = 160
    Top = 190
    object TLisboaRemitoid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TLisboaRemitoid_tabla: TIntegerField
      FieldName = 'id_tabla'
    end
    object TLisboaRemitoNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TLisboaRemitoFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLisboaRemitoNombreCli: TStringField
      FieldName = 'NombreCli'
      Size = 50
    end
    object TLisboaRemitoCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TLisboaRemitoDirCliente: TStringField
      FieldName = 'DirCliente'
      Size = 50
    end
    object TLisboaRemitoCuitCliente: TStringField
      FieldName = 'CuitCliente'
      Size = 14
    end
    object TLisboaRemitoTipoIva: TSmallintField
      FieldName = 'TipoIva'
    end
    object TLisboaRemitoCondiciones: TStringField
      FieldName = 'Condiciones'
    end
    object TLisboaRemitoVendedor: TSmallintField
      FieldName = 'Vendedor'
    end
    object TLisboaRemitoTotal: TFloatField
      FieldName = 'Total'
    end
    object TLisboaRemitoFechaVenc: TDateField
      FieldName = 'FechaVenc'
    end
    object TLisboaRemitoNeto: TFloatField
      FieldName = 'Neto'
    end
    object TLisboaRemitoTarjeta: TStringField
      FieldName = 'Tarjeta'
      Size = 30
    end
    object TLisboaRemitoNroTarjeta: TStringField
      FieldName = 'NroTarjeta'
      Size = 22
    end
    object TLisboaRemitoMontoTarjeta: TFloatField
      FieldName = 'MontoTarjeta'
    end
    object TLisboaRemitoEfectivo: TFloatField
      FieldName = 'Efectivo'
    end
    object TLisboaRemitoTipoFactura: TStringField
      FieldName = 'TipoFactura'
      Size = 1
    end
    object TLisboaRemitoSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object TLisboaRemitoMontoDescuento: TFloatField
      FieldName = 'MontoDescuento'
    end
    object TLisboaRemitoDescuento: TFloatField
      FieldName = 'Descuento'
    end
    object TLisboaRemitoPagaComision: TSmallintField
      FieldName = 'PagaComision'
    end
    object TLisboaRemitoComision: TFloatField
      FieldName = 'Comision'
    end
    object TLisboaRemitoLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 30
    end
    object TLisboaRemitoFacturado: TSmallintField
      FieldName = 'Facturado'
    end
    object TLisboaRemitoCheque: TFloatField
      FieldName = 'Cheque'
    end
    object TLisboaRemitoChequeNro: TStringField
      FieldName = 'ChequeNro'
    end
    object TLisboaRemitoChequeFecha: TDateField
      FieldName = 'ChequeFecha'
    end
    object TLisboaRemitoChequeBanco: TStringField
      FieldName = 'ChequeBanco'
    end
    object TLisboaRemitoTransporte: TIntegerField
      FieldName = 'Transporte'
    end
    object TLisboaRemitoMontoComision: TFloatField
      FieldName = 'MontoComision'
    end
    object TLisboaRemitoObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 130
    end
    object TLisboaRemitoDescontoStock: TFloatField
      FieldName = 'DescontoStock'
    end
    object TLisboaRemitoUsuario: TIntegerField
      FieldName = 'Usuario'
    end
    object TLisboaRemitoTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TLisboaRemitoProvincia: TStringField
      FieldName = 'Provincia'
    end
    object TLisboaRemitoPventa: TStringField
      FieldName = 'Pventa'
      Size = 4
    end
    object TLisboaRemitoSubido: TSmallintField
      FieldName = 'Subido'
    end
  end
  object BDLisboa: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=lisbo' +
      'a;Initial Catalog=lisboa'
    Left = 160
    Top = 96
  end
  object TLisboaFacturas: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'facturas'
    Left = 160
    Top = 143
    object TLisboaFacturasid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TLisboaFacturasNumero: TStringField
      FieldName = 'Numero'
      Size = 8
    end
    object TLisboaFacturasFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLisboaFacturasNombreCli: TStringField
      FieldName = 'NombreCli'
      Size = 50
    end
    object TLisboaFacturasCodCliente: TIntegerField
      FieldName = 'CodCliente'
    end
    object TLisboaFacturasDirCliente: TStringField
      FieldName = 'DirCliente'
      Size = 50
    end
    object TLisboaFacturasCuitCliente: TStringField
      FieldName = 'CuitCliente'
      Size = 14
    end
    object TLisboaFacturasTipoIva: TSmallintField
      FieldName = 'TipoIva'
    end
    object TLisboaFacturasCondiciones: TStringField
      FieldName = 'Condiciones'
    end
    object TLisboaFacturasVendedor: TSmallintField
      FieldName = 'Vendedor'
    end
    object TLisboaFacturasFechaVenc: TDateField
      FieldName = 'FechaVenc'
    end
    object TLisboaFacturasTotal: TFloatField
      FieldName = 'Total'
    end
    object TLisboaFacturasTotalConRedondeo: TFloatField
      FieldName = 'TotalConRedondeo'
    end
    object TLisboaFacturasNeto: TFloatField
      FieldName = 'Neto'
    end
    object TLisboaFacturasMontoIVA1: TFloatField
      FieldName = 'MontoIVA1'
    end
    object TLisboaFacturasMontoIVA2: TFloatField
      FieldName = 'MontoIVA2'
    end
    object TLisboaFacturasTarjeta: TStringField
      FieldName = 'Tarjeta'
      Size = 30
    end
    object TLisboaFacturasNroTarjeta: TStringField
      FieldName = 'NroTarjeta'
      Size = 22
    end
    object TLisboaFacturasMontoTarjeta: TFloatField
      FieldName = 'MontoTarjeta'
    end
    object TLisboaFacturasEfectivo: TFloatField
      FieldName = 'Efectivo'
    end
    object TLisboaFacturasPresupuestoNro: TIntegerField
      FieldName = 'PresupuestoNro'
    end
    object TLisboaFacturasTipoFactura: TStringField
      FieldName = 'TipoFactura'
      Size = 1
    end
    object TLisboaFacturasSaldo: TFloatField
      FieldName = 'Saldo'
    end
    object TLisboaFacturasmontodescuento: TFloatField
      FieldName = 'montodescuento'
    end
    object TLisboaFacturasdescuento: TFloatField
      FieldName = 'descuento'
    end
    object TLisboaFacturasNC: TSmallintField
      FieldName = 'NC'
    end
    object TLisboaFacturasPagaComision: TSmallintField
      FieldName = 'PagaComision'
    end
    object TLisboaFacturasComision: TFloatField
      FieldName = 'Comision'
    end
    object TLisboaFacturasCheque: TFloatField
      FieldName = 'Cheque'
    end
    object TLisboaFacturasChequeNro: TStringField
      FieldName = 'ChequeNro'
    end
    object TLisboaFacturasChequeFecha: TDateField
      FieldName = 'ChequeFecha'
    end
    object TLisboaFacturasChequeBanco: TStringField
      FieldName = 'ChequeBanco'
    end
    object TLisboaFacturasProforma: TSmallintField
      FieldName = 'Proforma'
    end
    object TLisboaFacturasLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 30
    end
    object TLisboaFacturasDolar: TSmallintField
      FieldName = 'Dolar'
    end
    object TLisboaFacturasObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 130
    end
    object TLisboaFacturasRemitoNro: TStringField
      FieldName = 'RemitoNro'
    end
    object TLisboaFacturasUsuario: TSmallintField
      FieldName = 'Usuario'
    end
    object TLisboaFacturasZona: TStringField
      FieldName = 'Zona'
      Size = 25
    end
    object TLisboaFacturasMontoComision: TFloatField
      FieldName = 'MontoComision'
    end
    object TLisboaFacturasNroOrdenCompra: TStringField
      FieldName = 'NroOrdenCompra'
      Size = 10
    end
    object TLisboaFacturasDescontado: TSmallintField
      FieldName = 'Descontado'
    end
    object TLisboaFacturasMontoSenia: TFloatField
      FieldName = 'MontoSenia'
    end
    object TLisboaFacturasNetoNoGravado: TFloatField
      FieldName = 'NetoNoGravado'
    end
    object TLisboaFacturasNeto1: TFloatField
      FieldName = 'Neto1'
    end
    object TLisboaFacturasNeto2: TFloatField
      FieldName = 'Neto2'
    end
    object TLisboaFacturasImpuesto: TFloatField
      FieldName = 'Impuesto'
    end
    object TLisboaFacturasCAE: TStringField
      FieldName = 'CAE'
      Size = 14
    end
    object TLisboaFacturasFechaVenceCAE: TDateField
      FieldName = 'FechaVenceCAE'
    end
    object TLisboaFacturasPorcentajeTarjeta: TFloatField
      FieldName = 'PorcentajeTarjeta'
    end
    object TLisboaFacturasTurno: TIntegerField
      FieldName = 'Turno'
    end
    object TLisboaFacturasProvincia: TStringField
      FieldName = 'Provincia'
    end
    object TLisboaFacturasImpuesto2: TFloatField
      FieldName = 'Impuesto2'
    end
    object TLisboaFacturasMontoPuntos: TFloatField
      FieldName = 'MontoPuntos'
    end
    object TLisboaFacturasCotizacionDolar: TFloatField
      FieldName = 'CotizacionDolar'
    end
    object TLisboaFacturasTotalDolar: TFloatField
      FieldName = 'TotalDolar'
    end
    object TLisboaFacturasSubido: TSmallintField
      FieldName = 'Subido'
    end
    object TLisboaFacturasid_tabla: TIntegerField
      FieldName = 'id_tabla'
    end
    object TLisboaFacturasBase_datos: TStringField
      FieldName = 'Base_datos'
    end
  end
  object TLisboaVendedores: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'vendedores'
    Left = 160
    Top = 245
  end
  object TLisboaEgresos: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'egresos'
    Left = 160
    Top = 284
  end
  object TLisboaItemsRemito: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'iteremito'
    Left = 160
    Top = 379
  end
  object TLisboaCobranzas: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'cobranzas'
    Left = 160
    Top = 473
  end
  object TLisboaItemsFac: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'itefac'
    Left = 160
    Top = 332
  end
  object ABSQuery1: TABSQuery
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Left = 32
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = BDLisboa
    Parameters = <>
    Left = 160
    Top = 48
  end
  object TLocalCobranzas: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'RecordId'
        Fields = 'RecordId'
      end
      item
        Name = 'NroDoc'
        Fields = 'NroDoc'
      end
      item
        Name = 'Id'
        Fields = 'Id'
      end
      item
        Name = 'FechaNroyTipo'
        Fields = 'Fecha;NroDoc;Tipo'
      end
      item
        Name = 'FormaPago'
        Fields = 'FormaPago'
      end>
    FieldDefs = <
      item
        Name = 'NroDoc'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'Vence'
        DataType = ftDate
      end
      item
        Name = 'Movimiento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TotalFactura'
        DataType = ftCurrency
      end
      item
        Name = 'Pago'
        DataType = ftCurrency
      end
      item
        Name = 'Saldo'
        DataType = ftCurrency
      end
      item
        Name = 'CodigoCliente'
        DataType = ftInteger
      end
      item
        Name = 'NombreCli'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ReciboNro'
        DataType = ftInteger
      end
      item
        Name = 'RecordId'
        DataType = ftAutoInc
      end
      item
        Name = 'Obs'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'FormaPago'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NroCheque'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Banco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FechaCheque'
        DataType = ftDate
      end
      item
        Name = 'Queda'
        DataType = ftBoolean
      end
      item
        Name = 'idFactura'
        DataType = ftInteger
      end
      item
        Name = 'Avanzada'
        DataType = ftBoolean
      end>
    TableName = 'tbCobranzas'
    Exclusive = False
    Left = 32
    Top = 472
    object TLocalCobranzasNroDoc: TStringField
      FieldName = 'NroDoc'
      Size = 8
    end
    object TLocalCobranzasFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLocalCobranzasVence: TDateField
      FieldName = 'Vence'
    end
    object TLocalCobranzasMovimiento: TStringField
      FieldName = 'Movimiento'
    end
    object TLocalCobranzasTotalFactura: TCurrencyField
      FieldName = 'TotalFactura'
    end
    object TLocalCobranzasPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TLocalCobranzasSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object TLocalCobranzasCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object TLocalCobranzasNombreCli: TStringField
      FieldName = 'NombreCli'
      Size = 50
    end
    object TLocalCobranzasReciboNro: TIntegerField
      FieldName = 'ReciboNro'
    end
    object TLocalCobranzasRecordId: TAutoIncField
      FieldName = 'RecordId'
    end
    object TLocalCobranzasObs: TStringField
      FieldName = 'Obs'
      Size = 50
    end
    object TLocalCobranzasTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object TLocalCobranzasId: TIntegerField
      FieldName = 'Id'
    end
    object TLocalCobranzasFormaPago: TStringField
      FieldName = 'FormaPago'
    end
    object TLocalCobranzasNroCheque: TStringField
      FieldName = 'NroCheque'
    end
    object TLocalCobranzasBanco: TStringField
      FieldName = 'Banco'
    end
    object TLocalCobranzasFechaCheque: TDateField
      FieldName = 'FechaCheque'
    end
    object TLocalCobranzasQueda: TBooleanField
      FieldName = 'Queda'
    end
    object TLocalCobranzasidFactura: TIntegerField
      FieldName = 'idFactura'
    end
    object TLocalCobranzasAvanzada: TBooleanField
      FieldName = 'Avanzada'
    end
  end
  object TLocalIngresos: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Id'
        Fields = 'Id'
      end
      item
        Name = 'Descripcion'
        Fields = 'Descripcion'
      end
      item
        Name = 'fecha'
        Fields = 'Fecha'
      end>
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftAutoInc
      end
      item
        Name = 'Descripcion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Monto'
        DataType = ftFloat
      end
      item
        Name = 'Fecha'
        DataType = ftDate
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Observaciones'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Usuario'
        DataType = ftInteger
      end>
    TableName = 'tbingresos'
    Exclusive = False
    Left = 32
    Top = 518
    object TLocalIngresosId: TAutoIncField
      FieldName = 'Id'
    end
    object TLocalIngresosDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLocalIngresosMonto: TFloatField
      FieldName = 'Monto'
    end
    object TLocalIngresosFecha: TDateField
      FieldName = 'Fecha'
    end
    object TLocalIngresosNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object TLocalIngresosObservaciones: TStringField
      FieldName = 'Observaciones'
      Size = 50
    end
    object TLocalIngresosUsuario: TIntegerField
      FieldName = 'Usuario'
    end
  end
  object TLocalClientes: TABSTable
    CurrentVersion = '7.93 '
    DatabaseName = 'C:\Users\Campeoni\Desktop\tablas\tablas.abs'
    InMemory = False
    ReadOnly = False
    Active = True
    StoreDefs = True
    IndexDefs = <
      item
        Name = 'Nombre'
        Fields = 'Nombre'
      end
      item
        Name = 'Codigo'
        Fields = 'Codigo'
      end
      item
        Name = 'Direccion'
        Fields = 'Direccion'
      end
      item
        Name = 'Telefono'
        Fields = 'Telefono'
      end
      item
        Name = 'Cuit'
        Fields = 'CUIT'
      end
      item
        Name = 'Contacto'
        Fields = 'Contacto'
      end
      item
        Name = 'Saldo'
        Fields = 'Saldo'
      end
      item
        Name = 'LocalidadNombre'
        Fields = 'Localidad;Nombre'
      end
      item
        Name = 'Vendedor'
        Fields = 'Vendedor'
      end
      item
        Name = 'IdCliente'
        Fields = 'IdCliente'
        Options = [ixUnique]
      end
      item
        Name = 'CodigoTarjeta'
        Fields = 'CodigoTarjeta'
      end>
    FieldDefs = <
      item
        Name = 'IdCliente'
        DataType = ftAutoInc
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nombre'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Contacto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Direccion'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Localidad'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Provincia'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Telefono'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TipoIva'
        DataType = ftInteger
      end
      item
        Name = 'CUIT'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Web'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Mail'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Saldo'
        DataType = ftCurrency
      end
      item
        Name = 'Observaciones'
        DataType = ftMemo
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Fax'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'LimiteCtaCte'
        DataType = ftCurrency
      end
      item
        Name = 'ListaPrecios'
        DataType = ftInteger
      end
      item
        Name = 'Vendedor'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Transporte'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'SaldoDolar'
        DataType = ftCurrency
      end
      item
        Name = 'Dto'
        DataType = ftFloat
      end
      item
        Name = 'FechaModif'
        DataType = ftDate
      end
      item
        Name = 'Adelanto'
        DataType = ftFloat
      end
      item
        Name = 'Cumple'
        DataType = ftDate
      end
      item
        Name = 'Zona'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Condiciones'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'Rubro'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NombreLista'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Puntos'
        DataType = ftInteger
      end
      item
        Name = 'CodigoTarjeta'
        DataType = ftInteger
      end
      item
        Name = 'Percepciones'
        DataType = ftBoolean
      end
      item
        Name = 'PercepIIBB'
        DataType = ftFloat
      end
      item
        Name = 'PercepMisiones331'
        DataType = ftBoolean
      end>
    TableName = 'tbclientes'
    Exclusive = False
    Left = 32
    Top = 565
    object TLocalClientesIdCliente: TAutoIncField
      FieldName = 'IdCliente'
    end
    object TLocalClientesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object TLocalClientesNombre: TStringField
      FieldName = 'Nombre'
      Size = 50
    end
    object TLocalClientesContacto: TStringField
      FieldName = 'Contacto'
      Size = 50
    end
    object TLocalClientesDireccion: TStringField
      FieldName = 'Direccion'
      Size = 50
    end
    object TLocalClientesLocalidad: TStringField
      FieldName = 'Localidad'
      Size = 30
    end
    object TLocalClientesProvincia: TStringField
      FieldName = 'Provincia'
      Size = 30
    end
    object TLocalClientesCP: TStringField
      FieldName = 'CP'
      Size = 8
    end
    object TLocalClientesTelefono: TStringField
      FieldName = 'Telefono'
      Size = 50
    end
    object TLocalClientesCelular: TStringField
      FieldName = 'Celular'
      Size = 30
    end
    object TLocalClientesTipoIva: TIntegerField
      FieldName = 'TipoIva'
    end
    object TLocalClientesCUIT: TStringField
      FieldName = 'CUIT'
      Size = 14
    end
    object TLocalClientesWeb: TStringField
      FieldName = 'Web'
      Size = 50
    end
    object TLocalClientesMail: TStringField
      FieldName = 'Mail'
      Size = 50
    end
    object TLocalClientesSaldo: TCurrencyField
      FieldName = 'Saldo'
    end
    object TLocalClientesObservaciones: TMemoField
      FieldName = 'Observaciones'
      BlobType = ftMemo
    end
    object TLocalClientesPais: TStringField
      FieldName = 'Pais'
      Size = 30
    end
    object TLocalClientesFax: TStringField
      FieldName = 'Fax'
    end
    object TLocalClientesLimiteCtaCte: TCurrencyField
      FieldName = 'LimiteCtaCte'
    end
    object TLocalClientesListaPrecios: TIntegerField
      FieldName = 'ListaPrecios'
    end
    object TLocalClientesVendedor: TStringField
      FieldName = 'Vendedor'
      Size = 25
    end
    object TLocalClientesTransporte: TStringField
      FieldName = 'Transporte'
      Size = 25
    end
    object TLocalClientesSaldoDolar: TCurrencyField
      FieldName = 'SaldoDolar'
    end
    object TLocalClientesDto: TFloatField
      FieldName = 'Dto'
    end
    object TLocalClientesFechaModif: TDateField
      FieldName = 'FechaModif'
    end
    object TLocalClientesAdelanto: TFloatField
      FieldName = 'Adelanto'
    end
    object TLocalClientesCumple: TDateField
      FieldName = 'Cumple'
    end
    object TLocalClientesZona: TStringField
      FieldName = 'Zona'
      Size = 25
    end
    object TLocalClientesCondiciones: TStringField
      FieldName = 'Condiciones'
      Size = 150
    end
    object TLocalClientesRubro: TStringField
      FieldName = 'Rubro'
      Size = 25
    end
    object TLocalClientesNombreLista: TStringField
      FieldName = 'NombreLista'
    end
    object TLocalClientesPuntos: TIntegerField
      FieldName = 'Puntos'
    end
    object TLocalClientesCodigoTarjeta: TIntegerField
      FieldName = 'CodigoTarjeta'
    end
    object TLocalClientesPercepciones: TBooleanField
      FieldName = 'Percepciones'
    end
    object TLocalClientesPercepIIBB: TFloatField
      FieldName = 'PercepIIBB'
    end
    object TLocalClientesPercepMisiones331: TBooleanField
      FieldName = 'PercepMisiones331'
    end
  end
  object TLisboaArticulos: TADOTable
    Active = True
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'articulos'
    Left = 160
    Top = 426
  end
  object TLisboaIngresos: TADOTable
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'ingresos'
    Left = 160
    Top = 520
  end
  object TLisboaClientes: TADOTable
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'clientes'
    Left = 160
    Top = 568
  end
  object TLisboaStock: TADOTable
    Connection = BDLisboa
    CursorType = ctStatic
    TableName = 'stock'
    Left = 160
    Top = 626
    object TLisboaStockid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TLisboaStockCodigo: TStringField
      FieldName = 'Codigo'
    end
    object TLisboaStockDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 50
    end
    object TLisboaStockRubro: TStringField
      FieldName = 'Rubro'
      Size = 25
    end
    object TLisboaStockMarca: TStringField
      FieldName = 'Marca'
    end
    object TLisboaStockStock: TFloatField
      FieldName = 'Stock'
    end
    object TLisboaStockid_tabla: TIntegerField
      FieldName = 'id_tabla'
    end
    object TLisboaStockBase_datos: TStringField
      FieldName = 'Base_datos'
    end
  end
end
