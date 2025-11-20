CREATE TYPE "Presupuestos_forma_pago_enum" AS ENUM (
  'Contado',
  'Credito'
);

CREATE TYPE "Facturas_estado_enum" AS ENUM (
  'Emitida',
  'Anulada'
);

CREATE TABLE "TiposProducto" (
  "id_tipo_producto" SERIAL PRIMARY KEY,
  "nombre" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE "Marcas" (
  "id_marca" SERIAL PRIMARY KEY,
  "nombre" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE "Clientes" (
  "id_cliente" SERIAL PRIMARY KEY,
  "nombre" VARCHAR(100) NOT NULL,
  "direccion" VARCHAR(200),
  "telefono" VARCHAR(20),
  "email" VARCHAR(100) UNIQUE
);

CREATE TABLE "Empleados" (
  "id_empleado" SERIAL PRIMARY KEY,
  "nombre_completo" VARCHAR(100) NOT NULL
);

CREATE TABLE "Depositos" (
  "id_deposito" SERIAL PRIMARY KEY,
  "nombre" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE "EstadosPresupuesto" (
  "id_estado" INT PRIMARY KEY,
  "nombre" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "EstadosPedido" (
  "id_estado" INT PRIMARY KEY,
  "nombre" VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE "Motivos" (
  "id_motivo" SERIAL PRIMARY KEY,
  "descripcion" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "Productos" (
  "id_producto" SERIAL PRIMARY KEY,
  "descripcion" VARCHAR(255) NOT NULL,
  "id_marca" INT NOT NULL,
  "id_tipo_producto" INT NOT NULL,
  "aplica_iva" BOOLEAN NOT NULL DEFAULT TRUE,
  "porcentaje_iva" DECIMAL(5,2) NOT NULL DEFAULT 10,
  "precio_venta" DECIMAL(12,2) NOT NULL,
  "precio_compra" DECIMAL(12,2) NOT NULL
);

CREATE TABLE "Stock" (
  "id_stock" SERIAL PRIMARY KEY,
  "id_producto" INT NOT NULL,
  "id_deposito" INT NOT NULL,
  "cantidad_disponible" INT NOT NULL DEFAULT 0,
  "cantidad_confirmada" INT NOT NULL DEFAULT 0
);

CREATE TABLE "Presupuestos" (
  "id_presupuesto" SERIAL PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "id_empleado" INT NOT NULL,
  "fecha_emision" TIMESTAMP NOT NULL DEFAULT NOW(),
  "forma_pago" "Presupuestos_forma_pago_enum" NOT NULL,
  "id_estado" INT NOT NULL DEFAULT 1,
  "id_motivo" INT,
  "importe_total" DECIMAL(15,2) NOT NULL
);

CREATE TABLE "PresupuestoDetalles" (
  "id_detalle" SERIAL PRIMARY KEY,
  "id_presupuesto" INT NOT NULL,
  "id_producto" INT NOT NULL,
  "cantidad" INT NOT NULL,
  "precio_unitario" DECIMAL(12,2) NOT NULL,
  "subtotal" DECIMAL(15,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

CREATE TABLE "Pedidos" (
  "id_pedido" SERIAL PRIMARY KEY,
  "id_cliente" INT UNIQUE NOT NULL,
  "id_presupuesto" INT UNIQUE NOT NULL,
  "fecha_generacion" TIMESTAMP NOT NULL DEFAULT NOW(),
  "id_estado" INT NOT NULL DEFAULT 1,
  "id_motivo" INT UNIQUE NOT NULL,
  "id_deposito_origen" INT NOT NULL
);

CREATE TABLE "PedidoDetalles" (
  "id_detalle" SERIAL PRIMARY KEY,
  "id_pedido" INT NOT NULL,
  "id_producto" INT NOT NULL,
  "cantidad" INT NOT NULL,
  "precio_unitario" DECIMAL(12,2) NOT NULL,
  "subtotal" DECIMAL(15,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

CREATE TABLE "Facturas" (
  "id_factura" SERIAL PRIMARY KEY,
  "id_pedido" INT NOT NULL,
  "numero_factura" VARCHAR(50) UNIQUE NOT NULL,
  "fecha_emision" TIMESTAMP NOT NULL DEFAULT NOW(),
  "estado" "Facturas_estado_enum" NOT NULL DEFAULT 'Emitida'
);

CREATE TABLE "FacturaDetalles" (
  "id_detalle" SERIAL PRIMARY KEY,
  "id_factura" INT NOT NULL,
  "id_producto" INT NOT NULL,
  "cantidad" INT NOT NULL,
  "precio_unitario" DECIMAL(12,2) NOT NULL,
  "porcentaje_iva" DECIMAL(5,2) NOT NULL,
  "subtotal" DECIMAL(15,2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED
);

CREATE UNIQUE INDEX "uq_producto_deposito" ON "Stock" ("id_producto", "id_deposito");

ALTER TABLE "Productos" ADD CONSTRAINT "fk_producto_marca" FOREIGN KEY ("id_marca") REFERENCES "Marcas" ("id_marca");
ALTER TABLE "Productos" ADD CONSTRAINT "fk_producto_tipo" FOREIGN KEY ("id_tipo_producto") REFERENCES "TiposProducto" ("id_tipo_producto");
ALTER TABLE "Stock" ADD CONSTRAINT "fk_stock_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id_producto");
ALTER TABLE "Stock" ADD CONSTRAINT "fk_stock_deposito" FOREIGN KEY ("id_deposito") REFERENCES "Depositos" ("id_deposito");
ALTER TABLE "Presupuestos" ADD CONSTRAINT "fk_presupuesto_cliente" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id_cliente");
ALTER TABLE "Presupuestos" ADD CONSTRAINT "fk_presupuesto_empleado" FOREIGN KEY ("id_empleado") REFERENCES "Empleados" ("id_empleado");
ALTER TABLE "Presupuestos" ADD CONSTRAINT "fk_presupuesto_estado" FOREIGN KEY ("id_estado") REFERENCES "EstadosPresupuesto" ("id_estado");
ALTER TABLE "Presupuestos" ADD CONSTRAINT "fk_presupuesto_motivo" FOREIGN KEY ("id_motivo") REFERENCES "Motivos" ("id_motivo");
ALTER TABLE "PresupuestoDetalles" ADD CONSTRAINT "fk_detalle_presupuesto" FOREIGN KEY ("id_presupuesto") REFERENCES "Presupuestos" ("id_presupuesto") ON DELETE CASCADE;
ALTER TABLE "PresupuestoDetalles" ADD CONSTRAINT "fk_detalle_producto" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id_producto");
ALTER TABLE "Pedidos" ADD CONSTRAINT "fk_pedido_presupuesto" FOREIGN KEY ("id_presupuesto") REFERENCES "Presupuestos" ("id_presupuesto");
ALTER TABLE "Pedidos" ADD CONSTRAINT "fk_pedido_cliente" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id_cliente");
ALTER TABLE "Pedidos" ADD CONSTRAINT "fk_pedido_motivo" FOREIGN KEY ("id_motivo") REFERENCES "Motivos" ("id_motivo");
ALTER TABLE "Pedidos" ADD CONSTRAINT "fk_pedido_estado" FOREIGN KEY ("id_estado") REFERENCES "EstadosPedido" ("id_estado");
ALTER TABLE "Pedidos" ADD CONSTRAINT "fk_pedido_deposito" FOREIGN KEY ("id_deposito_origen") REFERENCES "Depositos" ("id_deposito");
ALTER TABLE "PedidoDetalles" ADD CONSTRAINT "fk_detalle_pedido" FOREIGN KEY ("id_pedido") REFERENCES "Pedidos" ("id_pedido") ON DELETE CASCADE;
ALTER TABLE "PedidoDetalles" ADD CONSTRAINT "fk_detalle_producto_pedido" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id_producto");
ALTER TABLE "Facturas" ADD CONSTRAINT "fk_factura_pedido" FOREIGN KEY ("id_pedido") REFERENCES "Pedidos" ("id_pedido");
ALTER TABLE "FacturaDetalles" ADD CONSTRAINT "fk_detalle_factura" FOREIGN KEY ("id_factura") REFERENCES "Facturas" ("id_factura") ON DELETE CASCADE;
ALTER TABLE "FacturaDetalles" ADD CONSTRAINT "fk_detalle_producto_factura" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id_producto");
