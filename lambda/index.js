exports.handler = async (event) => {
  console.debug("Lambda ejecutada correctamente");
  const arrayGroups = event.body;
  return buildResponse(arrayGroups);
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