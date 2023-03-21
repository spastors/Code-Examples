# Ejemplo BBDD de la facturación de una empresa de venta de items deportivos

Gracias al código adjunto podrás crear una BBDD en MySQL con la siguiente escructura:

![Diagrama del proyecto](/invoicingMySQL/erDiagram.png)

## Características

Una factura tiene la siguiente información

- Vendedor que realizó la venta
- Cliente que compró el producto
- Fecha y método de pago
- Productos y cantidad vendida

## Aspectos a tener en cuenta en despliegue web

- Puede que exista un cliente que no esté registrado en nuestra BBDD y realicé una compra, por lo que podremos crear un usuario por defecto para este tipo de transacciones.
- La talla esta guardada en un campo varchar porque puede ser decimal, entera o una cadena de texto.
- La fecha de compra se registra en segundos.
- Para visualizar nuestros productos por deporte debemos usar la tabla `itemSports` ya que un mismo producto puede pertenecer a varios.
- Si queremos que un producto tenga varios colores podemos seguir el patrón anterior o añadir las opciones en la tabla `colors`.
- El campo "cardNumber" de la tabla `paymentInformation` puede dejarse vacío si el usuario paga en efectivo.