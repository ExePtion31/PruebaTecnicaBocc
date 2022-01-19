exports.handler = async (event) => {
  console.debug("Lambda ejecutada correctamente");
  const values = JSON.parse(event.body);
  var suma = 0;
  var sizes = [];
  var arrayGroups = values["groups"].split(",").map(function (item) {
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
  const response = [
    {
      sizes: sizes.join(","),
    },
  ];
  return buildResponse(JSON.stringify(response));
};

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
