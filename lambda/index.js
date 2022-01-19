exports.handler = async (event) => {
  console.debug("Lambda ejecutada correctamente");
  const values = JSON.parse(event.body);
  const response = [
    {
      sizes: buildArray(values),
    },
  ];
  return buildResponse(JSON.stringify(response));
};

function buildArray(array) {
  try {
    var suma = 0;
    var sizes = [];
    var arrayGroups = array["groups"].split(",").map(function (item) {
      return parseInt(item, 10);
    });

    const mayor = Math.max(...arrayGroups);

    for (let i = 0; i < arrayGroups.length; i++) {
      suma += arrayGroups[i];
    }

    for (let index = mayor; index <= suma; index++) {
      if (suma % index == 0) {
        sizes.push(String(index));
      }
    }
    return sizes.join(",");
  } catch (error) {
    return error;
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
