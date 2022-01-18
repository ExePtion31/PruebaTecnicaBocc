const handler = async (event) => {
  console.debug("Lambda ejecutada correctamente");
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Headers": "Content-Type",
      "Access-Control-Allow-Origin": "*",
    },
    body: JSON.stringify("Célula de ahorros"),
  };
};

exports.handler = handler;
