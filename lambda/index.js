exports.handler = async (event) => {
  console.debug("Lambda ejecutada correctamente");
  const values = JSON.parse(event.body);
  const response = {
    sizes: buildArray(values),
  };
  return buildResponse(JSON.stringify(response));
};

function buildArray(array) {
  try {
    var suma = 0;
    var sizes = [];
    //Array con los valores parseados
    var arrayGroups = array["groups"].split(",").map(function (item) {
      return parseInt(item, 10);
    });

    //Número mayor en el array
    const mayor = Math.max(...arrayGroups);

    //Sumatoria de los elementos del Array
    for (let i = 0; i < arrayGroups.length; i++) {
      suma += arrayGroups[i];
    }

    //Validar que sea multiplo de la sumatoria
    for (let index = mayor; index <= suma; index++) {
      if (suma % index == 0) {
        sizes.push(String(index));
      }
    }
    return sizes.join(",");
  } catch (error) {
    return {error};
  }
}

function buildResponse(body) {
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Headers": "Content-Type",
      "Access-Control-Allow-Origin": "*",
    },
    body: body,
  };
}
