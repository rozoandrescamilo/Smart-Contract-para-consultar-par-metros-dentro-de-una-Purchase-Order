[![1](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-estados-de-una-Purchase-Order/blob/main/img/1.jpg?raw=true "1")](https://github.com/Smart-Contract-para-consultar-estados-de-una-Purchase-Order/blob/main/img/1.jpg?raw=true "1")

- [Smart Contract para consultar parámetros dentro de una Purchase Order](#smart-contract-para-consultar-parámetros-dentro-de-una-purchase-order)
  - [Función del Smart Contract](#función-del-smart-contract)
  - [Prueba en Entorno de Desarrollo Integrado RemixIDE](#prueba-en-entorno-de-desarrollo-integrado-remixide)

# Smart Contract para consultar parámetros dentro de una Purchase Order

## Función del Smart Contract

En este repositorio se documentará un contrato inteligente usando la red de Ethereum, con el fin de crear un método para consultar los diferentes parámetros que se agregaron dentro de una Purchase Order.

Este es un contrato de Solidity para un validador de parámetros de las Purchase Orders que pasen por el flujo de gestión de datos de DAWIPO. Este contrato utiliza un contrato llamado "Order" que almacena detalles de órdenes de compra utilizando una estructura llamada "OrderDetails". La estructura almacena información, contiene cuatro camposo parámetros: orderId (un entero sin signo), customerName (una cadena), productName (una cadena) y quantity (un entero sin signo). Los estructuras permiten almacenar datos relacionados en un único objeto. Esto puede ser útil para organizar los datos de forma que sea fácil acceder a ellos y utilizarlos.

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Order {
    struct OrderDetails {
        uint256 orderId;
        string customerName;
        string productName;
        uint256 quantity;
    }
```

Luego se está definiendo dos variables públicas, la primera variable es un objeto de asignación llamado "orders" con una clave de tipo uint256 y un valor de tipo OrderDetails. Se trata de una estructura de datos que puede utilizarse para asignar valores uint256 a objetos OrderDetails. La segunda variable es un uint256 llamado "orderCount" que se utiliza para realizar un seguimiento del número total de pedidos almacenados en la asignación.

```solidity
    mapping(uint256 => OrderDetails) public orders;
    uint256 public orderCount;
```

El siguiente fragmento de código es una función llamada "addOrder" y toma 4 parámetros: _orderId, _customerName, _productName y _quantity. Esta función almacena los detalles de un nuevo pedido en la asignación "orders", utilizando el valor actual de "orderCount" como clave. A continuación, incrementa la variable "orderCount" para realizar un seguimiento del número total de pedidos almacenados.

```solidity
    function addOrder(uint256 _orderId, string memory _customerName, string memory _productName, uint256 _quantity) public {
        orders[orderCount] = OrderDetails(_orderId, _customerName, _productName, _quantity);
        orderCount++;
    }
```
El fragmento final de código es una función que se llama "getOrder" y recibe un parámetro, _orderId. Esta función recupera los detalles del pedido con el ID especificado de la asignación "pedidos" y devuelve el ID del pedido, el nombre del cliente, el nombre del producto y la cantidad como una tupla.

```solidity
    function getOrder(uint256 _orderId) public view returns (uint256, string memory, string memory, uint256) {
        OrderDetails memory order = orders[_orderId];
        return (order.orderId, order.customerName, order.productName, order.quantity);
    }
```

## Prueba en Entorno de Desarrollo Integrado RemixIDE

Página oficial de RemixIDE: 
[https://remix.ethereum.org/](https://remix.ethereum.org/ "https://remix.ethereum.org/")

RemixIDE es un IDE (Integrated Development Environment) que se usa desde el navegador, cuenta con componentes para poder desplegar desde ahí los contratos, incluyendo un compilador. En la interfaz, del lado izquierdo, se puede encontrar el menú de ventanas principal para acceder al IDE, al compilador y demás. Desde aquí se hacen las configuraciones iniciales, se agrega el contrato getOrder.sol al directorio de Contracts:

[![1](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/1.png?raw=true "1")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/1.png?raw=true "1")

En la pestaña de SOLIDITY COMPILER se configura la versión del compilador de acuerdo con el pragma establecido en el contrato, el lenguaje que se empleará, la versión de la EVM y otros parámetros. Después de compilarse se podrá desplegar:

[![2](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/2.png?raw=true "2")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/2.png?raw=true "2")

En la sección de DEPLOY, se puede elegir la red que se utilizará, la cuenta con ether de pruebas y los parámetros específicos del contrato, como el límite de gas, que es básicamente una unidad de recurso dentro de la EVM, que se consume al desplegar un contrato y varía de acuerdo a las características de cada uno.

RemixIDE también cuenta con su propia terminal, por lo que podremos visualizar los datos de cada una de las salidas de transacciones y llamados en el contrato en el mismo entorno.

[![3](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/3.png?raw=true "3")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/3.png?raw=true "3")

Desplegado el contrato para obtener parámetros de una orden correctamente, en la interfaz a la izquierda se puede visualizar la pestaña de Deployed Contracts, donde se utiliza esta para interactuar con el smart contract. 

Al iniciar se podrá verificar con el botón orderCount la cantidad inicial de ordenes que se han procesado, empezará con valor 0:

[![4](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/4.png?raw=true "4")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/4.png?raw=true "4")

A manera de ejemplo, en la sección de addOrder se puede registrar una nueva Purchase Order de un Cliente con sus valores de orderId, customerName, productName y quantity.

[![5](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/5.png?raw=true "5")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/5.png?raw=true "5")

Para verificar si es posible retornar los datos del detalle de la orden regstrada es necesario ir a la sección getOrder, se ingresa la orderID con la que se regitro y se hace el llamado. En el mismo panel aparecerá los parámetros correctos donde la posición 0 es uint256 orderId, la posición 1 es el string customerName, la 3 es el string productName y el 4 es la uint256 quantity.

[![6](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/6.png?raw=true "6")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/6.png?raw=true "6")

Como prueba de funcionalidad se agregará otra orden de compra con detalles diferentes y se realizaran las verificaciones:

[![7](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/7.png?raw=true "7")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/7.png?raw=true "7")

Al hacer el respectivo llamado con la fución getOrder se puede verificar que retorna los valores de la nueva orden de compra con ID: "678910", adicionalmente, al comprobar la cantidad de ordenes que hay registradas con el botón orderCount muestra que hay un total de 2:

[![8](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/8.png?raw=true "8")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/8.png?raw=true "8")

Se puede seguir agregando más ordenes de compra y probando el funcionamiento al momento de retornar los detalles de una de las ordenes en especifico, de igual manera retornar la cantidad total de ordenes regitradas hasta el momento:

orderID: "111213"

[![9](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/9.png?raw=true "9")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/9.png?raw=true "9")

orderID: "141516"

[![10](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/10.png?raw=true "10")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/10.png?raw=true "10")

orderID: "171819"

[![11](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/11.png?raw=true "11")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/11.png?raw=true "11")

Verificación de retorno de parámetros y conteo de ordenes en el registro:

[![12](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/12.png?raw=true "12")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/12.png?raw=true "12")

[![13](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/13.png?raw=true "13")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/13.png?raw=true "13")

También se puede retornar los parámetros de una orden anterior a la que se acaba de registrar sin afectar la cuenta de ordenes registradas: 

[![14](https://github.com/rozoandrescamilo/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/14.png?raw=true "14")](https://github.com/Smart-Contract-para-consultar-par-metros-dentro-de-una-Purchase-Order/blob/main/img/14.png?raw=true "14")