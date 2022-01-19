# Prueba Técnica Desarrollador Backend Banco de Occidente 💻

## Problema ❓
Usando una función AWS Lambda (hecha en Java o Node.js) la cual se debe exponer como APi REST a través del servicio AWS Api Gateway, resuelva el siguiene problema:

Hay **n** grupos de amigos y cada grupo es numerado del **1** al **n**. EL **ith** grupo contiene **ai** personas.

Todos viven cerca de una parada de bus, y solo un bus funciona en esa ruta. EL bus vacío llega a la parada y todos los grupos quieren viajar en el bus.
Sin embargo, cada grupo de amigos no quiere separarse. Así que entran al bus solo si el bus puede llevar todo el grupo.

Además, los grupos no quieren cambiar su posición relativa mientras viajan. En otras palabras, el grupo 3 no puede viajar en el bus, a menos que el grupo 1 y el 2 ya hayan viajado, adicionalmente es necesario que todos estén sentados dentro del autobús en este momento, lo que quiere decir que un bus de capacidad **x** solo puede transportar **x** personas simultaneamente. 

Encuentre todos los posibles tamaños de **x** del bus para que pueda transportar a todos los grupos, cumpliendo con las condiciones anteriores, y cada vez que el bus salga de la estación, no haya sillas vacias en el bus(es decir, el número total de personas presentes dentro del bus es igual a **x**).

### Ejemplo de Request
{
    "groups" : "1,2,1,1,1,2,1,3"
}

### Ejemplo de Response
{
    "sizes" : "3,4,6,12"
}

## Arquitectura del Proyecto 👷
Arquitectura usada para el proyecto

| Recurso        | Descripción          | 
| -------------- | -------------------- | 
| aws_deploy     | Infra de AWS         | 
| Jenkis         | Configuración Jenkins| 
| Lambda         | Lógica de la Lambda  | 

### Cŕeditos
Proyecto realizado por **Giovanni Baquero Vargas**