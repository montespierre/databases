INSERT INTO articulos (idArticulo, descArticulo, precioUnit, cantExis) VALUES
('1', 'Lapicero', '3', '50'),
('2', 'Regla', '2', '40'),
('3', 'Tajador', '1', '55'),
('4', 'Pizarra', '40', '30'),
('5', 'Mochila', '100', '40');

INSERT INTO det_venta (idDet_Venta, idVenta, idArticulo, cant, precioUnit, importe) VALUES
('1', '1', '2', '2', '3', '6'),
('2', '1', '3', '2', '1', '2'),
('3', '2', '2', '5', '3', '15'),
('4', '2', '1', '2', '3', '6');

INSERT INTO empleados (idEmpleado, nomEmp, puestoEmp, telEmp) VALUES
('1', 'Waldir Saenz', 'Vendedor', '123456789'),
('2', 'Reimond Manco', 'Vendedor', '321654987'),
('3', 'Reimond', 'Manco', '234123432'),
('4', 'Johan Sotil', 'Vendedor', '345234126'),
('5', 'Messi', 'vendedor', '234234234'),
('6', 'Machito Gomez', 'vendedor', '234234234'),
('7', 'Nolberto Solano', 'vendedor', '234234234'),
('8', 'Cesar Cueto', 'vendedor', '234234234'),
('9', 'Flavio Maestri', 'Vendedor', '234234123'),
('10', 'Carlos Valderrama', 'vendedor', '987456345');

INSERT INTO ventas (idVenta, idEmpleado, fechaVenta, horaVenta, unidTotales, subTotal, igv, imporTotal) VALUES
('1', '2', '2020-05-07', '10:00:00', '5', '8', '1', '9'),
('2', '1', '2020-05-06', '09:00:00', '7', '21', '3', '24');

CREATE SEQUENCE sq_articulos START WITH 50 INCREMENT BY 2;

CREATE SEQUENCE sq_empleados START WITH 50 INCREMENT BY 2;

CREATE SEQUENCE sq_ventas START WITH 50 INCREMENT BY 2;

ALTER TABLE articulos
  ADD PRIMARY KEY (idArticulo);


ALTER TABLE det_venta
  ADD PRIMARY KEY (idDet_Venta),
  ADD KEY fk_Det_Venta_Ventas1_idx (idVenta),
  ADD KEY fk_Det_Venta_Articulos1_idx (idArticulo);


ALTER TABLE empleados
  ADD PRIMARY KEY (idEmpleado);


ALTER TABLE ventas
  ADD PRIMARY KEY (idVenta),
  ADD KEY fk_Ventas_Empleados_idx (idEmpleado);

ALTER TABLE articulos
  MODIFY idArticulo int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE det_venta
  MODIFY idDet_Venta int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE empleados
  MODIFY idEmpleado int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE ventas
  MODIFY idVenta int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE det_venta
  ADD CONSTRAINT fk_Det_Venta_Articulos1 FOREIGN KEY (idArticulo) REFERENCES articulos (idArticulo) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_Det_Venta_Ventas1 FOREIGN KEY (idVenta) REFERENCES ventas (idVenta) ON DELETE NO ACTION ON UPDATE NO ACTION;



ALTER TABLE ventas
  ADD CONSTRAINT fk_Ventas_Empleados FOREIGN KEY (idEmpleado) REFERENCES empleados (idEmpleado) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
