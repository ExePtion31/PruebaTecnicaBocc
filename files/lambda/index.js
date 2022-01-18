const handler = async (event) => {
    console.debug('Lambda ejecutada correctamente');
    console.debug('Fin de ejecución');
    return {
      statusCode: 200,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Headers" : "Content-Type",
        "Access-Control-Allow-Origin": "*"
      },
    body: JSON.stringify('Célula de ahorros')
    }
}

exports.handler = handler;